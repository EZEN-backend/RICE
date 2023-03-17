package kr.co.rice.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;

import kr.co.rice.vo.ProductVo;

public interface SearchMapper {

	public ArrayList<ProductVo> list(String search);
	public ArrayList<ProductVo> getItems(String search,int start, int end);
	public ArrayList<HashMap<String,Object>> product();
}
