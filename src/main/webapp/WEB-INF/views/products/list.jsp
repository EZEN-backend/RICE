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

// 받아온 검색어를 변수안에 넣어주고
	var search = "${search}";
// +'&search='+search;
	var category = "${category_id}";
	var subcategory = "${subcategory_id}";
	
	// 스크롤 이벤트가 한번에 여러번 실행되지 않게 하기 
	var timer = null;

// 스크롤 이벤트 발동!
$(window).scroll(function(){
    //console.log(search);
    //console.log(category);
	//console.log(subcategory);
	
    // 현재 스크롤의 위치를 scrT 라는 변수안에 저장
    var scrT = $(window).scrollTop();

    // 현재스크롤위치(scrT) == 페이지 전체높이 - 브라우저창의 높이가 350이하 일때 실행
    if(scrT + $(window).height() >= $(document).height() - 350) {
    // 둘이 같아지면 아래를 실행해라 ~
        
    // setTime 이벤트로 스크롤 이벤트 한번만 실행 할 수 있게 처리하기
    	if(timer != null)
    	{
    		clearTimeout(timer); // 스크롤 이벤트가 한번 실행이 되면 멈추게끔 타이머를 제거
    	}
    	timer = setTimeout(function(){
    		var start = $('.product-item').length; // 출력된 상품들의 수
            var end = 6; // 임시로 3개씩 추가로 가져오기
            
            // 쿼리파라미터 이용해서 limit ?,?에 들어갈 값 + 검색어 보내주기
            if(category != "")
            {
            	var url = '/products/getItems?category_id='+category+'&subcategory_id='+subcategory+'&start='+start+'&end='+end
            }
            else
            {
            	var url = '/search/getItems2?start='+start+'&end='+end+'&search='+search;
            }
            // 아래는 ajax 요청 처리
            $.ajax({
                type : 'get',
                url : url,
                dataType:"json",
                success : function(list) {
                    var itemsHtml = '';
                   	
                    for(var i=0;i<list.length;i++)
                    {
                        var productHtml = '<div class="product-item '+list[i].size+' '+list[i].spicylevel_id+' ';
                        
                        if (parseFloat(list[i].price) <= 50000) {
                            productHtml += 'low';
                        } else if (parseFloat(list[i].price) > 50000 && parseFloat(list[i].price) <= 100000) {
                            productHtml += 'middle';
                        } else {
                            productHtml += 'high';
                        }
                        // 문자열 이어줄때 실수한게 끝부분에 '+ 까지 적어둔 다음에 밑에줄에 적을때 ' 로 다시 이어줘야 하는거야 까먹지말자 주냥아
                        productHtml += '"><div class="item"><div class="item_body"><figure><a class="item_card" href="/products/detail/'+list[i].id+'">'+
                        '<div class="item_img"><img class="image" src="/resources/img/'+list[i].image_url+'" width="507" height="507"></div><div class="item_info">'+
                        '<div class="item_titles"><div class="item_title">'+list[i].title+'</div><div class="item_subtitle">'+list[i].subcategory_name+'</div></div>'+
                        '<div class="item_spicy_level">'+list[i].spicylevel+'</div><div class="item_size">'+list[i].size+'</div><div class="item_price">'+parseFloat(list[i].price).toLocaleString()+'원</div></div></a></figure></div></div></div>';
                       
                        itemsHtml += productHtml;
    					
                        // 데이터베이스에서 받아온 상품정보를 HTML문자열로 생성하기 + 그리드에 3개씩 넣어서 그룹화하기
                        // 그룹화 한 후에 .grid-all 요소에 추가하여 출력!
                        if((i+1)%3 == 0){
                    	    var groupHtml = '<div class="items">'+itemsHtml+'</div>';
                    	    $(".grid-all").append(groupHtml);
                    	    itemsHtml = '';
                    	}
                    }
    				
                    // 데이터베이스에서 가져온 상품의 수가 3개로 나눠떨어지지 않을때는 나머지것들 그룹화하여 출력
                    if(list.length%3 != 0){
                        itemsHtml = '<div class="items">'+itemsHtml+'</div>';
                        $(".grid-all").append(itemsHtml);
                    }
                },
            });
            timer = null; // 스크롤 이벤트를 한번 실행 후 값을 null로 다시 바꿔줘서 스크롤 이벤트 실행못하게 막기
    	}, 150);
    }
});
	
	// isotope 라이브러리 처리 코
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
    </div>
    <div class="offsetSection"></div>
    <div class="main">
        <div class="filterSection">
			<div class="left-nav-wrapper">
				<nav class="left-nav">
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
							<input type="checkbox" value=".low">0~50,000원 <p>
							<input type="checkbox" value=".middle">50,000 ~ 100,000원 <p>
							<input type="checkbox" value=".high">100,000원 이상 상품 <p>
						</div>
					</div>
					
					<div class="filter-group-content">
						<div class="filter-title-cate">
							<div class="spicy-level-label">
								사이즈
							</div>
						</div>
						<div class="filters">
							<input type="checkbox" value=".S"> S <p>
							<input type="checkbox" value=".M"> M <p>
							<input type="checkbox" value=".L"> L <p>
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
                        <c:if test="${list.price<=50000}">
                        low
                        </c:if>
                        <c:if test="${list.price>50000 && list.price<=100000}">
                        middle
                        </c:if>
                        <c:if test="${list.price>100000}">
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