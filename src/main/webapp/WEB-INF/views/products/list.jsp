<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
<script src="https://kit.fontawesome.com/804c868edf.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
<script>
	$(document).ready(function() {
	  // Isotope grid
	  var $grid = $('.grid').isotope({
	    itemSelector: '.product-item',
	    layoutMode: 'fitRows'
	  });
	  // Filter checkboxes
	  var $checkboxes = $('.filters input');
	  $checkboxes.change(function() {
	    var filters = [];
	    $checkboxes.filter(':checked').each(function() {
	      filters.push(this.value);
	    });
	    filters = filters.join('');
	    $grid.isotope({ filter: filters });
	  });
	});
</script>
 <style>
        .Section {
            width:100%;
            height:100%;
            margin:auto;
        }
        .offsetSection {
            width:100%;
            height:15px;
        }
        .titleSection {
            width:100%;
            height:50px;
            display:flex;
        }
        .title {
            width:80%;
            height:100%;
            position:relative;
        }
        .title-text {
            position:absolute;
            display:block;
            top:25%;
            width:30%;
            height:100%;
            margin:auto;
            font-weight: bolder;
            padding-left:5%;
        }
        .navFilter {
            width:20%;
            height:100%;
            display:flex;
            align-items: center;
        }
        .filterButton {
            width:50%;
            height:65%;
            display:table;
        }
        .sortButton {
            width:50%;
            height:65%;
        }
        .filterbtn, .sortbtn {
            border: none;
            height:100%;
        }
        .main {
            width:100%;
            display:flex;
        }
        .filterSection {
            width:13.5%;
        }
        .bodySection {
            width:86.5%;
            display:flex;
            justify-content: center;
        }
        .item_card {
            text-decoration-line: none;
        }
        .bodyMain {
            width:95%;
        }
        .product-item {
        	width:33.3333%;
            height:710px;
            margin-top:2px;
        }
        .items {
            display:flex;
            justify-content: start;
        }
        .item {
            width:33.3333%;
            height:710px;
            margin-top:2px;
        }
        .item_body {
            width:97%;
            height:95%;
            margin:auto;
        }
        figure {
            width:100%;
            height:100%;
            display:contents;
        }
        .item_img {
            width:100%;
            height:76%;
        }
        .item_info {
            width:100%;
            height:24%;
        }
        .item_titles {
            height:30%;
        }
        .item_title {
            height:50%;
            font-size:17px;
            font-weight:500;
            color:#111111;
        }
        .item_subtitle {
            height:50%;
            font-size:17px;
            color:#757575;
        }
        .item_spicy_level {
            height:15%;
            font-size:17px;
            color:#757575;
        }
        .item_size {
            height:25%;
            font-size:17px;
            color:#757575;
        }
        .item_price {
            height:25%;
            font-weight:500;
            font-size:17px;
            color:black;
        }
        
        .left-nav-wrapper {
        	height:1000px;
        	padding: 0 0 1em 48px;
        }
        .left-nav {
        	position:relative;
        	background:#fff;
        }
        .category-css {
       		width:192px;
       		height:166px;
       		margin:0px 0px 15px;
       		border-bottom:1px solid #cccccc;
        }
        .category-css > a{
        	display:block;
        	text-decoration:none;
        	color:black;
        	text-align:left;
        	font-size:15px;
        	margin:0px 0px 0px 4px;
        	padding:0px 18px 10px 0px;
        }
        .filter-group-content {
        	width:192px;
        	height:163px;
        	border-bottom:1px solid #cccccc;
        }
        .filter-title-cate {
        	padding:12px 0px;
        	margin-top:13px;
        }
    </style>
</head>
<body>
<section class="Section">
    <div class="offsetSection"></div>
    <div class="titleSection">
        <div class="title">
            <h1 class="title-text">

            </h1>
            <h1 class="item-count">

            </h1>
        </div>
        <nav class="navFilter">
            <div class="filterButton">
                <button class="filterbtn">
                    <span class="filter-text"></span>
                    <i class="fa-solid fa-arrow-down-short-wide"></i>
                </button>
            </div>
            <div class="sortButton">
                <button class="sortbtn">
                    <span class="sort-text"></span>
                    <i class="fa-sharp fa-solid fa-chevron-down"></i>
                </button>
            </div>
        </nav>
    </div>
    <div class="offsetSection"></div>
    <div class="main">
        <div class="filterSection">
			<div class="left-nav-wrapper">
				<nav class="left-nav">
					<div class="catecory-content">
						<div class="category-css">
							<a href=""> 한식 </a>
							<a href=""> 중식 </a>
							<a href=""> 일식 </a>
							<a href=""> 양식 </a>
						</div>
					</div>
					
					<div class="filter-group-content">
						<div class="filter-title-cate">
							<div class="spicy-level-label">
								맵기
							</div>
						</div>
						<div class="filters">
							<input type="checkbox" value=".1">안 매움<p>
							<input type="checkbox" value=".2">조금 매움<p>
							<input type="checkbox" value=".3">존내 매움
						</div>
					</div>
					
					<div class="filter-group-content">
						<div class="filter-title-cate">
							<div class="spicy-level-label">
								가격대
							</div>
						</div>
						<div class="filters">
							<input type="checkbox" value=".low">0~20,000원 <p>
							<input type="checkbox" value=".middle">20,000 ~ 50,000원 <p>
							<input type="checkbox" value=".high">50,000 ~ 100,000원 <p>
						</div>
					</div>
					
					<div class="filter-group-content">
						<div class="filter-title-cate">
							<div class="spicy-level-label">
								사이즈
							</div>
						</div>
						<div class="filters">
							<input type="checkbox" value=".소"> 소량인 <p>
							<input type="checkbox" value=".중"> 중량인 <p>
							<input type="checkbox" value=".대"> 대량인 <p>
						</div>
					</div>
					
					<div class="filter-group-content">
						<div class="filter-title-cate">
							<div class="spicy-level-label">
								칼로리
							</div>
						</div>
						<div class="filters">
							<input type="checkbox" value=".diet"> 다이어트식 <p>
							<input type="checkbox" value=".basic"> 일반식 <p>
						</div>
					</div>
				</nav>
			</div>
        </div>
        <div class="bodySection">
            <main class="bodyMain">
                <section class="mainSection">
                <div class="grid-all">
                <div class="grid cate">
                    <div class="items">
                        <c:forEach items="${list}" var="list" varStatus="status">
                        <div class="product-item ${list.size} ${list.spicylevel_id}
                        <c:if test="${list.price<=20000}">
                        low
                        </c:if>
                        <c:if test="${list.price>20000 && list.price<=50000}">
                        middle
                        </c:if>
                        <c:if test="${list.price>50000}">
                        high
                        </c:if>
                        ">
                        <div class="item">
                            <div class="item_body">
                                <figure>
                                    <a class="item_card" href="/products/views/${list.id}">
                                        <div class="item_img">
                                            <img class="image" src="/resources/img/${list.image_url}" width="507" height="507">
                                        </div>
                                        <div class="item_info">
                                            <div class="item_titles">
                                                <div class="item_title">${list.title}</div>
                                               	<div class="item_subtitle">${list.subcategory_name}</div>
                                            </div>
                                            <div class="item_spicy_level">${list.spicylevel}</div>
                                            <div class="item_size">${list.size}</div>
                                            <div class="item_price"><fmt:formatNumber value="${list.price}" pattern="###,###,###"/>원</div>
                                        </div>
                                    </a>
                                </figure>
                            </div>
                         </div>
                        </div>
                        <c:if test="${status.count % 3 == 0}">
                        </div>
                         <div class="items">
                        </c:if>
                        </c:forEach>
                    </div>
                 </div>
                 </div>
                </section>
            </main>
        </div>
    </div>
</section>
</body>
</html>