<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://kit.fontawesome.com/f1fa4a6c48.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
	<style>
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

		.notosanskr * {
			font-family: 'Noto Sans KR', sans-serif;
		}

		body {
			width:100%;
			margin:0px;
			z-index:1;
			position:relative;
			font-family: 'Noto Sans KR', sans-serif;
			font-weight: 500;
			font-size: 14px;

		}
		a {
			list-style-type:none;
			text-decoration-line: none;
			color:black;
			cursor:pointer;
		}
		#first {
			width:100%;
			height:40px;
		}
		.top-menu {
			width:80%;
		}
		.pre-desktop-menu {
		    width: calc(100% - 426px);
		    margin: 0 auto;
		    height: 60px;
		    padding:2px;
		    overflow: hidden;
		    max-width: 1255px;
		    text-align:center;
		}
		.subcate {
			list-style: none;
    		list-style-type: none;
			display:inline-block;
    		padding-top:11px;
    		vertical-align: top;
    		cursor:pointer;
			font-size: 16px;
		}
		.pre-desktop-menu li {
			width: 200px;
			height: 40px;
		}
		.cate-container {
			width: 100%;
			margin: 0 auto;
			height: 330px;
			text-align: center;
			display:none;
			position:absolute;
			z-index:99;
			background:white;
			list-style:none;
			list-style-type:none;
		}
		.cate-container > ul {
			margin: 0px 0px 0px 0px;
			padding-top:20px;
		}
		.cate-container li{
			width:200px;
		}
		.subcate-container {
		    list-style: none;
		    list-style-type: none;
		    display: inline-block;
		    vertical-align: top;
		    line-height:50px;
		}
		.subcate-container a {
			margin-bottom:6px;
			color:#757575;
		}
		.subcate-container a:hover {
			color:black;
		}

		.topview {
			color:#757575;
		}

		#csearch {
			width:40px;
			height:30px;
			background:-60px 0;
			float:right;
			margin-top:5px;
		}

		.fa-solid {
			cursor: pointer;
		}
		#search_form {
			position:absolute;
			left:0;
			right:0;
			width:100%;
			height:400px;
			text-align:center;
			background:white;
			transition:0.5;
			display:none;
			z-index:99;
			border-bottom:1px solid black;
		}
		#search_form input[type="text"] {
			height:35px;
			border:none;
			border-bottom:1px solid #34404b;
			width:800px;
			display:inline-block;
			outline:none;
		}
		#search_form input[type="submit"] {
			vertical-align:bottom;
		}
		#search_form > div {
			position:relative;
			margin-top:60px;
			font-size:20px;
		}
		#search_form > div > span {
			color:#C0C0C0;
		}
		.topid :hover {
			color:black;
		}


		#topmsg {
			width:100%;
			height:40px;
			background:#F0F0F0;
			display:flex;
		}
		#topmsg #right {
			margin-top:0px;
			width:500px;
			text-align:right;
			padding-top:9px;
			margin-right:50px;
			font-size:14px;
		}
		#topmsg #right > a {
			width:100px;
		}
		header {
		    margin:auto;
			width:100%;
			background:white;
			height:50px;
		}

		.header-icons {
			width:8.9%;
			text-align:center;
			padding-top:15px;
		}
		.header-icons i {
			padding-right:10px;
			position:relative;
		}
		header #left {
			width:11.1%;
			text-align:center;
		}
		header #second {
			display:flex;
			width:100%;
			margin-top:0px;
			background:white;
			height:50px;
			overflow:hidden;
			position:absolute;
			z-index:98;
		}
		body #mymenu {
			position:relative;
			display:inline-block;
			height:35px;
		}
		body #mymenu #mysub {
			width:105px;
			height:130px;
			margin-right: -30px;
			padding-left:0px;
			position:absolute;
			margin-top:21px;
			right:0px;
			top:10px;
			padding:4px;
			z-index:99;
			background:white;
			visibility:hidden;
			border-radius:25px;
		}

		body #mymenu #mysub li {
			list-style-type:none;
			margin:auto;
			margin-top:5px;
			padding-top:-2px;
			width:70px;
			text-align:center;
		}
		#topmsg a {
			text-decoration:none;
			color:black;
		}
		#topmsg a:hover {
			color:#757575;
		}
		footer {
			width:100%;
			height:443px;
			margin:auto;
			background:black;
		}
		#subfooter {
			width:100%;
			height:60px;
			position:relative;
			padding:5px;
			color:#C0C0C0;
			margin:0px -6px;
			border-bottom:1px solid white;
		}
		#lastfoot {
			width:100%;
			height:91px;
			display:flex;
		}
		#lastfoot a {
			text-decoration:none;
			text-decoration:underline;
			color:#A0A0A0;
		}
		#lastfoot #lfooter {
			width:680px;
			height:79px;
		}
		#lastfoot #rfooter {
			width:680px;
			height:79px;
			color:#C0C0C0;
		}
		#rfooter > div {
			position:relative;
			font-size:12px;
			top:20px;
			left:17px;
		}
		#lfooter #info {
			position:relative;
			top:20px;
			left:-6px;
			color:#C0C0C0;
			font-size:12px;
		}
		#lfooter #service {
			position:relative;
			top:20px;
			left:-6px;
			color:#C0C0C0;
			font-size:12px;
		}
		footer #container {
			width:1440px;
			height:403px;
			margin:auto;
			position:relative;
		}
		footer #footerbody {
			position:absolute;
			width:1372px;
			height:214px;
			top:10%;
			margin: 0px -6px 16px;
		}
		footer #hf-group {
			width:1029px;
			height:213px;
			margin:0px -6px;
		}
		#hf-group > div {
			width:275px;
			height:142px;
			display:inline-block;
			float:left;
		}
		#hf-group > div >ul li{
			padding:6px;
			list-style-type:none;
		}
		#hli {
			font-size:16px;
			color:white;
		}
		#sli {
			font-size:13px;
			color:#C0C0C0;
		}
		#social {
			width:343px;
			height:36px;
			color:white;
			position:absolute;
			top:0px;
			right:0px;
		}
		#hfirst {
			width:100%;
			height:40px;
			align:center;
		}
		#search_form i{
			position:absolute;
			padding-top:15px;
			padding-left:10px;
		}

		/* 장바구니 속에 숫자 보이게 하기 */
		#cart_amount {
		    display:inline-block;
		    position:absolute;
		    left:18px;
		    top:-5px;
		    width:13px;
		    height:13px;
		    border-radius:6px;
		    background-color:purple;
		    color:white;
		    font-size:5px;
		    text-align:center;
		    padding-top:2px;

		}

		#search_form input[type=button] {
			border:none;
			border-radius:15px;
		}
		#search_form input[type=button]:hover{
			background:#cccccc;
		}
		#modal {
		  position:fixed;
		  width:100%;
		  height:100%;
		  background:rgba(0, 0, 0, 0.5);
		  top:150px;
		  left: 0;
		  z-index: 95;
		  display: none;
		  backdrop-filter:blur(5px);
		}

	</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>

	//새로 만든 카테고리 기능
	$(document).ready(function() {
		var $second = $('#second'),
			$modal = $('#modal'),
			$subcate = $('.subcate'),
			$catecon = $('.cate-container');

		$($subcate).hover(function() {
			$catecon.stop().slideDown(),
					$modal.stop().fadeIn();
		}, function() {
			if (!$catecon.is(":hover")) {
				$catecon.stop().slideUp();
				$modal.stop().fadeOut();
			}
		});
		$('.subcate-container > a').hover(function(e) {
			e.stopPropagation();
		});
		$catecon.hover(function() {
			$modal.stop().fadeIn();
		}, function() {
			$catecon.stop().slideUp();
			$modal.stop().fadeOut();
		});
	});

	// 검색바를 포함하고 있는 modal slideDown
		// 클릭 이벤트 등록 , 모달창을 제외한 부분에 backdrop-filter 이용해서 blur

		$(document).ready(function() {
		  $('#vsearch').click(function() {
		    $('#search_form').slideDown(200);
		    $("#modal").fadeIn();
		  });

		  $("#csearch").click(function(){
		        $("#search_form").slideUp(100);
		        $("#modal").fadeOut();
		    });

		  // outside 클릭 이벤트 등록
		  $(document).mouseup(function(e) {
		    var container = $('#search_form');
		    var modal = $('#modal');
		    if (!container.is(e.target) && container.has(e.target).length == 0) {
				isSearchFormShown = false;
				$('html, body').css({
					overflow: '', // searchbar가 사라지면 초기값으로 변환해서 스크롤 기능 돌려놓기
					height: ''
				});
				container.slideUp(100);
				modal.fadeOut();
		    }
		  });
		});


		function view_sub()
		{
		 document.getElementById("mysub").style.visibility="visible";
		}
		function out_sub()
		{
		 document.getElementById("mysub").style.visibility="hidden";
		}

		function gsearch()
		{
			document.search_form.submit();
		}

		// main 카트 아이콘 클릭시 이동하는 경로
		function gcart()
		{
			location.href="/cart";
		}
		// main 하트 아이콘 클릭시 이동하는 경로
		function gwish()
		{
			location.href="/wish";
		}

		// 장바구니 카트에 현재 장바구니에 담겨있는 상품 수량 표시되는 함수
		$(function() {

    		$.ajax ({
    			type: "get",
    			url : "/cartCount",
    		    dataType: "text",
    		    success: function(data) {
    		    	console.log('통신성공');
    		    	//상단 우측 카드 이미지에 현재 장바구니 상품 수량 넘기기
    		    	document.getElementById("cart_amount").innerText=data;

    		    },
    		    error: function() {
    		    	console.log('통신에러');
    		    }
    		});
    	});

	$(function() {
		$.ajax({
			url: "/search/product",
			dataType: "json",
			success: function(topview) {
				for (var i = 0; i < topview.length; i++) {
					document.getElementsByClassName('topview')[i].innerText=topview[i].title;
					$('.topid').eq(i).attr('href','/products/views/'+topview[i].id);
					console.log(topview);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
			}
		});
	});

	</script>

</head>
	<decorator:head/>
<body>

<div id="modal"></div>
<div id="first">
	<div id="topmsg">
		<div id="hfirst">
			<form id="search_form" name="search_form" method="get" action="/search/list">
				<input type="text" name="search">
				<i class="fa-solid fa-magnifying-glass" onclick="gsearch()"></i>
				<input type="button" value="취소" id="csearch" style="cursor:pointer">
				<div>
					<p><span>인기상품</span></p>
					<a class="topid" href=""> <p class="topview"> </p> </a>
					<a class="topid" href=""> <p class="topview"> </p> </a>
					<a class="topid" href=""> <p class="topview"> </p> </a>
					<a class="topid" href=""> <p class="topview"> </p> </a>
				</div>
			</form>
		</div>
		<div id="right">
			<c:if test="${useremail == null and naveremail == null}">
			<a href="#">  매장찾기  </a> |
			<a href="#">  고객센터  </a> |
			<a href ="/users/signin"> 가입하기 </a> |
			<a href = "/users/signin"> 로그인 </a>
			</c:if>
			<c:if test="${useremail != null or naveremail != null }">
			
				<c:if test = "${useremail != null }">
				    ${username}님, 안녕하세요 |  고객센터 |
				</c:if>

				<c:if test = "${naveremail != null }">
				    ${navername}님, 안녕하세요 |  고객센터 |
				</c:if>
	            
	            <c:choose>
	                <c:when test = "${useremail == 'admin@rice.co.kr' }">
	                    <a href = "/admin"> 관리자페이지 |  </a>
	                    <a href= "/users/signout">로그아웃</a>
	                </c:when>
	                
	                <c:otherwise>
				        <span id="mymenu"> <a href="#" onmouseover="javascript:view_sub()" onmouseout="javascript:out_sub()">MyPage</a> 
					    <ul id="mysub" onmouseover="javascript:view_sub()" onmouseout="javascript:out_sub()">
						    <li> <a href="/users/userview">회원정보</a> </li>
						    <li> 주문목록 </li>		
						    <li> 적 립 금 </li>				
						    <li> <a href= "/cart">장바구니</a> </li>		
						    <li> <a href= "/users/signout">로그아웃</a> </li>		
					    </ul>
				       </span>
				   </c:otherwise>
			    </c:choose>
			</c:if>
		</div>
	</div>
</div>
 



	<header>
		<div id="second">
			<div id="left"><a href="/"><img src="/resources/img/rice.png" width="70" height="50"></a> </div>
			<div class="top-menu">
				<ul class="pre-desktop-menu">
					<li class="subcate"> 한 식 </li>
					<li class="subcate"> 일 식 </li>
					<li class="subcate"> 중 식 </li>
					<li class="subcate"> 양 식 </li>
				</ul>
			</div>
			<!-- 검색돋보기 -->
			<div class="header-icons">
				<i class="fa-solid fa-magnifying-glass" id="vsearch" style="cursor:pointer"></i>
				<i class="fa-regular fa-heart" id="wish_view" onclick="gwish()" style="cursor:pointer"></i>
				<i class="fa-solid fa-cart-shopping" id="cart_view" onclick="gcart()" style="cursor:pointer; ">
			   		<span id="cart_amount">0</span>
				</i>
			</div>
		</div>
	</header> <!-- 로그인,회원가입,로고 -->
	<div class="cate-container">
		<ul>
			<li class="subcate-container">
				<a href="/products/1/1">찜/탕</a><p>
				<a href="/products/1/2">반찬</a><p>
				<a href="/products/1/3">볶음류</a><p>
				<a href="/products/1/4">구이</a><p>
				<a href="/products/1/5">치킨</a>
				<a href="/products/1/6">기타/분식</a>
			</li>
			<li class="subcate-container">
				<a href="/products/2/1">튀김류</a><p>
				<a href="/products/2/2">면류</a><p>
				<a href="/products/2/3">스시</a><p>
				<a href="/products/2/4">덮밥</a>
			</li>
			<li class="subcate-container">
				<a href="/products/3/1">튀김류</a></p>
				<a href="/products/3/2">면류</a></p>
				<a href="/products/3/3">밥류</a></p>
				<a href="/products/3/4">만두류</a>
			</li>
			<li class="subcate-container">
				<a href="/products/4/1">파스타</a></p>
				<a href="/products/4/2">육류</a></p>
				<a href="/products/4/3">피자</a></p>
				<a href="/products/4/4">샐러드</a>
			</li>
		</ul>
	</div><!-- menu 관련 -->
<decorator:body/>
	<footer><!-- 사이트관련 내용 -->
	<div id="container">
		<div id="footerbody">
			<div id="hf-group">
				<div>
					<ul>
						<li id="hli"> 새로운대식 </li>
						<li id="hli"> 회원가입 </li>
						<li id="hli"> 박할머니 온라인몰 </li>
						<li id="hli"> 박할머니 저널 </li>
					</ul>
				</div>
				<div>
					<ul>
						<li id="hli"> 주문배송조회?? </li>
						<li id="sli"> 결제 방법 </li>
						<li id="sli"> 공지 사항 </li>
						<li id="sli"> 문의 하기 </li>
						<li id="sli"> 배송 조회  </li>
					</ul>
				</div>
				<div>
					<ul>
						<li id="hli"> ABOUT RICE </li>
						<li id="sli"> 대식 </li>
						<li id="sli"> 후원 </li>
						<li id="sli"> 지속적으로 먹기 </li>
					</ul>
				</div>
			</div>
			<div id="social">
				<ul>
					<li>
						소셜 링크 연결 임시로 넣어둠
					</li>
				</ul>
			</div>
			<div id="subfooter">
				© 2023 Rice, Inc. All Rights Reserved
			</div>
			<div id="lastfoot">
				<div id="lfooter">
					<span id="info">
						(유)라이스코리아 대표 k1lee , 킴벌리 린 창 멘데스 |
						서울 강남구 테헤란로 321 강남파이낸스센터 92층 | 통신판매업신고번호 2011-서울강남-02345 |
						등록번호 111-12-20391 <a href="#">사업자 정보 확인</a>
					</span>
					<p>
					<span id="service">
						고객센터 전화 문의 <a href="#">080-012-0123</a> FAX 01-2345-6789 |
						이메일 <a href="#">service@rice.co.kr</a> | 호스팅서비스사업자 (유)라이스코리아
					</span>
				</div>
				<div id="rfooter">
					<div>
						현금 등으로 결제 시 안전 거래를 위해 나이키 쇼핑몰에서 가입하신 한국결제네트웍스 유한회사의 구매안전 서비스(<a href="#">결제대금예치</a>)를 이용하실 수 있습니다.<p>
					</div>
					<div>
						콘텐츠산업진흥법에 의한 콘텐츠 보호 안내 <a href="#">자세히 보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</footer>
</body>
</html>