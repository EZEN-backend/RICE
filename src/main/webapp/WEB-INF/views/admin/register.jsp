<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:100%;
		margin: 100px auto;
		
	}
	#a {
	   margin: 0 auto auto 45%;
	}
	.container {
	   margin: auto;
	   width: 40%;
	   display: flex;
	}
	.container .item {
	   height: 40px;
	   border-top: 1px solid purple;
	   font-size: 15px;
	   text-align: center;
	   line-height: 40px;
	}
	.container .item:first-child {
	   flex-basis: 30%;
	  
	}
	.container .item:last-child {
	   flex-basis: 70%;
	}
	.container #body {
	   width: 300px;
	   height: 80px;
	}
	.container.body {
	   height: 90px;
	}
	.container.img4 {
	   border-bottom: 1px solid purple;
	}
	.container.last {
	  
	   margin: 50px auto auto 25%;
	}
	.item.last {
	   border: none;
	 
	}
	
	input[type=submit] {
	   cursor:pointer;
	}
	
</style>
<script>
    function check() {
    	var result=confirm("상품을 등록하시겠습니까?");
    	
    	if(result) {
    		return true;
    	} else {
    		return false;
    	}
    }
</script>
</head>
<body>
	<section>
	    <div id="a"><h3>상품 등록</h3></div>
	    
	    <form method="post" action="/admin/registerInput" enctype="multipart/form-data" onsubmit="return check()">
	        <div class="container">
	            <div class="item">상품명</div>
	            <div class="item"><input type="text" name="title" placeholder="한글명으로 적어주세요" ></div>
	        </div>
	        <div class="container">
	            <div class="item">상품카테고리</div>
	            <div class="item">
	                <select name="subcategory_id">
	                    <option value="1">찜/탕</option>
	                    <option value="2">볶음류</option>
	                    <option value="3">구이</option>
	                    <option value="4">반찬</option>
	                    <option value="5">치킨</option>
	                    <option value="6">기타/분식</option>
	                    <option value="7">튀김류</option>
	                    <option value="8">면류</option>
	                    <option value="9">스시</option>
	                    <option value="10">덮밥</option>
	                    <option value="11">튀김류</option>
	                    <option value="12">면류</option>
	                    <option value="13">밥류</option>
	                    <option value="14">만두류</option>
	                    <option value="15">파스타</option>
	                    <option value="16">육류</option>
	                    <option value="17">피자</option>
	                    <option value="18">샐러드</option>
	                </select>
	            </div>
	        </div>
	        <div class="container">
	            <div class="item">상품가격</div>
	            <div class="item"><input type="text" name="price" placeholder="숫자로 넣어주세요(int타입)"></div>
	        </div>
	        <div class="container">
	            <div class="item">칼로리</div>
	            <div class="item">
	                <select name="calory">
	                    <option value="0">다이어트식</option>
	                    <option value="1">일반식</option>
	                </select>    
	            </div>
	        </div>
	        <div class="container body">
	            <div class="item">상품상세설명</div>
	            <div class="item"><textarea name="body" id="body" placeholder="상품상세페이지에 표시될 설명입니다. 30자 이상으로 넣어주세요"></textarea></div>
	        </div>
	        <div class="container">
	            <div class="item">상품사진1</div>
	            <div class="item"><input type="file" name="image1"></div>
	        </div>
	        <div class="container">
	            <div class="item">상품사진2</div>
	            <div class="item"><input type="file" name="image2"></div>
	        </div>
	        <div class="container">
	            <div class="item">상품사진3</div>
	            <div class="item"><input type="file" name="image3"></div>
	        </div>
	        <div class="container img4">
	            <div class="item">상품사진4</div>
	            <div class="item"><input type="file" name="image4"></div>
	        </div>
	        <div class="container last">
	            <div class="item last"></div>
	            <div class="item last"><input type="submit" value="상품등록"></div>
	        </div>
	</form>
	
		
	
	
	
	</section>
</body>
</html>