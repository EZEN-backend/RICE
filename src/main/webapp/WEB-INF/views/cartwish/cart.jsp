<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%> 
<script src="https://kit.fontawesome.com/f1fa4a6c48.js" crossorigin="anonymous"></script>

<head>
  <style>
    body {
      margin:0px;
    }
    
   
    
    input[type=checkbox] {
      height:10px;
    }
    
    .container {
      margin:auto auto 100px auto;
      width:1100px;
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
    }
    
    .mini-right {
       dispaly:inline-block;
       float:right;
    }
    .a {
       height:25px;
       font-size:12px;
       dispaly:inline-block;
       margin:0 10px 0px 10px;
       padding-bottom:15px;
    }
  
  </style>
  
  <script>
   window.onload=function() {
	   sendTotalPrice(); //총결제금액 구하는 함수
	   cartAmount();     //카트 그림에 장바구니구매 수량 보내는 함수
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
	   cartAmount(); 
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
   
   function cartdel() {    //장바구니 선택상품 삭제시 
	   var id="";
	   var csub=document.getElementsByClassName("csub");
	   var len=csub.length; 
  
       for(i=0;i<len;i++) {
		    if(csub[i].checked)
		       id=id+csub[i].value+",";
	   }	   
	   
	   if(id!="") {
	      location="cartdel?id="+id;
	   }
   }
   </script>
   
   <script src="https://code.jquery.com/jquery-latest.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
   <script>
   /* $(function() {
	   var $imsi=$(".su");
	   
	   $(".su").spinner({
		   min:1,
		   max:10,
		   spin:function(e,ui) {
			   // 수량, 단가를 알아야 된다..
			   // ui.value : 수량
			   var n=$imsi.index(this);
		       // alert( $("section .pr").eq(n).value ) ;
		       //alert( document.getElementsByClassName("pr")[n].value);
		       var pr=document.getElementsByClassName("pr")[n].value;  // 단가
		       var price=parseInt(ui.value*pr); 
		       document.getElementsByClassName("subPrice")[n].value=price;
		       
		       price=comma(price);
		       document.getElementsByClassName("prin")[n].innerText=price+"원";
		       
		       sendTotalPrice();
		       
		       // ajax를 통해 cart테이블의 수량을 변경시켜준다..
		       var pcode=document.getElementsByClassName("pcode")[n].value;
		       var su=ui.value;
		       
		       var chk=new XMLHttpRequest();
		       chk.onload=function() {
		    	   //alert(chk.responseText);
		    	   if(chk.responseText=="1")
		    		   alert("내부오류");
		       }
		       chk.open("get","cart_su?pcode="+pcode+"&su="+su);
		       chk.send();
		       
	       }
	   });
   }); */
   
   var productCode;
   function sendTotalPrice() {
	   
	   var checkBox=document.getElementsByClassName("csub");
	   var subPrice=document.getElementsByClassName("subPrice");
	   var pCode=document.getElementsByClassName("pcode");
	   var totalPrice=0;
	   productCode="";
	   
	   for(var i=0; i<checkBox.length;i++) {
		   if(checkBox[i].checked) {
			   totalPrice+= parseInt(subPrice[i].value);
			   productCode+= pCode[i].value+",";
		   }
	   }
	   	 
	   document.getElementById("total").innerText=comma(totalPrice);
	   /* document.getElementById("deliveryFee").innerText=comma(deliveryFee); */
	   document.getElementById("total2").innerText=comma(totalPrice);
	   /* document.getElementById("productCode").value=productCode; */
	   
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
	   var csub=document.getElementsByClassName("csub");
	   var len=csub.length; 
       var n=0;
       
       for(i=0;i<len;i++) {
		    if(csub[i].checked) {
		    	n++;
		    }
	   }
       
       document.getElementById("cart_amount").innerText=n;
   }
   
   function comma(num) {  //상품금액에 , 첨가하는 함수
	   return new Intl.NumberFormat().format(num);
   }
  </script>
</head>
<body>

  <div class="container">
     <div class="item">
        <div id="event" style="border:1px solid #cccccc; padding:4px">
           <span style="color:#f19022; font-size:17px">오늘의 특별한  메뉴 : HOT SALE</span><br>
           <span style="font-size:13px">신선한 재료로 만든 특별한 먹거리를 저렴한 가격에 구입해 보세요.</span> 
           <a href="/rice/special" style="color:black; font-size:13px">구입하기</a>
        </div>
        <div style="margin:15px 2px 30px 2px;font-size:17px; font-weight:1000">장바구니</div>
          
        <div style="height:30px;" >
           <input type="checkbox" onclick="maincheck(this)" id="up" checked>
           <span class="a">전체선택</span> 
           <span class="a" style="color:#cccccc;">|</span>
           <span class="a" id="cdel" onclick="cartdel()">선택삭제</span>
        </div> 
        
        <c:forEach var="item" items="${cartList}">
        <div style="border-top:1px solid #cccccc;margin-top:30px; font-size:13px">       
           
              <input type="hidden" class="pr" value="${item.price}">
              <input type="hidden" class="pcode" value="${item.pCode}">
              <input type="hidden" class="subPrice" value="${item.price*item.amount}">
                            
              <div style="display:flex; margin-top:10px">       
                 <div style="flex-basis:3%"><input type="checkbox" class="csub" onclick="subcheck()" value="${item.cartId}" checked></div>
                 <div style="flex-basis:25%"><img src="/rice/resources/cart-img/${item.pImg}" width="140" height="140"></div>
                 <div style="flex-basis:72%">
                    <div style="height:50px">
                       <span style="display:inline-block;font-weight:550; margin-top:7px">${item.pTitle}</span>
                       <span class="prin" style="display:inline-block;float:right; margin-top:7px"> 
                          <fmt:formatNumber value="${item.price*item.amount}" 
                          pattern="#,###" type="number"/>원 
                       </span>
                    </div>  
                    <div style="height:15px; margin-top:15px">수량<input type="text"   name="amount" class="amount" value="${item.amount}" readonly size="3px"> </div>
                    <div style="height:15px; margin-top:10px">옵션
                        <select id="option">
                            <option value="0">소</option>
                            <option value="1">중</option>
                            <option value="2">대</option>
                        </select>
                    </div>
                    <div style="height:15px; margin-top:10px">도착 예정일: ${item.deliveryDay}
                       <span style="float:right" <%-- onclick="location='cartdel?id=${item.cartId}'" --%>>
                          <i class="fa-sharp fa-regular fa-lg fa-trash-can"></i>
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
           <span class="a" id="cdel" onclick="cartdel()">선택삭제</span>
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