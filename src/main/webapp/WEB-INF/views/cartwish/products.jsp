<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
    .cartBtn {
        width: 100px;
        height: 30px;
        line-height: 30px;
        border: 1px solid purple;
        border-radius: 15px;
        text-align: center;
        margin-top: 10px;
        cursor:pointer;
    }
    
    .wishBtn {
        width: 100px;
        height: 30px;
        line-height: 30px;
        border: 1px solid purple;
        border-radius: 15px;
        text-align: center;
        margin-top: 10px;
        cursor:pointer;
    }
</style>
<script>
   $(function(){
        
	   //장바구니 담기 클릭시 carts DB에 저장하기
    	$(".cartBtn").on("click",function(){
    		var n=$(".cartBtn").index(this);
    		var product_id=$(".product_id").eq(n).val();
    		var size=$(".size").eq(n).val();
    		var spicy=$(".spicy").eq(n).val();
    		
    		$.ajax ({
    			type: "get",
    			url : "/cartBtn?product_id="+product_id+"&size="+size+"&spicy="+spicy,
    		    dataType: "text",
    		    success: function(data) {
    		    	if(data=='0') {
    		    		console.log(data);
    		    		console.log("구매수량 초과")
    		    		alert("구매수량 초과");
    		    	}
    		    	else {
    		    		console.log(data);
    		    	    console.log('장바구니 저장성공');
    		    	    alert("장바구니 저장 성공")
    		    	
    		    	    //상단 우측 카드 이미지에 현재 장바구니 상품 수량 넘기기
    		    	    $("#cart_amount").text(data);
    		    	}
    		    	
    		    },
    		    error: function() {
    		    	console.log('장바구니 저장 에러');
    		    }
    		});
    	});
    	
    	// 위시리스트 버튼  클릭시 DB에 저장하기
    	$(".wishBtn").on("click",function(){
    		var n=$(".wishBtn").index(this);
    		var product_id=$(".product_id").eq(n).val();
    		
    		$.ajax ({
    			type: "get",
    			url : "/wishBtn/"+product_id,
    		    dataType: "text",
    		    success: function(data) {
    		    	console.log('통신성공');
    		    	if(data=="0") {
    		    		alert("위시리스트 삭제");
    		    	}
    		    	else if(data=="1") {
    		    		alert("위시리스트 담기성공");
    		    	}
    		    },
    		    error: function() {
    		    	console.log('통신에러');
    		    }
    		});
    	});
    	
   });	  
    	
    	
    	
  
    
      
    
    	
    	
    	
    	
    	
    
</script>
</head>
<body>
    
    <div  class="container" style="margin: auto auto 200px auto; width:800px; display:flex; flex-flow: row wrap"> 
      <c:forEach var="item" items="${productList}">
      
      <div class="item" style="margin: 40px 40px 0 0">
        <div ><img  src="${item.product_img}" style="width:100px"></div>
        <div style="font-size:15px; font-weight:550">${item.title }</div>
        <div>${item.price}원</div>
        <div >${item.subcategory }</div>
        
                  <!--   상품 사이즈 -->
                    <div style="height:15px; margin-top:10px">사이즈&nbsp;
                        <select class="size">
                            <option value="s">S</option>
                            <option value="m">M</option>
                            <option value="l">L</option>
                        </select>
                    </div>
                    <!-- 상품 맵기단계 -->
                    <div style="height:15px; margin-top:10px">맵&nbsp;&nbsp;&nbsp;기&nbsp;
                        <select  class="spicy">
                            <option value="1">1단계</option>
                            <option value="2">2단계</option>
                            <option value="3">3단계</option>
                        </select>
                    </div>
        <div class="cartBtn">장바구니</div>
        <div class="wishBtn">찜</div>
        
        <input type="hidden" class="product_id" value="${item.id}">
        
     </div>
        
      </c:forEach>
    
   </div>  
   
   <!-- 장바구니기 버튼 클릭시 팝업되는 상자 -->
   <div id="popUp">
       장바구니에 
   </div>
   
</body>
</html>