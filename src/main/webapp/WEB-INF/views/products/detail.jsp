<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://kit.fontawesome.com/f1fa4a6c48.js" crossorigin="anonymous"></script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style>
        .contentSection {
            margin: auto;
        }

        .content {
            width: 100%;
        }

        .content-body {
            width: 100%;
        }

        .content-details {
            width: 100%;
        }

        .carousel {
            width: 100%;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            align-items: center;
        }

        .carousel-text {
            width: 100%;
            height: 60px;
            display: grid;
            grid-template-columns: 1fr 3fr 1fr;
        }

        .detail-body {
            width: 100%;
        }

        .details {
            max-width: 1440px;
            margin: auto;
        }

        .detail-flex {
            width: 100%;
            display: flex;
            justify-content: center;
            padding-top: 3%;
            padding-bottom: 3%;
        }

        .detail-images {
            width: calc(100% - 456px);
        }

        .images-wrapper {
            width: 89%;
            height: 100%;
            margin: auto;
        }

        .images {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 12px;
        }

        .detail-text {
            width: 456px;
        }

        img {
            max-width: 100%;
            object-fit: contain;
        }

        .title-text {
            font-weight: 500;
            font-size: 28px;
            margin: auto;
        }

        .subtitle-text {
            margin: auto;
            font-weight: 500;
            font-size: 16px;
        }

        .detail-product-price {
            margin-top: 14px;
            margin-bottom: 14px;
        }

        .detail-information {
            width: 80%;
        }

        .product-size, .product-spicy {
            line-height: 24px;
            font-size: 16px;
            box-sizing: inherit;
            border: none;
            height: 100px;
            padding: 0;
            margin: 0px 0px 0px 0px;
        }

        .product-size {
            margin: 32px 0px 0px 0px;
        }

        .product-size-headline, .product-spicy-headline {
            display: flex;
            width: 100%;
            justify-content: space-between;
            padding: 0px;
        }

        .sizeContainer, .spicyContainer {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            align-content: space-between;
            justify-content: center;
            justify-items: center;
            gap: 7px;
            width: 100%;
        }

        .sizeContainer > div, .spicyContainer > div {
            width: 100%;
            height: 100%;
        }

        .sizeBox {
            width: 100%;
            height: 35px;
            display: flex;
            justify-content: center;
            align-content: center;
            align-items: center;
            border-radius: 8px;
            outline: none;
        }

        .sizeInput, .spicyInput {
            display: none;
        }

        .button-box-wrapper {
            display: table;
            vertical-align: middle;
            width: 100%;
            margin: auto;
        }

        .button-box {
            margin-bottom: 50px;
        }

        .cartButton, .wishlistButton {
            display: flex;
            width: 100%;
            min-height: 60px;
            font-size: 16px;
            justify-content: center;
        }

        .cartButton {
            background-color: #111111;
            border: none;
            border-radius: 30px;
            color: #FFFFFF;
            cursor: pointer;
            display: inline-block;
            padding: 12px 24px;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
        }

        .cartButton:hover {
            background-color: #757575;
            border-color: #757575;
        }

        .wishlistButton {
            margin-top: 12px;
            background-color: #FFFFFF;
            border: 1px solid #CCCCCC;
            border-radius: 30px;
            color: #333333;
            cursor: pointer;
            display: inline-block;
            padding: 12px 24px;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
        }

        .wishlistButton:hover {
            background-color: #FFFFFF;
            border-color: #111111;
        }

        .wishText {
            padding: 0px 12px 0px 12px;
        }

        .product-detail-moreInfo {
            margin-top: 40px;
        }

        details {
            box-shadow: inset 0 -1px 0 0 #e5e5e5;
            box-sizing: inherit;
        }

        summary {
            list-style: none;
            cursor: pointer;
        }

        summary > h3 {
            font-weight: 500;
            font-size: 20px;
            line-height: 1.2;
        }

        .detail-body-information > ul, .etc-present-information > ul, .product-review > ul {
            margin-block-start: 0;
            margin-block-end: 0;
            margin-inline-start: 0;
            margin-inline-end: 0;
            padding-inline-start: 17px;
        }

        .detail-body-information > ul > li, .etc-present-information > ul > li, .product-review > ul > li {
            list-style: disc;
            cursor: default;
            margin-top: 10px;
        }

        .order-returning > summary h3::after, .extra-detail > summary h3::after {
            content: "\f078";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            margin-left: 5px;
            float: right;
        }

        .product-reviews > summary {
            display: flex;
        }

        .product-reviews > summary > h3 {
            width: 20%;
        }

        .product-reviews > summary::after {
            content: "\f078";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            margin-left: 5px;
            float: right;
            justify-content: center;
            align-items: center;
            display: flex;
            font-size: 20px;
        }

        .product-reviews > summary > span {
            justify-content: flex-end;
            align-items: center;
            display: flex;
            width: 80%;
        }

        .review-button > button {
            all: unset;
            border-bottom: 1px solid #111111;
            cursor: pointer;
            margin-bottom: 40px;
        }

        .sizeBox {
            border: 1px solid #ccc;
        }

        .active .sizeBox {
            border-color: black;
        }

        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 9999;
            overflow-y: auto;
            display: none;
        }

        .modal-container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            max-width: 440px;
            max-height: 300px;
            overflow: auto;
            background-color: #fff;
            z-index: 10000;
            padding: 32px;
            border-radius: 20px;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.3);
        }

        .modalButtonContainer {
            display: flex;
            justify-content: flex-end;
        }

        .close-modal {
            border: none;
            background-color: transparent;
            font-size: 1.5rem;
            cursor: pointer;
        }

        .modal h2 {
            font-size: 1.5rem;
            font-weight: bold;
            margin: 0 0 20px;
        }

        .modal p {
            font-size: 1.2rem;
            line-height: 1.5;
            margin: 0;
        }

        .modal {
            padding-bottom: 45px;
            overflow: auto;
        }

        .move_to_cart {
            width: 100%;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .moveCart {
            border-radius: 20px;
            background-color: black;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .addModal {
            position: fixed;
            top: 10.2%;
            left: 0;
            width: 100%;
            height: 90%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 9999;
            display: none;
        }

        .modal-header {
            position: fixed;
            right: 2%;
            max-width: 400px;
            max-height: 250px;
            background-color: #fff;
            z-index: 10000;
            padding: 32px;
            border-radius:10px;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.3);
        }

        .modalButtonContainer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 16px;
        }

        .closeModal {
            border: none;
            background-color: transparent;
            font-size: 1.5rem;
            cursor: pointer;
        }

        .modalInfo h2 {
            font-size: 16px;
            font-weight: bold;
            margin: 0 0 20px;
        }

        .modalInfo p {
            padding: 0px 0px 10px 20px;
            font-size: 14px;
            line-height: 1;
            margin: 0;
        }

        .modalInfo {
            padding: 26px 0px 26px 0px;
            overflow: auto;
            display: flex;
            width: 100%;
            height: 100%;
        }

        .info-img {
            width: 25%;
        }

        .info-detail {
            width: 75%;
        }

        .modal-btn {
            width: 100%;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .cart-btn {
            border-radius: 40px;
            background-color: white;
            box-shadow: rgb(229 229 229) 0px 0px 0px 1px;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            color: #111111;
        }

        .cart-btn:hover {
            border: 1px solid black;
        }

        .order-btn {
            border-radius: 40px;
            background-color: black;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .cart-btn, .order-btn {
            margin: 0px 6px 0px 6px;
            border: 1px solid rgb(229 229 229);
            width: 90%;
            height: 60px;
        }

        .wish-btn {
            border-radius: 40px;
            background-color: black;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            margin: 0px 6px 0px 6px;
            border: 1px solid rgb(229 229 229);
            width: 100%;
            height: 60px;
        }

        .detail-subname, .detail-size, .detail-spicy {
            color: #757575;
        }

        .recommendsContainer {
            width: 94%;
            height: 30%;
            margin: auto;
        }

        .recommend-item {
            margin: 0;
        }

        .recommend-header {
            margin: auto;
            width: 94.5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-title {
            font-size: 20px;
            font-weight: normal;
        }

        .link-to-detail:visited {
            color: black;
        }

        .link-to-detail {
            text-decoration: none;
            color: black;
        }

        .recommendBtn-wrapper {
            display: flex;
        }

        .previousBtn-wrapper, .nextBtn-wrapper {
            border-radius: 30px;
            background: rgb(245, 245, 245);
            width: 50px;
            height: 50px;
            display: flex;
            margin: auto;
            justify-content: center;
        }

        .nextBtn-wrapper {
            margin: 0px 0px 0px 10px;
        }

        .previousBtn, .nextBtn {
            background-color: transparent;
            border: none;
            cursor: pointer;
            font-size: 30px;
        }

        .previousBtn:hover, .nextBtn:hover {
            color: gray;
        }

        .recommend-slider {
            display: flex;
            margin: 0;
            padding: 0;
            list-style: none;
            overflow-x: scroll;
            scroll-snap-type: x mandatory;
            -webkit-overflow-scrolling: touch;
            scroll-behavior: smooth;
        }

        .slide-item {
            flex: 0 0 33.33%;
            width: 100%;
            scroll-snap-align: center;
        }

        .recommend-item-image-container {
            position: relative;
            padding-top: 100%;
        }

        .recommend-item-image {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }

        .recommend-item-image img {
            max-width: 100%;
            max-height: 100%;
            display: block;
            margin: 0 auto;
        }

        .recommend-detail-text h1 {
            font-size: 18px;
            font-weight: normal;
            margin: 0;
        }

        .recommend-detail-text h2 {
            font-size: 16px;
            font-weight: normal;
            margin: 5px 0;
        }

        .recommend-detail-price h3 {
            font-size: 16px;
            font-weight: bold;
            margin: 0;
        }
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
    <script>
        $(document).ready(function () {

            let product_id = ${pvo.id};
            let price = ${pvo.price};
            let size = "";
            let spicy = "";

            function timer(name) {
                setTimeout(function () {
                    $(name).fadeOut();
                }, 4000);
            };

            function formatPrice(price) {
                return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }

            $('.sizeInput').on('click', function () {
                $('.sizeContainer').css('box-shadow', 'none');
                $('.size-title').css('color', 'inherit');
                $('.sizeInput').prop('checked', false).parent().removeClass('active');
                $(this).prop('checked', true).parent().addClass('active');
                size = $('input[name=productSize]:checked').next('label').text();
                if ($('.spicyInput:checked').length === 1) {
                    $('.warningText').remove();
                    $('.button-box').css('margin', '0px');
                } else {
                    $('.warningText').text('맵기를 선택하세요');
                }
                if (size == "중") {
                    price =
                    ${pvo.price} *
                    1.2;
                } else if (size == "대") {
                    price =
                    ${pvo.price} *
                    1.4;
                } else {
                    price = ${pvo.price};
                }
                $('.detail-product-price').text(formatPrice(price) + '원');
            });

            $('.spicyInput').on('click', function () {
                $('.spicyContainer').css('box-shadow', 'none');
                $('.spicy-title').css('color', 'inherit');
                if ($('.sizeInput:checked').length === 1) {
                    $('.warningText').remove();
                    $('.button-box').css('margin', '0px');
                } else {
                    $('.warningText').text('사이즈를 선택하세요');
                }
                $('.spicyInput').prop('checked', false).parent().removeClass('active');
                $(this).prop('checked', true).parent().addClass('active');
                spicy = $('input[name=productSpicy]:checked').next('label').text();
            });

            if ($('.sizeInput:checked').length > 0 && $('.spicyInput:checked').length > 0) {
                $('.warningText').remove();
            }
            $(".cartButton").on("click", function () {
                if ($('.sizeInput:checked').length > 0 && $('.spicyInput:checked').length > 0) {
                    $('.button-box').css('margin', '0px');
                    $.ajax({
                        type: "GET",
                        url: "/cartBtn?product_id=" + product_id + "&size=" + size + "&spicy=" + spicy,
                        dataType: "text",
                        success: function (data) {
                            //경우의 수 | 담긴다 or 안담긴다
                            if (data == '0') {
                                timer('.modal-overlay');
                                // 0(false)일 경우 || 상품 개수가 초과 되었을 때
                                $('body').css('overflow', 'hidden').addClass('modal-open');
                                $('.modal-overlay').fadeIn();
                                $('div.modal > p:first').text('죄송합니다. 구매하실 수 있는 최대 수량를 넘었습니다. 제품을 삭제하고 다시 시도해 주세요.');
                            } else if (data == "a") {
                                location.href = "/users/signin";
                            } else {
                                // 1(true)일 경우 || 상품 등록. 우측 상단에 모달창 띄우기
                                timer('.addModal');
                                $('#cart_amount').text(data);
                                $('body').css('overflow', 'hidden').addClass('modal-open');
                                $('.addModal').fadeIn();
                                $('#cart_amount').text(data);
                                $('div.modalButtonContainer > strong').text('장바구니 추가 완료');
                                $('p.detail-size').css('display', '');
                                $('p.detail-size').text('사이즈 ' + size);
                                $('p.detail-spicy').text('맵기 ' + spicy);
                                $('p.detail-price').text(formatPrice(price) + ' 원');
                                $('.wish-btn').css('display', 'none');
                                $('.order-btn').css('display', '');
                                $('.cart-btn').css('display', '');
                                console.log(size);
                                console.log(spicy);
                            }
                        },
                        error: function () {
                            timer('.modal-overlay');
                            $('body').css('overflow', 'hidden').addClass('modal-open');
                            $('.modal-overlay').fadeIn();
                        }
                    });
                } else if ($('.sizeInput:checked').length > 0) {
                    //사이즈가 체크가 되지 않았을 때
                    event.preventDefault();
                    $('.warningText').remove();
                    $('.product-spicy-wrapper').after('<span class="warningText" style="color:#d43f21;">맵기를 선택하세요</span> ')
                    $('.button-box').css('margin', '35px 0px 50px 0px');
                    $('.spicyContainer').css('box-shadow', 'rgb(212, 63, 33) 0px 0px 0px 1px');
                    $('.spicy-title').css('color', 'rgb(212, 63, 33)');
                    console.log(size + ' else if');
                    console.log(spicy + ' else if');

                } else if ($('.spicyInput:checked').length > 0) {
                    // 맵기가 체크되지 않았을 떄
                    event.preventDefault();
                    $('.warningText').remove();
                    $('.product-spicy-wrapper').after('<span class="warningText" style="color:#d43f21;">사이즈를 선택하세요</span> ')
                    $('.button-box').css('margin', '35px 0px 50px 0px');
                    $('.sizeContainer').css('box-shadow', 'rgb(212, 63, 33) 0px 0px 0px 1px');
                    $('.size-title').css('color', 'rgb(212, 63, 33)');
                    console.log(size + ' else if else');
                    console.log(spicy + ' else if else');
                } else {
                    //사이즈와 스파이스 체크 안되었을 떄
                    event.preventDefault();
                    $('.warningText').remove();
                    $('.product-spicy-wrapper').after('<span class="warningText" style="color:#d43f21;">사이즈와 맵기를 선택하세요</span> ')
                    $('.button-box').css('margin', '35px 0px 50px 0px');
                    $('.spicyContainer').css('box-shadow', 'rgb(212, 63, 33) 0px 0px 0px 1px');
                    $('.sizeContainer').css('box-shadow', 'rgb(212, 63, 33) 0px 0px 0px 1px');
                    $('.spicy-title').css('color', 'rgb(212, 63, 33)');
                    $('.size-title').css('color', 'rgb(212, 63, 33)');
                    console.log(size + ' else');
                    console.log(spicy + ' else');
                }
            });

            $(".wishlistButton").on("click", function () {
                $.ajax({
                    type: "GET",
                    url: "/wishBtn/" + product_id,
                    dataType: "Text",
                    success: function (data) {
                        if (data == '0') {
                            // 1 (true)일 경우 하트 아이콘 --> 빈 하트
                            $('.fa-heart').attr('class', 'fa-regular fa-heart');
                        } else if (data == 'a') {
                            location.href = "/users/signin";
                        } else {
                            timer('.addModal');
                            // 0 (false)일 경우 하트 아이콘 --> 꽉 찬 하트
                            // 모달 창 띄워서 정보 출력
                            $('.fa-heart').attr('class', 'fa-solid fa-heart');
                            $('body').css('overflow', 'hidden').addClass('modal-open');
                            $('.addModal').fadeIn();
                            $('div.modalButtonContainer > strong').text('위시리스트 추가되었습니다');
                            $('p.detail-size').css('display', 'none');
                            $('.order-btn').css('display', 'none');
                            $('.cart-btn').css('display', 'none');
                            $('.wish-btn').css('display', '');
                        }
                    }
                });
            });

            $('.close-modal').click(function () {
                $('.modal-overlay').fadeOut();
                $('body').removeClass('modal-open').css('overflow', 'auto');
            });
            $(".closeModal").click(function () {
                $('.addModal').fadeOut();
                $('body').removeClass('modal-open').css('overflow', 'auto');
            });

            $('.previousBtn').click(function () {
                const currentPosition = $('.recommend-slider').scrollLeft();
                const itemWidth = $('.slide-item').width();
                const newPosition = currentPosition - itemWidth;
                $('.recommend-slider').animate({scrollLeft: newPosition}, 200);
            });
            $('.nextBtn').click(function () {
                const currentPosition = $('.recommend-slider').scrollLeft();
                const itemWidth = $('.slide-item').width();
                const newPosition = currentPosition + itemWidth;
                $('.recommend-slider').animate({scrollLeft: newPosition}, 200);
            });
        });
    </script>
</head>
<body>
<div class="contentSection">
    <div class="content">
        <div class="content-body">
            <div class="content-details">
                <div class="carousel">
                    <div class="empty-carousel"></div>
                    <div class="carousel-text">
                        <div class="carousel-text-empty-space"></div>
                        <div class="carousel-slider">
                            <span></span>
                            <p></p>
                        </div>
                        <div class="carousel-text-empty-space"></div>
                    </div>
                    <div class="empty-carousel"></div>
                </div>
                <div class="detail-body">
                    <div class="details">
                        <dis class="detail-flex">
                            <div class="detail-images">
                                <div class="images-wrapper">
                                    <div class="images">
                                        <c:forEach items="${imglist}" var="image" varStatus="count">
                                            <div class="imagesContainer">
                                                <img src="${image.image_url}">
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="detail-text">
                                <div class="detail-text-wrapper">
                                    <div class="detail-information">
                                        <div class="detail-titles">
                                            <h1 class="title-text">${pvo.name}</h1>
                                            <h2 class="subtitle-text">${pvo.subcategory_name}</h2>
                                            <div class="detail-product-price">
                                                <fmt:formatNumber value="${pvo.price}" pattern="###,###,###"/>원
                                            </div>
                                        </div>
                                        <div class="detail-buyTool">
                                            <form class="buyTool">
                                                <div class="product-size-wrapper">
                                                    <fieldset class="product-size">
                                                        <legend class="product-size-headline">
                                                            <div class="size-title">사이즈 선택</div>
                                                            <div class="size-guide">사이즈 가이드</div>
                                                        </legend>
                                                        <div class="sizeContainer">
                                                            <div>
                                                                <input id="sSize" name="productSize" type="radio"
                                                                       class="sizeInput">
                                                                <label for="sSize" class="sizeBox">소</label>
                                                            </div>
                                                            <div>
                                                                <input id="mSize" name="productSize" type="radio"
                                                                       class="sizeInput">
                                                                <label for="mSize" class="sizeBox">중</label>
                                                            </div>
                                                            <div>
                                                                <input id="lSize" name="productSize" type="radio"
                                                                       class="sizeInput">
                                                                <label for="lSize" class="sizeBox">대</label>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                                <div class="product-spicy-wrapper">
                                                    <fieldset class="product-spicy">
                                                        <legend class="product-spicy-headline">
                                                            <div class="spicy-title">맵기 선택</div>
                                                            <div class="spicy-guide">맵기 가이드</div>
                                                        </legend>
                                                        <div class="spicyContainer">
                                                            <div>
                                                                <input id="Level0" name="productSpicy" type="radio"
                                                                       class="spicyInput">
                                                                <label for="Level0" class="sizeBox">1</label>
                                                            </div>
                                                            <div>
                                                                <input id="Level1" name="productSpicy" type="radio"
                                                                       class="spicyInput">
                                                                <label for="Level1" class="sizeBox">2</label>
                                                            </div>
                                                            <div>
                                                                <input id="Level2" name="productSpicy" type="radio"
                                                                       class="spicyInput">
                                                                <label for="Level2" class="sizeBox">3</label>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                                <div class="button-box">
                                                    <div class="button-box-wrapper">
                                                        <button class="cartButton" type="button" id="${pvo.id}">장바구니
                                                        </button>
                                                        <button class="wishlistButton" type="button">
                                                            <span class="wishText">위시리스트</span>
                                                            <c:choose>
                                                                <c:when test="${pvo.wish_count == 0}">
                                                                    <span><i class="fa-regular fa-heart"></i></span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span><i class="fa-solid fa-heart"></i></span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <p class="detail-bodyText">${pvo.body}</p>
                                        <span class="detail-body">
                                            <div class="detail-body-information">
                                                <p>이런 정보를 제공함</p>
                                                <ul>
                                                    <li>현재 사이즈: ${pvo.size}</li>
                                                    <li>현재 맵기: ${pvo.spicylevel}</li>
                                                </ul>
                                            </div>
                                        </span>
                                        <div class="product-detail-moreInfo">
                                            <details class="order-returning">
                                                <summary><h3>무료 배송 및 반품</h3></summary>
                                                <p><strong>일반 배송&nbsp;</strong></p>
                                                <p>• 배송지역: 전국 (일부 지역 제외)</p>
                                                <p>• 배송비: 100,000원 이상 무료 배송</p>
                                                <p>• 제품 수령일로부터 14일 이내 제품에 대해서만 무료 반품 서비스가 가능합니다.</p>
                                                <p><br></p>
                                                <p><strong>오늘도착 서비스</strong></p>
                                                <p>• 이용시간: 낮 12시까지 결제 시, 당일 도착 (일요일, 공휴일 제외)</p>
                                                <p>• 서비스지역: 서울∙과천∙의왕∙군포∙수원∙성남∙안양시 전체, 용인시 수지구∙기흥구, 부천시 중동∙상동∙심곡동</p>
                                                <p>• 서비스비용: 5,000원</p>
                                                <p>&nbsp;</p>
                                                <p><strong>A/S 안내&nbsp;</strong></p>
                                                <p>• 라이스에서 구매하신 제품에 대한 A/S 는 일절 책임지지 않습니다.</p>
                                            </details>
                                            <details class="product-reviews">
                                                <summary>
                                                    <c:choose>
                                                        <c:when test="${pvo.reviews_amount == 0}">
                                                            <h3>리뷰 </h3>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <h3>리뷰 (${pvo.reviews_amount})</h3>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <span></span>
                                                </summary>
                                                <div class="reviews-data">
                                                    <div class="reviews-component">
                                                        <div class="product-review">
                                                            <div class="start-rating"></div>
                                                            <p class="rating">점수</p>
                                                            <p class="review-button">
                                                                <button type="button" class="write-review">
                                                                    리뷰 작성하기
                                                                </button>
                                                            </p>
                                                            <ul class="user-review">
                                                                <li>유저 리뷰 데이터 칸</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </details>
                                            <details class="extra-detail">
                                                <summary>
                                                    <h3>추가 정보</h3>
                                                </summary>
                                                <div class="etc-present-information">
                                                    <p><strong>상품정보제공고시</strong></p>
                                                    <ul>
                                                        <li><strong>제조연월</strong>: 수입제품으로 각 상품별 입고 시기에 따라 상이하여 정확한 제조연월
                                                            제공이 어렵습니다. 제조연월을 확인하시려면 고객센터에 문의하시기 바라며, 정확한 제조연월은 배송받으신 제품의
                                                            라벨을 참고하시기 바랍니다.
                                                        </li>
                                                    </ul>
                                                    <ul>
                                                        <li><strong>A/S 책임자와 전화번호</strong>: 이젠 컴퓨터 학원 고객센터 /
                                                            031-994-8111
                                                        </li>
                                                        <li>
                                                            미성년자는 구매 불가능합니다.
                                                        </li>
                                                        <li><strong>품질보증기준:</strong> 품질보증기간-1년. 유통 중 손상되었거나 품질에 이상이 있는
                                                            제품에 한하여 소비자 피해 보상 규정에 의거 보상하여 드립니다. 단, 제품에 부착되어 있는 사용방법 및 취급
                                                            시 주의사항에 따라 제품을 관리해 주시고, 소비자 부주의로 인한 품질 이상 및 변형에 대해서는 책임을 지지
                                                            않습니다.
                                                        </li>
                                                    </ul>
                                                    <ul>
                                                        <li>
                                                            <strong>제조자/수입품의 경우 수입자를 함께 표기</strong>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </details>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </dis>
                    </div>
                    <div class="recommendsContainer">
                        <div class="recommend-items">
                            <div class="recommend-item">
                                <div class="recommend-item-wrapper">
                                    <div class="recommend-header">
                                        <span class="header-title">추천 상품</span>
                                        <div class="recommendBtn-wrapper">
                                            <div class="previousBtn-wrapper">
                                                <button class="previousBtn">
                                                    <i class="fa-solid fa-chevron-left fa-1g" style="color:gray;"></i>
                                                </button>
                                            </div>
                                            <div class="nextBtn-wrapper">
                                                <button class="nextBtn">
                                                    <i class="fa-solid fa-chevron-right" style="color:gray;"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="recommend-slider">
                                        <c:forEach items="${recommend_pvo}" var="items" varStatus="item-count">
                                            <li class="slide-item">
                                                <a class="link-to-detail" href="/products/views/${items.id}">
                                                    <figure class="recommend-card">
                                                        <div class="recommend-body">
                                                            <div class="recommend-item-image-container">
                                                                <div class="recommend-item-image">
                                                                    <picture>
                                                                        <img src="/resources/img/${items.image_url}">
                                                                    </picture>
                                                                </div>
                                                            </div>
                                                            <div class="recommend-item-text">
                                                                <div class="recommend-detail-text">
                                                                    <h1>${items.name}</h1>
                                                                    <h2>${items.subcategory_name}</h2>
                                                                </div>
                                                                <div class="recommend-detail-price">
                                                                    <div class="recommend-price">
                                                                        <h3><fmt:formatNumber value="${pvo.price}"
                                                                                              pattern="###,###,###"/>
                                                                            원</h3>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </figure>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-overlay">
                        <div class="modal-container">
                            <div class="modalButtonContainer">
                                <h2>알림</h2>
                                <button class="close-modal"><i class="fa-solid fa-xmark"></i></button>
                            </div>
                            <div class="modal">
                                <p>요청을 처리하는 과정에서 문제가 발생하였습니다. 문제가 계속되면 페이지를 새로고침 하세요.</p>
                            </div>
                            <div class="move_to_cart">
                                <button class="moveCart" onclick="location.href='/cart'">장바구니 보기</button>
                            </div>
                        </div>
                    </div>
                    <div class="addModal">
                        <div class="modal-header">
                            <div class="modalButtonContainer">
                                <strong></strong>
                                <button class="closeModal"><i class="fa-solid fa-xmark"></i></button>
                            </div>
                            <div class="modalInfo">
                                <div class="info-img">
                                    <img src="/resources/img/${pvo.image_url}">
                                </div>
                                <div class="info-detail">
                                    <p class="detail-name">${pvo.name} </p>
                                    <p class="detail-subname">${pvo.subcategory_name}</p>
                                    <p class="detail-size"></p>
                                    <p class="detail-spicy"></p>
                                    <p class="detail-price"></p>
                                </div>
                            </div>
                            <div class="modal-btn">
                                <c:choose>
                                    <c:when test="${pvo.cart_products_amount != 0}">
                                        <button class="cart-btn">장바구니 (${pvo.cart_products_amount})</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="cart-btn" onclick="location.href='/cart'">장바구니</button>
                                    </c:otherwise>
                                </c:choose>
                                <button class="order-btn" onclick="location.href='/products/orders?price=${pvo.price}'">
                                    결제하기
                                </button>
                                <button class="wish-btn" onclick="location.href='/wish'">위시리스트 보기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>