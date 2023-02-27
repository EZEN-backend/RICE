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
            background: ivory;
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

        .carosel {
            width: 100%;
            display: grid;
            background: blue;
            grid-template-columns: 1fr 1fr 1fr;
            align-items: center;
        }

        .carosel-text {
            width: 100%;
            height: 60px;
            display: grid;
            grid-template-columns: 1fr 3fr 1fr;
            background: yellow;
        }

        .detail-body {
            width: 100%;
        }

        .details {
            max-width: 1440px;
            margin: auto;
            background: pink;
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
            margin: auto;
        }

        .images-wrapper {
            width: 89%;
            height: 100%;
            margin: auto;
        }

        .images {
            display: grid;
            grid-template-columns: 1fr 1fr;
            background: yellow;
            grid-gap: 12px;
        }

        .detail-text {
            width: 456px;
        }

        .recommends {
            width: 100%;
            background: coral;
        }

        img {
            max-width: 100%;
            object-fit: contain;
        }

        .recommend-item {
            display: flex;
            flex-wrap: wrap;
            gap: 10px 10px;
            scroll-snap-type: x mandatory;
            overflow: auto;
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
            margin-top: 12px;
        }
    </style>
</head>
<body>
<div class="contentSection">
    <div class="content">
        <div class="content-body">
            <div class="content-details">
                <div class="carosel">
                    <div class="empty-carosel"></div>
                    <div class="carosel-text">
                        <div class="carosel-text-empty-space"></div>
                        <div class="carosel-slider">
                            <span></span>
                            <p></p>
                        </div>
                        <div class="carosel-text-empty-space"></div>
                    </div>
                    <div class="empty-carosel"></div>
                </div>
                <div class="detail-body">
                    <div class="details">
                        <dis class="detail-flex">
                            <div class="detail-images">
                                <div class="images-wrapper">
                                    <%--                                <c:forEach items="" var="">--%>
                                    <div class="images">
                                        <div class="a">
                                            <img src="/resources/img/bab.jpeg">
                                        </div>
                                        <div class="a">
                                            <img src="/resources/img/bab.jpeg">
                                        </div>
                                        <div class="a">
                                            <img src="/resources/img/bab.jpeg">
                                        </div>
                                        <div class="a">
                                            <img src="/resources/img/bab.jpeg">
                                        </div>
                                        <div class="a">
                                            <img src="/resources/img/bab.jpeg">
                                        </div>
                                        <div class="a">
                                            <img src="/resources/img/bab.jpeg">
                                        </div>
                                        <div class="a">
                                            <img src="/resources/img/bab.jpeg">
                                        </div>
                                    </div>
                                    <%--                                </c:forEach>--%>
                                </div>
                            </div>
                            <div class="detail-text">
                                <div class="detail-text-wrapper">
                                    <div class="detail-information">
                                        <div class="detail-titles">
                                            <h1 class="title-text">나이키 스포츠웨어 스우시</h1>
                                            <h2 class="subtitle-text">찜/ 탕</h2>
                                            <div class="detail-product-price">59,000</div>
                                        </div>
                                        <div class="detail-buytools">
                                            <form class="buytools">
                                                <div class="product-size-wrapper">
                                                    <fieldset class="product-size">
                                                        <legend class="product-size-headline">
                                                            <div class="size-title">사이즈 선택</div>
                                                            <div class="size-guide">사이즈 가이드</div>
                                                        </legend>
                                                        <div class="product-size-box">

                                                        </div>
                                                    </fieldset>
                                                </div>
                                                <div class="product-spicy-wrapper">
                                                    <fieldset class="product-spicy">
                                                        <legend class="product-spicy-headline">
                                                            <div class="spicy-title">맵기 선택</div>
                                                            <div class="spicy-guide">맵기 가이드</div>
                                                        </legend>
                                                        <div class="product-spicy-box">
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </form>
                                            <div class="button-box">
                                                <div class="button-box-wrapper">
                                                    <button aria-label="장바구니">장바구니</button>
                                                    <button aria-label="위시리스트">
                                                        <span>위시리스트</span>
                                                        <span><i class="fa-regular fa-heart"></i></span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <span class="detail-body">
                                            <div class="detail-body-informations">
                                                <p></p>
                                                <ul>
                                                    <li></li>
                                                    <li></li>
                                                </ul>
                                            </div>
                                            <button class="product-detail-view-modal">
                                                <span>상세 정보 보기</span>
                                            </button>
                                        </span>
                                        <div class="product-detail-moreInfo">
                                            <details class="size_tips">
                                                <summary><h3>사이즈 & 맵기 & 팁</h3></summary>
                                                <ul>
                                                    <li>샬라샬라</li>
                                                    <li>샬라샬라</li>
                                                </ul>
                                            </details>
                                            <details class="order_returning">
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
                                                <summary><h3>리뷰</h3><span>리뷰 점수 반영</span></summary>
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
                                            <p>
                                            <details class="extra_detail">
                                                <summary><h3>추가 정보</h3></summary>
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
                    <div class="recommends">
                        <div class="recommend-items">
                            <div class="recommend-item">
                                <div class="recommend-item-wrapper">
                                    <div class="recommend-item-image">
                                        <img src="/resources/img/bab.jpeg">
                                    </div>
                                    <div class="recommend-item-text">

                                    </div>
                                </div>
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