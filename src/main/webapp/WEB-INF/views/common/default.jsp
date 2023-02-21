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
		body {
			margin:0px;
			z-index:1;
			position:relative;

		}
		#first {
			width:1920px;
			height:40px;
		}
		
		/* 카테고리 관련 스타일 */
		ul li {list-style:none; cursor:pointer;}
		
		nav > ul > li {
			top:-15px;
			padding-left:55px;
		}
		
		
		nav {width:100%;height:40px; margin:0 auto;}
		nav > ul > li { position:relative; left:500px; float:left; line-height:50px; margin-right:100px; text-align:center;}
		nav > ul > li ul{ width:100%;}
		nav > ul > li ul li {position:relative; right:39px; top:11px;}
		
		/* main cart,heart 아이콘 스타일 */
		#cart_view {
			position:absolute;
			right:200px;
		}
		#wish_view {
			position:absolute;
			right:150px;
		}
		
		/* 검색바 관련 스타일 */
		#vsearch {
			position:absolute;
			right:250px;
		}
		
		#csearch {
			width:40px;
			height:30px;
			background:-60px 0;
			float:right;
			margin-top:5px;
		}
		#search_form {
			position:absolute;
			left:0;
			right:0;
			height:400px;
			text-align:center;
			background:white;
			transition:0.5;
			display:none;
			z-index:2;
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
		#topmsg {
			width:100%;
			height:40px;
			background:#F0F0F0;
			display:flex;
		}
		#topmsg #right {
			margin-top:0px;
			width:200px;
			text-align:right;
			padding-top:12px;
			margin-right:50px;
			font-size:14px;
		}
		#topmsg #right > a {
			width:100px;
		}
		header {
			width:1920px;
			margin-top:0px;
			background:white;
			height:50px;
			
		}
		header #second {
			width:1920px;
			margin-top:0px;
			background:white;
			height:50px;
			overflow:hidden;
			position:absolute;
			z-index:1;
		}
		header #left {
			position:absolute;
			left:30px;
		}
		
		body #mymenu {
			position:relative;
			display:inline-block;
			height:25px;
		}
		
		body #mymenu #mysub {
			width:105px;
			height:90px;
			padding-left:0px;
			position:absolute;
			margin-top:5px;
			right:0px;
			top:10px;
			padding:4px;
			z-index:1;
			background:white;
			visibility:hidden;
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
		
		
		footer {
			width:1920px;
			height:443px;
			margin:auto;
			background:black;
		}
		#subfooter {
			width:1372px;
			height:60px;
			position:relative;
			padding:5px;
			color:#C0C0C0;
			margin:0px -6px;
			border-bottom:1px solid white;
		}
		#lastfoot {
			width:1360px;
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
			padding:40px 40px 0;
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
			width:1920px;
			height:40px;
			align:center;
		}
		#search_form i{
			position:absolute;
			padding-top:15px;
			padding-left:10px;
		}
		
	</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
	   $(function(){
		   var $cate = $('nav >ul > li'),
		   		$second = $('#second');
		   
		   $cate.mouseenter(function(){
			   $second.stop().animate({height:'300px'});
		   })
		   .mouseleave(function(){
			   $second.stop().animate({height:'50px'});
		   });
	   });
		    
		
		// 검색바 slide
		$(document).ready(function() {
		  // 클릭 이벤트 등록
		  $('#vsearch').click(function() {
		    $('#search_form').slideDown(200);
		  });
		  
		  // outside 클릭 이벤트 등록
		  $(document).mouseup(function(e) {
		    var container = $('#search_form');
		    if (!container.is(e.target) && container.has(e.target).length == 0) {
		      container.slideUp(200);
		    }
		  });
		});
		
		// 취소 버튼 클릭시 slideUp
		$(function()
		{
			$("#csearch").click(function()
			{
				$("#search_form").stop().slideUp(200);
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
			location.href="cart_view";
		}
		// main 하트 아이콘 클릭시 이동하는 경로
		function gwish()
		{
			location.href="wish_view";
		}
	</script>
	
</head>
	<decorator:head/>
<body>
<div id="first">
	<div id="topmsg">
		<div id="hfirst">
			<form id="search_form" name="search_form" method="get" action="search_list">
				<input type="text" name="search">
				<i class="fa-solid fa-magnifying-glass" onclick="gsearch()"></i>
				<input type="button" value="취소" id="csearch" style="cursor:pointer">
				<div>
				<span>인기상품</span><p>
				잘팔린상품1<p>
				잘팔린상품2<p>
				잘팔린상품3<p>
				잘팔린상품4
				</div>
			</form>
		</div>
		<div id="right">
			<c:if test="${userid == null }">
			<a href="../login/login">  로그인  </a> | 
			<a href="../member/member_input">  회원가입  </a> 
			</c:if>
			<c:if test="${userid != null }">
				${name}~님, 안녕하세요
				|  고객센터
				<span id="mymenu">|  <a href="#" onmouseover="javascript:view_sub()" onmouseout="javascript:out_sub()">MyPage</a> 
					<ul id="mysub" onmouseover="javascript:view_sub()" onmouseout="javascript:out_sub()">
						<li> <a href="../member/member_view">회원정보</a> </li>
						<li> 주문목록 </li>		
						<li> 적 립 금 </li>				
						<li> 장바구니 </li>		
						<li> <a href="../login/logout">로그아웃</a> </li>		
					</ul>
				</span>
				</c:if>
		</div>
	</div>
</div> <!-- 광고성 메세지 -->
	<header>
	<div id="second">
		<div id="left"> <a href=""><img src="../resources/img/rice.png" width="70" height="50"></a> </div>
			<nav>
				<ul id="cate">
					<li> 한 식
						<ul>
							<li> 찜/탕 </li>
							<li> 볶음류 </li>
							<li> 구이 </li>
							<li> 반찬 </li>
							<li> 치킨 </li>
							<li> 기타/분식 </li>
						</ul>
					 </li>
					<li> 일 식 
						<ul>
							<li> 튀김류 </li>
							<li> 면류 </li>
							<li> 스시 </li>
							<li> 덮밥 </li>
						</ul>
					</li>
					<li> 중 식
						<ul>
							<li> 튀김류 </li>
							<li> 면류 </li>
							<li> 밥류 </li>
							<li> 만두류 </li>
						</ul>
					</li>
					<li> 양 식
						<ul>
							<li> 파스타 </li>
							<li> 육류 </li>
							<li> 피자 </li>
							<li> 샐러드 </li>
						</ul>
					</li>
				</ul>
				<!-- 검색돋보기 -->
				<i class="fa-solid fa-magnifying-glass" id="vsearch" style="cursor:pointer"></i>
				<i class="fa-solid fa-cart-shopping" id="cart_view" onclick="gcart()" style="cursor:pointer"></i>
				<i class="fa-regular fa-heart" id="wish_view" onclick="gwish()" style="cursor:pointer"></i>
			</nav>
		</div> <!-- menu 관련 -->
	</header> <!-- 로그인,회원가입,로고 -->

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