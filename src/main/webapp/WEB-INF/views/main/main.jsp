<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
 <script>
	 $(function()
	   {
	       move();
	       
		   $("#mimage").mouseover(function()
		   {
			   clearInterval(ss);
		   });
		   $("#mimage").mouseout(function()
		   {
	           move();
		   });
	   });
	   function move()
	   {
		   ss=setInterval(function()
		   {
			   $("#msub").animate(
			   {
				   marginLeft:"-1920px"
			   },2000,function()
			          {
				           $("#msub > img").eq(0).insertAfter( $("#msub > img").eq(3) );
				           $("#msub").css("margin-left","0px");
			          });
		   },4000);
	   }
 </script>
	<style>
		section {
			width:1920px;
			height:1000px;
			margin:auto;
		}
		#mimage {
	     width:1820px;
	     height:1000px;
	     overflow:hidden;
	     margin:auto;
	   }
	   #msub {
	     width:7000px;
	     height:1000px;
	     margin-left:0px;
	     padding-top:-10px;
	   }
	   #third {
	   	width:1920px;
	   	height:50px;
	   	text-align:center;
	   	padding-top:60px;
	   	padding-bottom:0px;
	   	background:#F0F0F0;
	   	border-bottom:1px solid #E0F0F0;
	   }
	   #fourth {
	    width:1920px;
	    height:300px;
	   	text-align:center;
	   	margin:auto;
	   	position:relative;
	   	margin-top:50px;
	   }
	   #fourth #text > #conta {
	    width:100%;
		margin:auto;
	   }
	   #fourth > #conta > span {
	   	width:120px;
	   	height:35px;
	   	display:inline-block;
	   	font-size:16px;
	   	border:1px solid black;
	   	border-radius:25px;
	   	background:black;
	   	color:white;
	   	line-height:40px;
	   	cursor:pointer;
	   }
	</style>
</head>
<body>
	<div id="third"> 
	반품 및 환불 지연 안내<p>
	<a href="" style="font-size:13px">자세히 보기</a>
	</div>
	<div id="mimage">
		<div id="msub">
			<img src="../resources/img/gook.jpeg" width="1920" height="1000">
			<img src="../resources/img/bab.jpeg" width="1920" height="1000">
			<img src="../resources/img/gogi.jpeg" width="1920" height="1000">
			<img src="../resources/img/dduk.jpeg" width="1920" height="1000">
		</div>
	</div> <!-- 슬라이드 되는 큰 그림 -->
	<section>
		<div id="fourth">
			<div id="text">
			<b style="font-size:40px">A FEEL FOR EVERY YOU</b><p>
			몸과 마음이 좋아하는 나만의 다양한 움직임을 시작해보세요.<br>
			머리부터 발끝까지 모든 감각들을 깨워, 기분 좋은 하루를 보낼 수 있는 에너지를 만들 수 있어요.<br>
			지금 나를 위한 모든 가능성을 느껴보세요.<p>
			</div>
			<div id="conta">
			<span> 자세히 보기 </span> &nbsp; &nbsp;  <span> 구매하기 </span>
			</div>
		</div>
	</section> <!-- 본문 -->
	
</body>
</html>