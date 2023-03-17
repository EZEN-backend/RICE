<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%> 

<head>
  <style>
    input[type=checkbox] {
      height:10px;
    }
    
    .container {
      margin:auto auto 100px auto;
      width:55%;
      display:flex;
    
    }

    .item:nth-child(1) {
      margin-top:10px;
      flex-basis:70%;
      /* background-color:yellow; */
    
    }
    
    .item:nth-child(2) {
     margin-top:10px;
     margin-left:10px;
      flex-basis:30%;
      /* background-color:green; */
    
    }
    
    
    
    .mini {
       margin-top:10px;
       margin-left:10px;
       width:100%;
    }
    
    .mini:nth-child(1) {
       height:35px;
       font-size:17px;
       font-weight:1000;
       
    }
    .mini:nth-child(2) {
       height:18px;
       font-size:13px;
       font-weight:550;
       
    }
    .mini:nth-child(3) {
       height:26px;
       font-size:13px;
       font-weight:540;
    }
    .mini:nth-child(4) {
       
       height:38px;
       font-size:13px;
       font-weight:540;
    }
    .mini:nth-child(5) {
       height:40px;
       font-size:13px;
       font-weight:550;
       padding-top:13px;
       border-top:1px solid #cccccc;
       border-bottom:1px solid #cccccc;
       
       
    }
    .mini:nth-child(6) {
       margin-top:20px;
    }
    .mini input[type=button] {
       display:inline-block;
       margin:auto auto auto 30px;
       width:300px;
       height:45px;
       color:white;
       border:1px solid black;
       font-size:13px;
       background-color:black;
       border-radius:40px;
       cursor: pointer;
    }
    
    .mini-right {
       display:inline-block;
       float:right;
    }
    .a {
       height:25px;
       font-size:12px;
       display:inline-block;
       margin:0 10px 0px 10px;
       padding-bottom:15px;
    }
   
  
  </style>
  
  <script src="https://kit.fontawesome.com/f1fa4a6c48.js" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
  
  <script>
   window.onload=function() {
	   sendTotalPrice(); //총결제금액 구하는 함수
	  
   }
   
   function maincheck(my) { //전체선택 체크박스 클릭시 
   	   var csub=document.getElementsByClassName("csub");//상품별 체크박스
	   	   
	   if(my.checked) {
		   // 체크가 되었다면 => 상품의 체크박스에 전부 체크
		   for(var i in csub) {
			   csub[i].checked=true;
		   } 	   
		   // 전체선택 체크박스도 체크
		   document.getElementById("up").checked=true;
		   document.getElementById("down").checked=true;
	   }	
	   else {
		   // 체크가 안되었다면 => 상품의 체크박스에 전부 해제
		   for(var i in csub) {
			   csub[i].checked=false;
		   } 	   
		   // 전체선택 체크박스도 체크
		   document.getElementById("up").checked=false;
		   document.getElementById("down").checked=false;
	   }
	   
	   sendTotalPrice(); // 개별 상품구입액을 다 더해서 총액을 보내는 함수
	   cartAmount(); //장바구니 카트에 현재 장바구니 수량 표시
   }
  
   function subcheck() {//개별 상품별 체크박스 클릭시
   	   var csub=document.getElementsByClassName("csub");
	   var len=csub.length; // 총상품의 갯수
	   
	   // 상품의 체크박스가 몇개 체크되었나를 계산
	   var n=0;
	   for(i=0;i<len;i++) {
		   if(csub[i].checked) {
			   n++;
		   }
	   }
       if(len==n) {
    	   document.getElementById("up").checked=true;
		   document.getElementById("down").checked=true;
       }	
       else {
    	   document.getElementById("up").checked=false;
		   document.getElementById("down").checked=false;
       }	
       
       sendTotalPrice();
       cartAmount(); 
   }
   
   //장바구니 선택상품 삭제시 
   function cartdel() {    
	   var id="";
	   var csub=document.getElementsByClassName("csub");
	   var len=csub.length; 
  
       for(i=0;i<len;i++) {
		    if(csub[i].checked)
		       id=id+csub[i].value+",";
	   }	   
	   
	   if(id!="") {
	      location="cartDel?id="+id;
	   }
   }
   
   //장바구니에 담긴 상품의 총금액 구하는 함수
   
   function sendTotalPrice() {
	   
	   var checkBox=document.getElementsByClassName("csub");
	   var subPrice=document.getElementsByClassName("subPrice");
	   var pCode=document.getElementsByClassName("pcode");
	   var totalPrice=0;
	   var productCode="";
	   
	   for(var i=0; i<checkBox.length;i++) {
		   if(checkBox[i].checked) {
			   totalPrice+= parseInt(subPrice[i].value);
			   productCode+= pCode[i].value+",";
		   }
		   
	   }
	   
	   totalPrice=Math.ceil(totalPrice/100)*100; //100자리에서 올림	
	   //총합계 금액  영역에 데이터 전달
	   document.getElementById("total").innerText=comma(totalPrice)+"원";
	   document.getElementById("total2").innerText=comma(totalPrice)+"원";
	  
	   
	   if(productCode=="") {
		   document.getElementById("submitt").disabled=true;
		   document.getElementById("submitt").style.color="black";
		   document.getElementById("submitt").style.background="white";
	   }
	   else {
		   document.getElementById("submitt").disabled=false;
		   document.getElementById("submitt").style.color="white";
		   document.getElementById("submitt").style.background="black";
	   }
		   
   }
   
   function cartAmount() {  //카트 그림속에 숫자 집어넣는 함수
	   var n=${count};
       
       document.getElementById("cart_amount").innerText=n;
   }
   
   function comma(num) {  //상품금액에 , 첨가하는 함수
	   return new Intl.NumberFormat().format(num);
   }
   
  
   $(function() {
	   
	   //옵션 select 태크 변경시 실행되는 함수
	   function changeOption(n) {
		  // var n=$(".amount").index(this); //이벤트 발생하는 상품의 인덱스 값
	       var pr=$(".pr").eq(n).val();  // 상품 개별 가격
	       var cartId=$(".csub").eq(n).val();  //상품 아이디
	       
    	   var quantity=$(".amount").eq(n).val();  //상품 수량
    	   var spicy=$(".spicy").eq(n).val();  //상품 맵기
    	   var size=$(".size").eq(n).val();  //상품 사이즈
    	   //수량을 곱한 개별 상품의 가격
	       var price=parseInt(quantity*pr); 
	       //사이즈별 가격 변동 사항 반영한 가격
    	   if(size=="S") price=price;
    	   else if(size=="M") price=price*1.2;
    	   else if(size=="L") price=price*1.4;
	       
	       $(".subPrice").eq(n).val(price); //옵션을 모두 적용한 개별 상품 가격을 저장
	       
	       price=comma(price);// 가격에 ',' 표시함
	       $(".prin").eq(n).text(price+"원"); // 개별 상품 가격 표시 영역에 가격 나타냄
	       
	       sendTotalPrice();  // 장바구니 화면 우측에 상품 가격의 '총합'을 구해서 표시하는 함수 실행
	       
	       // ajax를 통해 cart테이블의 수량을 변경 사항 cart 테이블로 보냄
	       $.ajax ({
	    	   type:"get",
	    	   url: "/cartOption?cartId="+cartId+"&quantity="+quantity+"&size="+size+"&spicy="+spicy,
	           dataType: "text",
	           success: function(data) {
	        	   console.log("옵션변경 성공");
	           },
	           error: function() {
	        	   console.log("옵션변경 에러");
	           }
	    	   
	       });
       }
	   
	   // 장바구니 상품 갯수 변경시 장바구니 테이블에 반영하고 상품총합계에도 반영
	   $(".amount").change(function() {
		   var num=$(".amount").index(this);
		   
	       changeOption(num);
	    }); 
	   
	  // 장바구니 상품 사이즈 변경시 장바구니 테이블에 반영하고 상품총합계에도 반영
	   $(".size").change(function() {
		   var num=$(".size").index(this);
		   
	       changeOption(num);
	   }); 
	   
	  // 장바구니 상품 맵기 변경시 장바구니 테이블에 반영하고 상품총합계에도 반영
	   $(".spicy").change(function() {
		   var num=$(".spicy").index(this);
		   
	       changeOption(num);
	   });
	  
	    //장바구니 페이지 열릴때  상품 수량,사이즈,맵기를 나타내는 select 태그에 현재 장바구니 테이블에 저장되어 있는 값 나타나게 함   
	    var cartList=JSON.parse('${cartList1}');
	    
	    $.each(cartList, function(i) {
	    	var quantity=cartList[i].quantity;
	    	var size=cartList[i].size;
	    	var spicy=cartList[i].spicy;
	    	
	    	$(".amount").eq(i).val(quantity);
	    	$(".size").eq(i).val(size);
	    	$(".spicy").eq(i).val(spicy);
	    });
	    
	    //주문 결제 클릭시
	   $("#submitt").on("click", function(){
		   
	    	//장바구니에 담긴 상품들의 id와 상품 금액 저장
	    	var cartId="";    
	        var price="";
	        var totalPrice=$("#total2").text();
	        
	        var csub= $(".csub");
	        var prin= $(".prin");
	    	for(var i=0; i < csub.length; i++) {
	    		cartId = cartId+csub.eq(i).val().trim()+"-";
	    		price = price+prin.eq(i).text().trim()+"-";
	    	}   
	    	//결제화면으로 cartId와 subPrice 값 보내기
	    	location.href="/products/orders/"+cartId+"/"+price+"/"+totalPrice;
	    });
	});
   
   
  </script>
</head>
<body>

  <div class="container">
     <div class="item">
        <div id="event" style="border:1px solid #cccccc; padding:4px">
           <span style="color:#f19022; font-size:17px">오늘의 특별한  메뉴 : HOT SALE</span><br>
           <span style="font-size:13px">신선한 재료로 만든 특별한 먹거리를 저렴한 가격에 구입해 보세요.</span> 
           <a href="/special" style="color:black; font-size:13px">구입하기</a>
        </div>
        <div style="margin:15px 2px 30px 2px;font-size:17px; font-weight:1000">장바구니</div>
          
        <div style="height:30px;" >
           <input type="checkbox" onclick="maincheck(this)" id="up" checked>
           <span class="a">전체선택</span> 
           <span class="a" style="color:#cccccc;">|</span>
           <span class="a" onclick="cartdel()" style="cursor:pointer">선택삭제</span>
        </div> 
        
        <c:forEach var="item" items="${cartList}">
        <div style="border-top:1px solid #cccccc;margin-top:30px; font-size:13px">       
           
              <input type="hidden" class="pr" value="${item.price}">
              <input type="hidden" class="pcode" value="${item.product_id}">
              <input type="hidden" class="subPrice" value="${item.subPrice}">
                            
              <div style="display:flex; margin-top:10px">       
                 <div style="flex-basis:3%"><input type="checkbox" class="csub" onclick="subcheck()" value="${item.cartId}" checked></div>
                 <div style="flex-basis:25%"><a href="/products/detail/${item.product_id}"><img src="/resources/img/${item.product_img}" width="140" height="140" style="border-radius: 25px;"></a></div>
                 <div style="flex-basis:72%">
                    <div style="height:50px">
                       <span style="display:inline-block;font-weight:550; margin-top:7px">${item.title}</span>
                       <span class="prin" style="display:inline-block;float:right; margin-top:7px"> 
                          <fmt:formatNumber value="${item.subPrice}" 
                          pattern="#,###" type="number"/>원
                       </span>
                    </div>  
                    <!-- 상품 구매수량  -->
                    <div style="height:15px; margin-top:15px">수&nbsp;&nbsp;&nbsp;량&nbsp;
                        <select class="amount"  >
                          <c:forEach begin="1" end="5" var="i">
                            <option value="${i}">${i}</option>
                          </c:forEach>
                        </select>   
                    </div>
                  <!--   상품 사이즈 -->
                    <div style="height:15px; margin-top:10px">사이즈&nbsp;
                        <select  class="size">
                            <option value="S">S</option>
                            <option value="M">M</option>
                            <option value="L">L</option>
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
                    <div style="height:15px; margin:10px auto 20px auto">도착 예정일: ${item.deliveryDay}
                       <span style="float:right"  >
                          <i class="fa-sharp fa-regular fa-lg fa-trash-can" style="cursor:pointer" onclick="location='cartDel?id=${item.cartId}'"></i>
                       </span>
                    </div>
                   
                 </div>
              </div>
              
           
       </div>
       </c:forEach>
       <div style="border-top:1px solid #cccccc;"></div> 
       <div style="height:30px; margin-top:30px">
           <input type="checkbox" onclick="maincheck(this)" id="down" checked>
           <span class="a">전체선택</span> 
           <span class="a" style="color:#cccccc;">|</span>
           <span class="a"  onclick="cartdel()">선택삭제</span>
       </div> 
     </div>    
   
           <!-- 우측 총결제금액 영역 -->
     <div class="item">
        <div class="mini">주문 내역</div>
        <div class="mini">할인쿠폰이 있으신가요?<span class="mini-right">▽</span></div>
        <div class="mini">상품 금액<span class="mini-right" id="total"></span></div>
        <div class="mini">배송비<span class="mini-right">무료</span></div>
        <div class="mini">총 결제 금액<span class="mini-right" id="total2"></span></div>
        <div class="mini"><input type="button" value="주문결제" id="submitt"></div>
        
          
     </div>  
     
    
 </div>








</body>