<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%> 
<script src="https://kit.fontawesome.com/f1fa4a6c48.js" crossorigin="anonymous"></script>

<head>
  <style>
    input[type=checkbox] {
      height:10px;
    }
    
    .container {
      margin:auto auto 100px auto;
      width:65%;
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
  
  <script>
   window.onload=function() {
	   sendTotalPrice(); //??????????????? ????????? ??????
	   cartAmount();     //?????? ????????? ?????????????????? ?????? ????????? ??????
   }
   
   function maincheck(my) { //???????????? ???????????? ????????? 
   	   var csub=document.getElementsByClassName("csub");//????????? ????????????
	   	   
	   if(my.checked) {
		   // ????????? ???????????? => ????????? ??????????????? ?????? ??????
		   for(var i in csub) {
			   csub[i].checked=true;
		   } 	   
		   // ???????????? ??????????????? ??????
		   document.getElementById("up").checked=true;
		   document.getElementById("down").checked=true;
	   }	
	   else {
		   // ????????? ??????????????? => ????????? ??????????????? ?????? ??????
		   for(var i in csub) {
			   csub[i].checked=false;
		   } 	   
		   // ???????????? ??????????????? ??????
		   document.getElementById("up").checked=false;
		   document.getElementById("down").checked=false;
	   }
	   
	   sendTotalPrice(); // ?????? ?????????????????? ??? ????????? ????????? ????????? ??????
	   cartAmount(); 
   }
  
   function subcheck() {//?????? ????????? ???????????? ?????????
   	   var csub=document.getElementsByClassName("csub");
	   var len=csub.length; // ???????????? ??????
	   
	   // ????????? ??????????????? ?????? ?????????????????? ??????
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
   
   function cartdel() {    //???????????? ???????????? ????????? 
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
			   // ??????, ????????? ????????? ??????..
			   // ui.value : ??????
			   var n=$imsi.index(this);
		       // alert( $("section .pr").eq(n).value ) ;
		       //alert( document.getElementsByClassName("pr")[n].value);
		       var pr=document.getElementsByClassName("pr")[n].value;  // ??????
		       var price=parseInt(ui.value*pr); 
		       document.getElementsByClassName("subPrice")[n].value=price;
		       
		       price=comma(price);
		       document.getElementsByClassName("prin")[n].innerText=price+"???";
		       
		       sendTotalPrice();
		       
		       // ajax??? ?????? cart???????????? ????????? ??????????????????..
		       var pcode=document.getElementsByClassName("pcode")[n].value;
		       var su=ui.value;
		       
		       var chk=new XMLHttpRequest();
		       chk.onload=function() {
		    	   //alert(chk.responseText);
		    	   if(chk.responseText=="1")
		    		   alert("????????????");
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
   
   function cartAmount() {  //?????? ???????????? ?????? ???????????? ??????
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
   
   function comma(num) {  //??????????????? , ???????????? ??????
	   return new Intl.NumberFormat().format(num);
   }
  </script>
</head>
<body>

  <div class="container">
     <div class="item">
        <div id="event" style="border:1px solid #cccccc; padding:4px">
           <span style="color:#f19022; font-size:17px">????????? ?????????  ?????? : HOT SALE</span><br>
           <span style="font-size:13px">????????? ????????? ?????? ????????? ???????????? ????????? ????????? ????????? ?????????.</span> 
           <a href="/rice/special" style="color:black; font-size:13px">????????????</a>
        </div>
        <div style="margin:15px 2px 30px 2px;font-size:17px; font-weight:1000">????????????</div>
          
        <div style="height:30px;" >
           <input type="checkbox" onclick="maincheck(this)" id="up" checked>
           <span class="a">????????????</span> 
           <span class="a" style="color:#cccccc;">|</span>
           <span class="a" onclick="cartdel()">????????????</span>
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
                          pattern="#,###" type="number"/>??? 
                       </span>
                    </div>  
                    <div style="height:15px; margin-top:15px">??????<input type="text"   name="amount" class="amount" value="${item.amount}" readonly size="3px"> </div>
                    <div style="height:15px; margin-top:10px">??????
                        <select id="option">
                            <option value="0">???</option>
                            <option value="1">???</option>
                            <option value="2">???</option>
                        </select>
                    </div>
                    <div style="height:15px; margin-top:10px">?????? ?????????: ${item.deliveryDay}
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
           <span class="a">????????????</span> 
           <span class="a" style="color:#cccccc;">|</span>
           <span class="a"  onclick="cartdel()">????????????</span>
       </div> 
     </div>    
   
           <!-- ?????? ??????????????? ?????? -->
     <div class="item">
        <div class="mini">?????? ??????</div>
        <div class="mini">??????????????? ????????????????<span class="mini-right">???</span></div>
        <div class="mini">?????? ??????<span class="mini-right" id="total"></span></div>
        <div class="mini">?????????<span class="mini-right">??????</span></div>
        <div class="mini">??? ?????? ??????<span class="mini-right" id="total2"></span></div>
        <div class="mini"><input type="button" value="????????????" id="submitt"></div>
     </div>  
 </div>








</body>