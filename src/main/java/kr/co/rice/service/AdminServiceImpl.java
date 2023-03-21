package kr.co.rice.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;


import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



import kr.co.rice.mapper.AdminMapper;
import kr.co.rice.vo.ProductVo;

@Service
@Qualifier("as")
@Transactional
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {

	@Value("${cloud.aws.s3.bucket}")
	private String bucket;
	private final AmazonS3 amazonS3;
	private final AdminMapper mapper;

	@Override
	public String registerProduct(MultipartHttpServletRequest multi) throws IOException {

		//products 테이블에 저장할 데이터를 내려받아서 productVo에 저장해서 mapper로 보냄
		String title = multi.getParameter("title");
		int subcategory_id = Integer.parseInt(multi.getParameter("subcategory_id"));
		int price = Integer.parseInt(multi.getParameter("price"));
		String body = multi.getParameter("body");
		int calory = Integer.parseInt(multi.getParameter("calory"));

		//productVo 에 저장
		ProductVo productVo = new ProductVo();
		productVo.setTitle(title);
		productVo.setSubcategory_id(subcategory_id);
		productVo.setPrice(price);
		productVo.setBody(body);
		productVo.setCalory(calory);

		//products 테이블에 데이터 저장후 selectkey로 product_id를 받아옴
		mapper.insertProduct(productVo);
		int product_id = productVo.getId();

		//4장의 이미지 파일을 내려받고, s3 서버에 저장한 후 url 받아온 후 products_images 테이블에 저장
		for (int i = 1; i < 5; i++) {
			// image 파일이 전달된 경우에만 서버에 저장
			if (!multi.getFile("image" + i).isEmpty()) {
				MultipartFile multipartFile = multi.getFile("image" + i);

				//파일명을 s3에 저장하기 위한 파일명으로 전환
				String originalFilename = multipartFile.getOriginalFilename();
				String s3Filename = UUID.randomUUID().toString() + "-" + originalFilename;

				ObjectMetadata objectMetadata = new ObjectMetadata();
				objectMetadata.setContentLength(multipartFile.getInputStream().available());

				amazonS3.putObject(bucket, s3Filename, multipartFile.getInputStream(),objectMetadata);
				//multipart 형태의 file을 s3 저장을 위한 file 형태로 전환
//				File file = convertMultipartFileToFile(multipartFile);

				//파일명과 파일을 s3 전송을 위한 메소드로 보내고, 결과값인 저장된 url을 리턴 받음
				String image_url = amazonS3.getUrl(bucket, s3Filename).toString();

				//전송을 위해 임시 저장했던 was 서버에 남은 파일은 삭제시킴
//				removeFile(file);

				System.out.println("image_url = " + image_url);

				//DB의 products_images 테이블에 product_id와 image_url을 저장
				mapper.insertImgUrl(product_id, image_url);
			}

		}
		//상품등록 화면을 돌아감
		return "redirect: /admin/register";
	}

	//multipartfile 을 file 로 바꾸는 메서드
	private File convertMultipartFileToFile(MultipartFile multipartFile) throws IOException {
		File file = new File(System.getProperty("user.dir") + "/" +
				multipartFile.getOriginalFilename());
		FileOutputStream fos = new FileOutputStream(file);
		fos.write(multipartFile.getBytes());

		return file;
	}

	//생성했던 file 을 지우는 메서드
	private void removeFile(File file) {
		file.delete();
	}

	//서버로 전송된 이미지 파일을 S3 서버에 저장하고 img_url 을 받아오는 메서드
	private String getImgUrl(File file, String s3Filename) throws IOException {

		//s3 bucket에 이미지 저장
		amazonS3.putObject(bucket, s3Filename, file);
		//저장된 이미지 url 받아옴
		String image_url = amazonS3.getUrl(bucket, s3Filename).toString();

		return image_url;
	}
}
