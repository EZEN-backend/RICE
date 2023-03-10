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
		@font-face {
			font-family: 'PuradakGentleGothicR';
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.1/PuradakGentleGothicR.woff2') format('woff2');
			font-weight: lighter;
			font-style: normal;
		}
		body {
			width:100%;
			margin:0px;
			z-index:1;
			position:relative;
			font-family: 'PuradakGentleGothicR';
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.1/PuradakGentleGothicR.woff2') format('woff2');
			font-weight: normal;
			font-style: normal;
			font-size:14px;
		
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
    		padding-top:17px;
    		vertical-align: top;
    		cursor:pointer;
		}
		.pre-desktop-menu li {
			width: 200px;
			height: 30px;
		}
		.cate-container {
			width: 100%;
			margin: 0 auto;
			height: 330px;
			text-align: center;
			display:none;
			position:absolute;
			z-index:98;
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
		#topmsg {
			width:100%;
			height:40px;
			background:#F0F0F0;
			display:flex;
		}
		#topmsg #right {
			margin-top:0px;
			width:400px;
			text-align:right;
			padding-top:12px;
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
			height:25px;
		}
		#cate > li {
			font-weight:500;
			font-size:16px;
		}
		#cate > li > ul > li > a {
			text-decoration-line: none;
			color:#757575;
			font-size:16px;
		}
		#cate > li > ul > li > a:hover {
			color:#111111;
			cursor:pointer;
		}
		body #mymenu #mysub {
			width:105px;
			height:110px;
			padding-left:0px;
			position:absolute;
			margin-top:5px;
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

		/* ???????????? ?????? ?????? ????????? ?????? */
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
	
	// ?????? ?????? ???????????? ??????
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
	   
		// ???????????? ???????????? ?????? modal slideDown
		// ?????? ????????? ?????? , ???????????? ????????? ????????? backdrop-filter ???????????? blur
		
		$(document).ready(function() {
		  $('#vsearch').click(function() {
		    $('#search_form').slideDown(200);
		    $("#modal").fadeIn();
		  });
		  
		  $("#csearch").click(function(){
		        $("#search_form").slideUp(100);
		        $("#modal").fadeOut();
		    });
		  
		  // outside ?????? ????????? ??????
		  $(document).mouseup(function(e) {
		    var container = $('#search_form');
		    var modal = $('#modal');
		    if (!container.is(e.target) && container.has(e.target).length == 0) {
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
		
		// main ?????? ????????? ????????? ???????????? ??????
		function gcart()
		{
			location.href="/cart";
		}
		// main ?????? ????????? ????????? ???????????? ??????
		function gwish()
		{
			location.href="/wish";
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
				<input type="button" value="??????" id="csearch" style="cursor:pointer">
				<div>
				<span>????????????</span><p>
				???????????????1<p>
				???????????????2<p>
				???????????????3<p>
				???????????????4
				</div>
			</form>
		</div>
		<div id="right">
			<c:if test="${useremail == null and naveremail == null}">
			<a href="/users/signin">  ????????????  </a> | 
			<a href="/users/signup">  ????????????  </a> |
			<a href ="/users/signin"> ???????????? </a> |
			<a href = "/users/signin"> ????????? </a> 
			</c:if>
			<c:if test="${useremail != null or naveremail != null }">
				<c:if test = "${useremail != null }">
				${username}???, ??????????????? |  ???????????? |
				</c:if>
					<c:if test = "${naveremail != null }">
					${navername}???, ??????????????? |  ???????????? |
					</c:if>
	
					<span id="mymenu"> <a href="#" onmouseover="javascript:view_sub()" onmouseout="javascript:out_sub()">MyPage</a> 
						<ul id="mysub" onmouseover="javascript:view_sub()" onmouseout="javascript:out_sub()">
							<li> <a href="/users/userview">????????????</a> </li>
							<li> ???????????? </li>		
							<li> ??? ??? ??? </li>				
							<li> ???????????? </li>		
							<li> <a href= "users/signout">????????????</a> </li>		
						</ul>
					</span>
					</c:if>
					</div>
			</div>
		</div>
	</div> <!-- ????????? ????????? -->
	<header>
		<div id="second">
			<div id="left"><a href="/"><img src="/resources/img/rice.png" width="70" height="50"></a> </div>
			<div class="top-menu">
				<ul class="pre-desktop-menu">
					<li class="subcate"> ??? ??? </li>
					<li class="subcate"> ??? ??? </li>
					<li class="subcate"> ??? ??? </li>
					<li class="subcate"> ??? ??? </li>
				</ul>
			</div>
			<!-- ??????????????? -->
			<div class="header-icons">
				<i class="fa-solid fa-magnifying-glass" id="vsearch" style="cursor:pointer"></i>
				<i class="fa-regular fa-heart" id="wish_view" onclick="gwish()" style="cursor:pointer"></i>
				<i class="fa-solid fa-cart-shopping" id="cart_view" onclick="gcart()" style="cursor:pointer; ">
			   		<span id="cart_amount">0</span>
				</i>
			</div>	
		</div>
	</header> <!-- ?????????,????????????,?????? -->
	<div class="cate-container">
		<ul>
			<li class="subcate-container">
				<a href="/products/1/1">???/???</a><p>
				<a href="/products/1/2">??????</a><p>
				<a href="/products/1/3">?????????</a><p>
				<a href="/products/1/4">??????</a><p>
				<a href="/products/1/5">??????/??????</a>
			</li>
			<li class="subcate-container">
				<a href="/products/2/1">?????????</a><p>
				<a href="/products/2/2">??????</a><p>
				<a href="/products/2/3">??????</a><p>
				<a href="/products/2/4">??????</a>
			</li>
			<li class="subcate-container">
				<a href="/products/3/1">?????????</a></p>
				<a href="/products/3/2">??????</a></p>
				<a href="/products/3/3">??????</a></p>
				<a href="/products/3/4">?????????</a>
			</li>
			<li class="subcate-container">
				<a href="/products/4/1">?????????</a></p>
				<a href="/products/4/2">??????</a></p>
				<a href="/products/4/3">??????</a></p>
				<a href="/products/4/4">?????????</a>
			</li>
		</ul>
	</div><!-- menu ?????? -->
<decorator:body/>	
	<footer><!-- ??????????????? ?????? -->
	<div id="container">
		<div id="footerbody">
			<div id="hf-group">
				<div>
					<ul>
						<li id="hli"> ??????????????? </li>
						<li id="hli"> ???????????? </li>
						<li id="hli"> ???????????? ???????????? </li>
						<li id="hli"> ???????????? ?????? </li>
					</ul>
				</div>
				<div>
					<ul>
						<li id="hli"> ???????????????????? </li>
						<li id="sli"> ?????? ?????? </li>
						<li id="sli"> ?????? ?????? </li>
						<li id="sli"> ?????? ?????? </li>
						<li id="sli"> ?????? ??????  </li>
					</ul>
				</div>
				<div>
					<ul>
						<li id="hli"> ABOUT RICE </li>
						<li id="sli"> ?????? </li>
						<li id="sli"> ?????? </li>
						<li id="sli"> ??????????????? ?????? </li>
					</ul>
				</div>
			</div>
			<div id="social">
				<ul>
					<li>
						?????? ?????? ?????? ????????? ?????????
					</li>
				</ul>
			</div>
			<div id="subfooter">
				?? 2023 Rice, Inc. All Rights Reserved
			</div>
			<div id="lastfoot">
				<div id="lfooter">
					<span id="info">
						(???)?????????????????? ?????? k1lee , ????????? ??? ??? ????????? |
						?????? ????????? ???????????? 321 ???????????????????????? 92??? | ??????????????????????????? 2011-????????????-02345 |
						???????????? 111-12-20391 <a href="#">????????? ?????? ??????</a>
					</span>
					<p>
					<span id="service">
						???????????? ?????? ?????? <a href="#">080-012-0123</a> FAX 01-2345-6789 |
						????????? <a href="#">service@rice.co.kr</a> | ??????????????????????????? (???)??????????????????
					</span>
				</div>
				<div id="rfooter">
					<div>
						?????? ????????? ?????? ??? ?????? ????????? ?????? ????????? ??????????????? ???????????? ???????????????????????? ??????????????? ???????????? ?????????(<a href="#">??????????????????</a>)??? ???????????? ??? ????????????.<p>
					</div>
					<div>
						??????????????????????????? ?????? ????????? ?????? ?????? <a href="#">????????? ??????</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</footer>
</body>
</html>