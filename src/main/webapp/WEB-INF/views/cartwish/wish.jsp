<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>


<head>
    <style>
        section {
            margin:auto;
            width:60%;
            height: auto;
        }
        .container {
            display:flex;
        }
        .container.top {
            width:100%;
            position: relative;
        }
        .container.top .item:nth-child(1){
            flex-basis:60%;
            font-size:20px;
            font-weight:550;
            margin:20px auto 20px 50px;
        }
        
        /* 수정 버튼 */
        .container.top #change_wish {
            position: absolute;
            top: 15px;
            left: 85% ;
            display: block;
            width:100px;
            height:30px;
            line-height:30px;
            font-size:13px;
            border:1px solid black;
            border-radius: 15px;
            background-color:white;
            color:black;
            text-align:center;
            cursor: pointer;
        }
        
        /* 확인 버튼 */
        .container.top #change_wish2 {
            position: absolute;
            top: 15px;
            left: 85% ;
            display: none;
            width: 100px;
            height: 30px;
            line-height: 30px;
            font-size: 13px;
            border: 1px solid black;
            border-radius: 15px;
            background-color: black;
            color: white;
            text-align: center;
            cursor: pointer;
        }
       
        .container.product {
            flex-flow:row wrap;
            width:100%;
            margin:auto;
        }
        .container.product .item_img {
            position:relative;
            width:30%;
            height: auto;
            margin:20px 1% 8px 2%;
        }
        .container.product .img_product {
            width:100%;
            height:310px;
        }
        .container.product .img_heart {
            display:inline-block;
            visibility: hidden;
            position:absolute;
            left:85%;
            top: 10px;
            width:50px;
            height:50px;
            border-radius:25px;
            cursor: pointer;
        }
        /* 옵션선택 버튼 */
        .container.product input[type="button"] {
            margin:10px 0 20px 65%;
            width:35%;
            height:30px;
            line-height:30px;
            font-size:13px;
            border:1px solid black;
            border-radius: 15px;
            background-color:white;
            color:black;
            text-align:center;
            cursor:pointer;
           
        }
        
        /* 숭어있다가 옵션선택 클릭시 팝업되어 나타나는 영역에 대한 css */
        .container.pop {
            flex-flow: row nowrap;
            width:600px;
            height:310px;
            border:1px solid black;
            position:absolute;
            top: 800px;
            left: 30%;
            display:none;
        }
        
        .container.pop .item_last:first-child {
            width: 300px;
            
        }
        .container.pop .item_last:last-child {
            width: 300px;
            height: 310px;
            background-color:white;
           
          
        }
        .container.pop #pop_img {
            width: 300px;
            height: 310px;
            z-index:99;
        }
        
        
        .container.pop .popup:nth-child(1) {
            width: 270px;
            height: 20px;
            font-size: 15px;
            margin: 15px 0 0 20px;
        }
        .container.pop .popup:nth-child(2) {
            width: 200px;
            height: 30px;
            font-size: 18px;
            font-weight: 600;
            margin: 20px auto 0 20px;
        }
        .container.pop .popup:nth-child(3) {
            width: 100px;
            height: 30px;
            margin: 50px auto 0 20px;
            font-size: 13px;
        }
        .container.pop .popup:nth-child(4) {
            width: 150px;
            height: 30px;
            margin: 5px auto 0 20px;
            font-size: 13px;
        }
        .container.pop .popup:nth-child(5) {
            width: 200px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            font-size: 15px;
            font-width: 550;
            color: white;
            background: black;
            border-radius: 38px;
            margin: 50px auto;
            cursor: pointer;
        }
    </style>

    <script>
        
        $(function() {
        	
        	//수정 버튼 클릭시-위시리스트 삭제 모드로 전환
        	$("#change_wish").on("click", function () {
                $("#change_wish").css("display","none");
                $("#change_wish2").css("display","block");
                $(".img_heart").css("visibility","visible");
                //옵션선택 버튼 비활성화
                $(".option_button").attr("disabled","false");
                $(".option_button").css("cursor","default");
                
            });
        	
        	//확인 버튼 클릭시-위시리스트 삭제
            $("#change_wish2").on("click", function () {
            	//삭제할 위시리스트가 존재하는지 체크
                var del_id="";
                for(var i=0; i<$(".img_del").length ; i++) {
                    if($(".img_del").eq(i).val()!="") {
                        del_id += $(".img_del").eq(i).val() + ",";
                    }
                }
                //삭제할 위시리스트가 있다면
                if(del_id!="") {
                	
                	location.href="/wish/"+del_id;
                }	
                else {
                	location.href="/wish";
                }   
                
            });
        	           
            // 하트 모양 클릭시
            $(".img_img").on("click", function () {
                var n=$(".img_img").index(this);
                var status=$(".del_status").eq(n).val();
                var wishId=$(".wishId").eq(n).val();
                if(status=="true") {
                    $(".img_img").eq(n).attr("class","fa-regular fa-heart fa-2x img_img");
                    $(".del_status").eq(n).val("false");
                    $(".img_product").eq(n).css("opacity","0.3");
                    $(".img_del").eq(n).val(wishId);
                }
                else if(status="false") {
                    $(".img_img").eq(n).attr("class","fa-solid fa-heart fa-2x img_img");
                    $(".del_status").eq(n).val("true");
                    $(".img_product").eq(n).css("opacity","1");
                    $(".img_del").eq(n).val("");
                }
            });
            
            //옵션 선택 버튼 클릭시 팝업 띄우기
            $(".option_button").on("click",function () {
                var n=$(".option_button").index(this);
                
                //클릭되는 옵션의 값들을 불러옴-팝업영역에 뿌리기 위함
                var img_src=$(".img_product").eq(n).attr("src");
                var title=$(".title").eq(n).val();
                var price1=parseInt($(".price").eq(n).val()); //옵션선택된 상품의 가격
                $("#price_popup").val(price1); //상품의 가격을 hidden 영역으로 보냄
                var price=comma(price1)+"원";
                var subcategory=$(".subcategory").eq(n).val();
                var product_id=$(".product_id").eq(n).val();
                
                //팝업 위치를 잡기위한 스크롤 값 구하기
                var scroll_top=$(window).scrollTop();
                
                //팝업 영역에 data 값 부여
                $("#pop_img").attr("src",img_src);
                $("#title1").text(title);
                $("#price1").text(price);
                $("#subcategory1").text(subcategory);
                $("#product_into_cart").val(product_id);
                
                //팝업 영역 위치와 나타내기
                $(".container.pop").css("display","flex"); 
                $(".container.pop").css("top",scroll_top+100+"px");
                $(".container.pop").css("left","30%");
                
                //body 스크롤 정지시키고 body 투명도 흐리게 만들기
                $("section").css("opacity","0.7");
                $("body").css("overflow","hidden");
           });
                      
            // 타겟영역을 제외하고 클릭했을 시 팝업 숨김처리.
           $(document).mouseup(function(e) {
            	var layerPopup=$(".container.pop");
            	var cartBtn=$(".container.pop #button_cart");
            	
        	    if( layerPopup.has(e.target).length === 0 || cartBtn.is(e.target)) {
        	    	//팝업 사라짐
        	    	 $(".container.pop").css("display","none");
        	    	//body 스크롤과 화면 색상 원상태로 복귀
                     $("section").css("opacity","1");
                     $("body").css("overflow","auto");
        	    	 
        	    }
            });
            
            //팝업된 옵션선택 영역에서 상품의 사이즈를 선택할때 , 사이즈에 따른 가격 변동
            $("#size_option").on("change",function(){
            	var size=$("#size_option").val(); //선택한 상품의 사이즈
            	var price=$("#price_popup").val(); //선택한 상품의 가격
            	
            	//상품 사이즈에 맞게 가격 조정
            	if(size=="S") {
            		price=price*1;
            	} else if(size=="M") {
            		price=price*1.2;
            	} else if(size=="L") {
            		price=price*1.4;
            	}
            	// 조정된 상품 가격에 ',' 표시
            	price=comma(price)+"원";
            	// 최종 가격을 팝업된 영역에 표시
            	$("#price1").text(price);
            });
            
            // 팝업창에서 장바구니 버튼 클릭
            $("#button_cart").on("click",function(){
            	//해당 상품 장바구니 테이블에 저장
            	var product_id=$("#product_into_cart").val();
            	var size=$("#size_option").val();
            	var spicy=$("#spicy_option").val();
            	
            	$.ajax({
            		type: "get",
            		url: "/cartBtn?product_id="+product_id+"&size="+size+"&spicy="+spicy,
            		dateType: "text",
            		success: function(data) {
            			console.log("장바구니 담기 성공");
            			//상단 우측 카트 아이콘에 수량 증가
            			$("#cart_amount").text(data);
            			
            		},
            	    error: function() {
            	    	console.log("장바구니 담기 실패");
            	    }
            	}); 
            	
            	//body 스크롤과 화면 색상 원상태로 복귀
                $("section").css("opacity","1");
                $("body").css("overflow","auto");
            	
            });
            
            

        }); 
        
        //상품금액에 , 첨가하는 함수
        function comma(num) { 
     	   return new Intl.NumberFormat().format(num);
        }
    </script>

</head>


<body>
<section>

    <div class="container top">
        <div class="item">위시리스트</div>
        <div class="item" id="change_wish">수 &nbsp; &nbsp; &nbsp; &nbsp; 정</div>
        <div  id="change_wish2">확 &nbsp; &nbsp; &nbsp; &nbsp;  인</div>

    </div>


    <!-- forEach문 -->
    <div class="container product">
        <c:forEach var="item" items="${wishList}">
            <div class="item_img">
                <input class="product_id" type="hidden" value="${item.product_id}">
                <input class="wishId" type="hidden" value="${item.wishId}">
                <input class="img_del" type="hidden" value="">
                <input class="del_status" type="hidden" value="true">
                <input class="title" type="hidden" value="${item.title }">
                <input class="price" type="hidden" value="${item.price }">
                <input class="subcategory" type="hidden" value="${item.subcategory }">
                
                <div ><a href="/products/detail/${item.product_id}"><img class="img_product" src="${item.product_img}"></a>
                    <div class="img_heart"  ><i class="fa-solid fa-heart fa-2x img_img" ></i></div>
                </div>
                <div style="font-size:15px; font-weight:550">${item.title }
                    <span style="display:inline-block; float:right">
                    <fmt:formatNumber value="${item.price}" pattern="#,###" type="number"/>원 </span>
                </div>
                <div style="margin:10px 0 0 0; font-size:13px">${item.subcategory }</div>
                <div ><input type="button" value="옵션선택" class="option_button"></div>
            </div>
        </c:forEach>
    </div>
    <!-- forEach문 종료 -->

    <div style="margin-top: 50px"></div>
</section>
    <!-- 팝업 영역 -->
    <div class="container pop">
        <div class="item_last" ><img id="pop_img" src="" class="pop_img"></div>
        <div class="item_last" id="pop_content">
            <div class="popup">
               <span id="subcategory1"> </span>
               <span id="price1" style="float: right; font-size: 17px; padding-right: 5px"></span>
            </div>
            <div class="popup" id="title1"></div>
            <div class="popup">사이즈&nbsp;
                <select style="font-size: 13px" id="size_option">
                   <option value="S">소</option>
                   <option value="M">중</option>
                   <option value="L">대</option>
                </select>
            </div>
            <div class="popup">맵&nbsp;&nbsp;&nbsp;기&nbsp;
                <select style="font-size: 13px" id="spicy_option">
                   <option value="1">1단계</option>
                   <option value="2">2단계</option>
                   <option value="3">3단계</option>
                </select>
            </div>
            
            <div class="popup" id="button_cart">장바구니</div>
            <!-- 숨겨진 데이터값-장바구니에 담을 상품의 id 값 -->
            <input type="hidden" id="product_into_cart" value="">
            <!-- 숨겨진 데이터값-팝업된 옵션창에 나타낼 상품의 가격 -->
            <input type="hidden" id="price_popup" value="">
        </div>
    </div>

</body>

