<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<html>

<head>
    <style>
        section {
            margin:auto;
            width:65%;
        }
        .container {
            display:flex;

        }
        .container:first-child {
            width:100%;
            position: relative;

        }
        .container:first-child .item:nth-child(1){
            flex-basis:60%;
            font-size:20px;
            font-weight:550;
            margin:20px auto 20px 50px;

        }
        .container:first-child #change_wish {
            position: absolute;
            top: 5px;
            left: 88% ;
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

        }
        .container:first-child #change_wish2 {
            position: absolute;
            top: 5px;
            left: 88% ;
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

        .container:nth-child(2) {
            flex-flow:row wrap;
            width:1000px;
            margin:auto;
        }
        .container:nth-child(2) .item_img {
            position:relative;
            width:300px;
            height: auto;
            margin:20px 10px 8px 20px;
        }
        .container:nth-child(2) .img_product {
            width:300px;
            height:310px;
        }
        .container:nth-child(2) .img_heart {
            display:inline-block;
            visibility: hidden;
            position:absolute;
            left:260px;
            top: 10px;
            width:50px;
            height:50px;
            border-radius:25px;
            cursor: pointer;
        }
        .container:nth-child(2) .option_button {
            margin:auto 0 20px auto;
            width:100px;
            height:30px;
            line-height:30px;
            font-size:13px;
            border:1px solid black;
            border-radius: 15px;
            color:black;
            text-align:center;
            cursor:pointer;
        }
        .container:last-child {
            width:600px;
            height:310px;
            border:1px solid black;
            position:absolute;
            left: 30%;
            visibility: hidden;

        }

        .container:last-child .item:first-child {
            flex-basis:50%;

        }
        .container:last-child .item:last-child {
            flex-basis:50%;
            background-color:white;

        }
        .container:last-child #pop_img {
            width: 300px;
            height: 310px;
        }
        #change_wish {
            cursor: pointer;
        }

        .container:last-child .popup:nth-child(1) {
            width: 270px;
            height: 20px;
            font-size: 15px;
            margin: 15px 0 0 20px;
        }
        .container:last-child .popup:nth-child(2) {
            width: 200px;
            height: 30px;
            font-size: 18px;
            font-width: 600;
            margin: 20px auto 0 20px;
        }
        .container:last-child .popup:nth-child(3) {
            width: 50px;
            height: 30px;
            margin: 20px auto 0 20px;
        }

        .container:last-child .popup:nth-child(4) {
            width: 200px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            font-size: 15px;
            font-width: 550;
            color: white;
            background: black;
            border-radius: 38px;
            margin: 100px auto;
            cursor: pointer;
        }

    </style>

    <script>

        $(function() {

            $(".img_img").on("click", function () {
                var n=$(".img_img").index(this);
                var status=$(".del_status").eq(n).val();
                var img_name=$(".img_name").eq(n).val();

                if(status=="true") {
                    $(".img_img").eq(n).attr("class","fa-regular fa-heart fa-2x img_img");
                    $(".del_status").eq(n).val("false");
                    $(".img_product").eq(n).css("opacity","0.3");
                    $(".img_del").eq(n).val(img_name);
                }
                else if(status="false") {
                    $(".img_img").eq(n).attr("class","fa-solid fa-heart fa-2x img_img");
                    $(".del_status").eq(n).val("true");
                    $(".img_product").eq(n).css("opacity","1");
                    $(".img_del").eq(n).val("");
                }

            });

            $("#change_wish").on("click", function () {
                $("#change_wish").css("display","none");
                $("#change_wish2").css("display","block");
                $(".img_heart").css("visibility","visible");
            });

            $("#change_wish2").on("click", function () {
                var del_id="";

                for(var i=0; i<$(".img_del").length ; i++) {
                    if($(".img_del").eq(i).val()!="") {
                        del_id += $(".img_del").eq(i).val() + ",";
                    }
                }

                location="/wish/"+del_id+"/";

            });

            $(".option_button").on("click",function () {
                var n=$(".option_button").index(this);
                var img_src=$(".img_product").eq(n).attr("src");
                var scroll_top=$(window).scrollTop();
                $("#pop_img").attr("src",img_src);
                $(".container:last-child").css("visibility","visible");
                $(".container:last-child").css("top",scroll_top+100+"px");
            });

            $("#button_cart").on("click",function () {
                $(".container:last-child").css("visibility","hidden");
            });
        });


    </script>

</head>


<body>
<section>

    <div class="container">
        <div class="item">위시리스트</div>
        <div class="item" id="change_wish">수 &nbsp; &nbsp; &nbsp; &nbsp; 정</div>
        <div  id="change_wish2">확 &nbsp; &nbsp; &nbsp; &nbsp;  인</div>

    </div>


    <!-- forEach문 -->
    <div class="container">
        <c:forEach var="item" items="${imgList}">
            <div class="item_img">
                <input class="img_name" type="hidden" value="${item}">
                <input class="img_del" type="hidden" value="">
                <input class="del_status" type="hidden" value="true">
                <div ><img class="img_product" src="/resources/cart-img/${item}">
                    <div class="img_heart"  ><i class="fa-solid fa-heart fa-2x img_img" ></i></div>
                </div>
                <div style="font-size:15px; font-weight:550">뚝배기 순두부 찌개
                    <span style="display:inline-block; float:right">17,000 원</span>
                </div>
                <div style="margin:10px 0 0 0; font-size:13px">밑반찬류</div>
                <div class="option_button">옵션 선택</div>
            </div>
        </c:forEach>
    </div>
    <!-- forEach문 종료 -->

    <div style="margin-top: 50px"></div>

    <!-- 팝업 영역 -->
    <div class="container">
        <div class="item" ><img id="pop_img" src=""></div>
        <div class="item" id="pop_content">
            <div class="popup">밑반찬류 <span style="float: right; font-size: 17px; padding-right: 5px">17,000 원</span></div>
            <div class="popup">뚝배기 순두부 찌게</div>
            <div class="popup">
                <select style="font-size: 15px; width: 40px" id="select_option">
                   <option value="0">소</option>
                   <option value="1">중</option>
                   <option value="2">대</option>
                </select>
            </div>
            <div class="popup" id="button_cart">장바구니</div>
        </div>
    </div>



</section>
</body>

</html>