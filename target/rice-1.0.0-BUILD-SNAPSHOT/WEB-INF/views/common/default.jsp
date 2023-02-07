<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://kit.fontawesome.com/804c868edf.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
	<style>
		body {
			margin:0px;
		}
		#topmsg {
			width:100%;
			height:40px;
			background:#EFEFEF;
		}
		
		#topmsg #right {
			position:relative;
			top:-32px;
			text-align:right;
			padding-top:6px;
			margin-right:50px;
			
		}
		
		header {
			width:1400px;
			height:50px;
			margin:auto;
			font-size:14px;
			position:relative;
		}
		body #left {
			float:left;
			margin-top:-10px;
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
		
		nav {
			width:100%;
			height:40px;
			margin:auto;
			text-align:center;
		}
		
		footer {
			width:1000px;
			height:100px;
			margin:auto;
		}
		.search-bar {
		  position:relative;
		  left:590px;
		  width: 500px;
		  height: 35px;
		  border-radius: 15px;
		  border: solid 1px rgba(0, 0, 0, 0.3);
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  z-index: 1;
		  opacity: 1;
		  margin-top:3px;
		  background:#EFEFEF;
		}
		
		.search-bar__input {
		  text-align:center;
		  width: 500px;
		  border: none;
		  -webkit-appearance: none;
		  text-align: center;
		  margin-left: 10px;
		  overflow: auto;
		  z-index: 1;
		  background:#EFEFEF;
		}
		
		.search-bar__input:focus {
		  text-align:center;
		  outline: none;
		  width: 500px;
		  text-align: left;
		  background:#EFEFEF;
		}
		
		header ul {
			display:flex;
			list-style:none;
		}
		header li {
			flex:1;
			height:100px;
		}
		header a {
			display:block;
			text-decoration:none;
			font-size:14px;
			color:black;
			margin-top:5px;
		}
		header a+nav {
			display:none;
		}
		
	</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		    $(document).ready(function(){
		    	$("header li").hover(
		    		function()
		    		{
		    			$(this).children("nav").stop().slideDown("fast");
		    			$(this).siblings().children("nav").stop().slideUp("fast");
		    		},
		    		function()
		    		{
		    			$(this).children("nav").stop().slideUp("fast");
		    		}
		    	);
		    });
		    
		   function view_sub()
		   {
			   document.getElementById("mysub").style.visibility="visible";
		   }
		   function out_sub()
		   {
			   document.getElementById("mysub").style.visibility="hidden";
		   }
	</script>
	
</head>
	<decorator:head/>
<body>
	<div id="topmsg">
			<div class="search-bar">
				<i class="fa-duotone fa-magnifying-glass"></i>
				<input class="search-bar__input" type="search" placeholder="검색"/>
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
	</div> <!-- 광고성 메세지 -->
	<header>
		<div id="left"> <a href=""><img src="../resources/img/rice.png" width="70" height="50"></a> </div>
			<nav>
				<ul>
					<li>
						<a href="#"> 한 식 </a>
						<nav>
							<a href="#"> 닭 음식 </a>
							<a href="#"> 소 음식</a>
							<a href="#"> 돼지 음식 </a>
						</nav>
					</li>
					<li>
						<a href="#"> 중 식 </a>
						<nav>
							<a href="#"> 짜장 </a>
							<a href="#"> 잠봉 </a>
							<a href="#"> 탕수육 </a>
						</nav>
					</li>
					<li>
						<a href="#"> 양 식 </a>
						<nav>
							<a href="#"> 스테끼 </a>
							<a href="#"> 파스타 </a>
							<a href="#"> 스프 </a>
						</nav>
						
					</li>
				</ul>
			</nav> <!-- menu 관련 -->
	</header> <!-- 로그인,회원가입,로고 -->

	<decorator:body/>
	
	
	<footer> <img src="../resources/img/footer.png" width="1000"></footer> <!-- 사이트관련 내용 -->
</body>
</html>