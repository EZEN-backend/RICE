<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style>


        section table {
            border-spacing: 0px; /* 셀과 셀의 공간 */
            margin-top: 30px;
        }

        section table tr:first-child td {
            border-top: 2px solid #cccccc;
        }

        section table tr:last-child td {
            border-bottom: 1px solid #cccccc;
        }

        section table td {
            font-size: 14px;
            height: 30px;
            padding-left: 10px;
        }

        section table tr td:first-child {
            background: #eeeeee;
            padding-right: 10px;
        }

        #locationUp {
            width: 140px;
            height: 50px;
            border: 1px solid black;
            border-radius: 25px;
            background: black;
            font-size: 17px;
            font-weight: 600;
            color: white;
            cursor: pointer;
        }

        #locationX {
            width: 100px;
            height: 50px;
            border: 1px solid black;
            border-radius: 25px;
            background: white;
            font-size: 17px;
            font-weight: 600;
            color: black;
            cursor: pointer;
        }

        .update {
            width: 50px;
            height: 50px;
            border: 0px;
            background: white;
            font-size: 14px;
            font-weight: 550;
            color: black;
            text-decoration: underline;
            cursor: pointer;
        }


        .fullscreen {
            width: 1920px;

        }

        .screen1 {
            max-width: 1400px;
            margin: auto;
            min-height: calc(100vh - 396px);
            display: flex;
            margin-bottom: 0px;
        }

        .screen2:nth-child(1) {
            flex-basis: 70%;
        }

        .screen2 #mini-cart {
            margin-left: 20px;
        }

        .header {
            width: 100%;
            height: 30px;
            align: center;
        }


        .mini, .juso {
            margin-top: 10px;
            width: 100%;
        }

        .mini:nth-child(1) {
            height: 18px;
            font-size: 15px;
            font-weight: 540;

        }

        .mini:nth-child(2) {
            height: 18px;
            font-size: 15px;
            font-weight: 540;

        }

        .mini:nth-child(3) {
            height: 18px;
            font-size: 15px;
            font-weight: 540;
        }

        .mini:nth-child(4) {
            height: 18px;
            font-size: 16px;
            font-weight: 570;
        }

        .mini-right {
            dispaly: inline-block;
            float: right;
        }

        .mini-item-info {
            height: 1080px;
            padding: 24px 0px 0px;
            margin: 0px 8px;
            margin-left: 20px;
        }

        .baeday {
            height: 18px;
            font-size: 16px;
            font-weight: 570;
            margin-left: 20px;
        }

        .juso, .Payment-method, #order-ok {
            font-weight: 555;
            font-size: 16px;
        }


        .name, .state, .roadname, .zip,
        .email, .phone {
            color: #757575;

        }

        .kind, .spicy, .quantity, .price, .size {
            color: #757575;
        }

        .title {
            font-size: 20px;
            font-weight: 550;
        }

        .mini-item-info {
            display: flex;
            height: 140px;
        }

        .order-info {
            height: 120px;
            padding: 20px;
        }

        .address {
            height: 120px;
            padding: 20px;
        }

        #update, #update2 {
            float: right;
        }

        #submit {
            display: flex;
            justify-content: flex-end;
        }

        input[type="radio"] {

            color: black;
            height: 22px;
            width: 22px;
            margin: 0px;
        }

        .order-check {
            font-size: 12px;
            float: right;
            color: #757575;
        }

        section hr {
            border-color: #eeeeee;
            border-top: none;
        }

        a {
            color: #111;
            cursor: pointer;
            text-decoration: none;
            font-weight: 500;
        }

        #payform, #update1 {
            display: none;
        }

        #update1 {
            float: right;
        }

        .terms {
            text-decoration: underline;
            text-decoration-thickness: 2px;
        }

        .payview {
            width: 100px;
            height: 50px;
            border: 1px solid black;
            border-radius: 25px;
            background: black;
            font-size: 17px;
            font-weight: 600;
            color: white;
            cursor: pointer;
        }

        .payclick {
            width: 100px;
            height: 50px;
            border-radius: 25px;
            border: 0px;
            font-size: 17px;
            font-weight: 600;
            color: #606060;
            cursor: pointer;
            background: #e0e0e0;
        }

        .form {
            width: 700px;
            padding: 20px;
            margin: 20px auto 0 auto;
            display: flex;
            flex-flow: column;
            gap: 20px;
        }

        .input-container {

            width: 700px;
            border: 1px solid #666;
            border-radius: 10px;
            padding: 24px 10px 18px 10px;
            position: relative;
        }

        .input-label {
            background-color: #fff;
            position: absolute;
            top: -10px;
            left: 7px;
            padding: 0 3px;
            font-size: 12px;
            color: #9b9b9b;
        }

        .input {
            font-size: 18px;
        }

        #address-change input[type=text] {
            border: 0px;
            outline: none;
            width: 470px;
            height: 25px;
        }
    </style>
    <script>

        function viewform() {
            var payview1 = document.querySelector("#payview1");
            var payclickBtn = document.querySelector(".payclick");

            payview1.style.visibility = "hidden";
            payclickBtn.style.display = "block";

            document.getElementById("update1").style.display = "block";
            document.getElementById("payform").style.display = "block";


            var selected = $('input[name=pay]:checked').val();
            $('input[name=pay]').each(function () {
                if ($(this).val() != selected) {
                    $(this).parent().hide();
                }
            });
        }


        $(document).ready(function () {
            $("#address-change").hide();

            $("#update").click(function () {
                $(".address").hide();
                $("#address-change").show();
                $(".payok").hide();
                $("#payview1").hide();
            });

            $("#locationX").click(function () {
                $(".address").show();
                $("#address-change").hide();
                $("#payview1").show();
                $(".payok").show();
            });

        });

        function PaySelect() {
            var payDivs = document.querySelectorAll('.pay');
            for (var i = 0; i < payDivs.length; i++) {
                payDivs[i].style.display = "block";
            }

            var payview1 = document.querySelector("#payview1");
            var payclickBtn = document.querySelector(".payclick");

            payview1.style.visibility = "visible";
            payclickBtn.style.display = "none";
            payclickBtn.disabled = true;
            payclickBtn.style.background = "#e0e0e0";
            payclickBtn.style.color = "#606060";


            document.getElementById("update1").style.display = "none";
            document.getElementById("payform").style.display = "none";

            var agreeCheckbox = document.getElementById('agree-checkbox');
            agreeCheckbox.checked = false;


        }


        var IMP = window.IMP;
        IMP.init("imp65013215");


        var today = new Date();
        var hours = today.getHours();
        var minutes = today.getMinutes();
        var seconds = today.getSeconds();
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours + minutes + seconds + milliseconds;

        function requestPayKakao() {
            IMP.request_pay({
                pg: 'kakaopay',
                pay_method: 'card',
                merchant_uid: "IMP" + makeMerchantUid,
                name: "상품명",
                amount: '${totalPrice}',
                buyer_email: '${lvo.email}',
                buyer_name: '${lvo.name}',
                buyer_tel: '${lvo.phone}',
                buyer_addr: 'buyer\'s address',
            }, function (rsp) {
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }

        function requestPayKCP() {
            IMP.request_pay({
                pg: 'kcp',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: '${item.title}',
                amount: '${totalPrice}',
                buyer_email: '${lvo.email}',
                buyer_name: '${lvo.name}',
                buyer_tel: '${lvo.phone}',
                buyer_addr: 'buyer\'s address',
            }, function (rsp) {
                console.log(rsp);
                if (rsp.success) {
                    var msg = 'Your payment has been completed.';
                    msg += 'Unique ID: ' + rsp.imp_uid;
                    msg += 'Store transaction ID: ' + rsp.merchant_uid;
                    msg += 'Paid amount: ' + rsp.paid_amount;
                    msg += 'Card approval number: ' + rsp.apply_num;
                    alert(msg);
                } else {
                    var msg = 'Payment failed.';
                    msg += 'Error description: ' + rsp.error_msg;
                    alert(msg);
                }
            });
        }

        function requestPayPayco() {
            IMP.request_pay({
                pg: 'payco',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: '${item.title}',
                amount: 100,
                buyer_email: 'buyer\'s email@email.com',
                buyer_name: '${lvo.name}',
                buyer_tel: '010-1234-5678',
                buyer_addr: 'buyer\'s address',
            }, function (rsp) {
                console.log(rsp);
                if (rsp.success) {
                    var msg = 'Your payment has been completed.';
                    msg += 'Unique ID: ' + rsp.imp_uid;
                    msg += 'Store transaction ID: ' + rsp.merchant_uid;
                    msg += 'Paid amount: ' + rsp.paid_amount;
                    msg += 'Card approval number: ' + rsp.apply_num;
                    alert(msg);
                } else {
                    var msg = 'Payment failed.';
                    msg += 'Error description: ' + rsp.error_msg;
                    alert(msg);
                }
            });
        }

        $(function () {
            $(".payclick").click(function () {
                if ($("input:radio[name=pay]:checked").val() == '0') {
                    requestPayKakao();
                } else if ($("input:radio[name=pay]:checked").val() == '1') {
                    requestPayKCP();
                } else if ($("input:radio[name=pay]:checked").val() == '2') {
                    requestPayPayco();
                } else if ($("input:radio[name=pay]:checked").val() == '3') {
                    alert("Cash Execution");
                }

            });
        });

        $(document).ready(function () {
            $('#agree-checkbox').click(function () {
                if ($(this).prop('checked')) {
                    $('.payclick').prop('disabled', false),
                        $('.payclick').css("background", "black"),
                        $('.payclick').css("color", "white");

                } else {
                    $('.payclick').prop('disabled', true),
                        $('.payclick').css("background", "#e0e0e0"),
                        $('.payclick').css("color", "#606060");
                }
            });

            // 주소 변경후 저장 버튼 누르기
            $("#locationUp").on("click", function () {
                //주소 변경창 닫기
                $(".address").show();
                $("#address-change").hide();
                $("#payview1").show();
                $(".payok").show();


                //변경된 주소를 가져와서 새로운 배송주소로 다시 뿌리기
                var juso01 = $(".input.juso1").val();
                var juso02 = $(".input.juso2").val();
                var juso03 = $(".input.juso3").val();
                var phone01 = $(".input.phone1").val();


                //form에 있는 변경된 주소 db로 전송해서 저장
                var queryString = $("form[name=addressChange]").serialize();

                $.ajax({
                    type: 'post',
                    url: '/products/locationup',
                    data: queryString,
                    dataType: 'text',
                    success: function (data) {
                        console.log(data);

                        $(".juso01").text("주소 : " + juso01);
                        $(".juso02").text("상세주소 : " + juso02);
                        $(".juso03").text("우편번호 : " + juso03);
                        $(".phone01").text("전화번호 : " + phone01);


                    },
                    error: function () {
                        alert("주소변경이 되지 않았습니다.");
                    }

                });
            });


        });
    </script>
</head>
<body>
<section>
    <div class="fullscreen">
        <div class="header">
            <h1 align="center"> 결제하기 </h1>
        </div>
        <div class="screen1">
            <div class="screen2">
                <table width="1000" align="center">
                    <caption id="option"><h2 align="left"> 배송 옵션 <input class="update" type="button" id="update"
                                                                        value="편집"></h2></caption>
                </table>
                <p>
                <div class="address">
                    <div class="baddress">
                        <div class="juso"> 배송주소</div>
                        <div class="name"> 이름 : ${lvo.name} </div>
                        <div class="state juso01"> 주소 : ${lvo.address} </div>
                        <div class="roadname juso02"> 상세주소 : ${lvo.extra_address} </div>
                        <div class="zip juso03"> 우편번호 : ${lvo.zip} </div>
                        <div class="email"> 이메일 : ${lvo.email} </div>
                        <div class="phone phone01"> 전화번호 : ${lvo.phone} </div>
                    </div>
                </div>
                <div id="address-change">
                    <form class="form" name="addressChange">
                        <div class="input-container">
                            <label for="name" class="input-label">
                                이름 *
                            </label>
                            <input class="input" type="text" name="name" readonly value="${lvo.name}"/>
                        </div>
                        <div class="input-container">
                            <label for="address" class="input-label">
                                주소 *
                            </label>
                            <input class="input juso1" type="text" name="address" value="${lvo.address}"/>
                        </div>
                        <div class="input-container">
                            <label for="extra_address" class="input-label">
                                상세주소 *
                            </label>
                            <input class="input juso2" type="text" name="extra_address" value="${lvo.extra_address}"/>
                        </div>
                        <div class="input-container">
                            <label for="zip" class="input-label">
                                우편번호 *
                            </label>
                            <input class="input juso3" type="text" name="zip" value="${lvo.zip}"/>
                        </div>
                        <div class="input-container">
                            <label for="phone" class="input-label">
                                전화번호 *
                            </label>
                            <input class="input phone1" type="text" name="phone" value="${lvo.phone}"/>
                        </div>
                        <div class="input-container">
                            <label for="email" class="input-label">
                                이메일 *
                            </label>
                            <input class="input" type="text" readonly value="${lvo.email}"/>
                        </div>
                        <div id="submit">
                            <input id="locationUp" type="button" value="저장 및 계속">
                            <input id="locationX" type="button" value="취소">
                        </div>
                    </form>
                </div>
                <p>
                <hr>
                <table width="1000" align="center">
                    <caption id="payment"><h2 align="left"> 결제 <input class="update" type="button" id="update1"
                                                                      value="편집" onclick="PaySelect()"></h2></caption>
                </table>
                <div class="payok">
                    <div>
                        <div class="Payment-method"> 결제 수단 선택</div>
                    </div>
                    <p>
                    <div>
                        <div class="pay"><input type="radio" name="pay" value="0" checked>
                            <img src="/resources/pay/kakaopay.png" valign="center">
                        </div>
                        <div class="pay"><input type="radio" name="pay" value="1">
                            <img src="/resources/pay/card.png" valign="center">
                        </div>
                        <div class="pay"><input type="radio" name="pay" value="2">
                            <img src="/resources/pay/payco.png" valign="center">
                        </div>
                        <div class="pay"><input type="radio" name="pay" value="3">
                            <img src="/resources/pay/naverpay.png" valign="center">
                        </div>
                        <div class="pay"><input type="radio" name="pay" value="4">
                            <img src="/resources/pay/silsigan.png" valign="center">
                        </div>
                    </div>
                </div>
                <br>
                <div id="payview1">
                    <span id="submit"><input class="payview" type="button" value="주문하기" onclick="viewform()"></span><br>
                    <span class="order-check"> 주문 검토 후 카드 세부 정보를 입력합니다 </span>
                </div>
                <p>
                <hr>
                <div width="1000px"><h2> 주문완료 </h2></div>
                <form id="payform" method="post">
                    <div>
                        <div><input type="checkbox" id="agree-checkbox"> <a href="../products/agreementservice"
                                                                            class="terms" target="_blank">구매 약관</a>에
                            동의합니다
                        </div>
                    </div>
                    <p>
                    <div>
                        <div id="submit">
                            <input class="payclick" type="button" value="주문하기" disabled>
                        </div>
                    </div>
                </form>
                <hr>
            </div>

            <div class="screen2">
                <table align="center" width="400">
                    <caption id="mini-cart"><h2 align="left"><input class="update" type="button" id="update2" value="편집"
                                                                    onclick="location.href='/cart'"> 장바구니 </h2>
                    </caption>
                </table>
                <div class="order-info">
                    <div class="item">
                        <div class="mini">상품금액<span class="mini-right" id="total">${subTotalPrice }</span> </div>
                        <div class="mini">할인<span class="mini-right"> 0원 </span></div>
                        <div class="mini">배송비<span class="mini-right">${deliveryFees }</span></div>
                        <div>(5만원 이상 무료배송)</div>
                        <div class="mini">총 결제 금액<span class="mini-right" id="total2">${totalPrice }</span></div>
                    </div>
                </div>
                <div class="baeday">
                    <div> 도착예정일 : <span>${deliveryDay }</span></div>
                </div>

                <!-- 구매한 상품의 이미지와 선택한 옵션들이 list 형태로 출력 -->
                <c:forEach var="item" items="${cartList }">
                    <div class="mini-item-info">
                        <div class="item-picture">
                            <div><img src="${item.product_img}" width="120" height="120"></div>
                        </div>
                        <div class="item-info">
                            <div class="title"> ${item.title } </div>
                            <p>
                            <div class="kind"> 종류 : <span>${item.subcategory }</span></div>
                            <div class="spicy"> 맵기 : <span>${item.spicy }단계</span></div>
                            <div class="size"> 사이즈 : <span>${item.size }</span></div>
                            <div class="quantity"> 수량 : <span>${item.quantity } 개</span></div>
                            <div class="price"> 가격 : <span>${item.price } </span></div>
                        </div>
                    </div>
                    <hr>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
</body>
</html>

