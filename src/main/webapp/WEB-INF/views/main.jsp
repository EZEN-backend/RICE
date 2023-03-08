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
				           $("#msub > img").eq(0).insertAfter( $("#msub > img").eq(7) );
				           $("#msub").css("margin-left","0px");
			          });
		   },4000);
	   }
 </script>
	<style>
		section {
			width:100%;
			margin:auto;
		}
		#mimage {
	     width:100%;
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
	   
	   #mimage2 {
	     width:1920px;
	     height:1000px;
	     overflow:hidden;
	     margin:auto;
	     padding-top:70px;
	   }
	   #msub2 {
	     width:100%;
	     height:1000px;
	     margin-left:0px;
	     padding-top:-10px;
	   }
	   
	   #mimage3 {
	     width:1920px;
	     height:1000px;
	     overflow:hidden;
	     margin:auto;
	     padding-top:70px;
	   }
	   #msub3 {
	     width:100%;
	     height:1000px;
	     margin-left:0px;
	     padding-top:-10px;
	   }
	   
	   #third {
	    margin:auto;
	   	width:100%;
	   	height:50px;
	   	text-align:center;
	   	padding-top:7px;
	   	background:#F0F0F0;
	   	border-bottom:1px solid #E0F0F0;
	   }
	   #third a {
	   	text-decoration:none;
	   	color:black;
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
	   #fourth > #conta2 > span {
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
	   
	   section > .slider {
	   	width:100%;
	   	height:978.78px;
	   	display:grid;
	   	grid-template-columns: 1fr 1fr 1fr;
	   }
	   .slider_item a {
	   		text-decoration:none;
	   		color:black;
	   }
	   
		.sushi_container {
			display:flex;
			overflow-x:scroll;
			width:1920px;
			height:800px;
			padding-left:6px;
			margin-left:-6px;
			white-space:nowrap;
		}
		
		.sushi_container a {
			width:600px;
			height:665px;
			margin:10px;
			text-decoration:none;
			color:black;
			margin-left:18px;
			margin-right:22px;
		}
		.sushi_container a img {
			width:600px;
			height:600px;
			margin:10px;
		}
		.sushi_container #items-info {
			margin:12px 16px 0px 0px;
			padding-left:10px;
			margin:5px;
		}
		
		.youtube-video {
			width:100%;
		}
		.video-content {
			text-align:center;
			font-size:40px;
			font-weight:900;
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
			<img src="/resources/img/googi.jpeg" width="1920" height="1000">
			<img src="/resources/img/dduk2.jpeg" width="1920" height="1000">
			<img src="/resources/img/nangmyun.jpeg" width="1920" height="1000">
			<img src="/resources/img/woodong.jpeg" width="1920" height="1000">
			<img src="/resources/img/odang.jpeg" width="1920" height="1000">
			<img src="/resources/img/bossam.jpeg" width="1920" height="1000">
			<img src="/resources/img/cheesedon.jpeg" width="1920" height="1000">
			<img src="/resources/img/sushi3.jpeg" width="1920" height="1000">
		</div>
	</div> <!-- 슬라이드 되는 큰 그림 -->
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
	<div id="mimage3">
		<div id="msub3">
			<img src="/resources/img/children.jpeg" width="100%">
		</div>
	</div>
	
	<div id="fourth">
		<div id="text">
			<b style="font-size:40px"> 새로운 학기의 시작 </b><p>
			새로사귄 친구들과 집에 놀러오는 아이들의 부모들을 위한 상품.<br>
			아이들이 친구를 집에 자주 데려오는데 간식을 뭘 좋아하는지 모르겠다면<br>
			RICE 떡볶이<p>
		</div>
		<div id="conta2">
			<span> 떡볶이 구매하기 </span>
		</div>
	</div>
	
	<div class="youtube-video">
		<iframe width="100%" height="800" src="https://www.youtube.com/embed/QNipXG5LPik?autoplay=1&mute=1" title="YouTube video player" frameborder="0" 
		allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
		<div>
			<div class="video-content"> 집에서도 간편하게</div><p>
			<div style="text-align:center"> 딱봐도 맛있어 보이는 떡볶이<br>빨갛게 아주 이쁘게 나왔죠 ?</div>
		</div>
	</div>
	
	<section>
		<div class="slider">
			<div class="slider_item"> <a href="#" aria-label="떡볶이: 온 가족이 즐길수 있는 떡볶이를 먹어보실랍니까?" width="598.62" height="932.78">
			<img src="/resources/img/dduckbok2.png" width="100%" height="932.78"><br>
			떡볶이 <br> 온 가족이 즐길수 있는 떡볶이를 먹어보실랍니까? </a> 
			</div>
			
			<div class="slider_item"> <a href="#" aria-label="국밥: 국물이 시원한 할매손 국밥을 드셔보세요" width="598.62" height="932.78">
			<img src="/resources/img/gookbab.png" width="100%" height="932.78"><br>
			국밥 <br> 국물이 뜨끈하고 시원한 할매손 국밥을 드셔보세요! </a> 
			</div>
			
			<div class="slider_item"> <a href="#" aria-label="족발: 320시간 끓인 육수로 만든 족발을 드셔보십쇼" width="598.62" height="932.78">
			<img src="/resources/img/jokbal.png" width="100%" height="932.78"><br>
			족발 <br> 320시간 끓인 육수로 만든 족발을 드셔보십쇼! </a> 
			</div>
		</div>
	<div id="mimage2">
		<div id="msub2">
			<img src="/resources/img/mara.jpeg" width="100%">
		</div>
	</div>
		
	<div id="fourth">
		<div id="text">
			<b style="font-size:40px"> 끊임 없는 음식에 대한 연구 </b><p>
			몸과 마음이 좋아하는 나만의 다양한 요리를 시작해보세요.<br>
			머리부터 발끝까지 모든 감각들을 깨워, 기분 좋은 하루를 보낼 수 있는 칼로리를 만들 수 있어요.<br>
			지금 혀의 미각을 깨워보세요.<p>
		</div>
		<div id="conta">
			<span> 자세히 보기 </span> &nbsp; &nbsp;  <span> 구매하기 </span>
		</div>
	</div>
	
	
	
	<div>
	<div style="font-size:26px; margin-left:35px;"> Japanese food pick </div>
		<div class="sushi_container">
		  <a href=""> <img src="/resources/img/sushi1.jpeg"> <div id="items-info"> 눈치없이 이쁜 <span style="float:right"> 13,000원 </span> <br> 연어 초밥 </div> </a>
		  <a href=""> <img src="/resources/img/sushi2.jpeg"> <div id="items-info"> 한상가득 대식 <span style="float:right"> 13,000원 </span> <br> 모듬 초밥 </div> </a>
		  <a href=""> <img src="/resources/img/sushi3.jpeg"> <div id="items-info"> 불에 살짝 데운 <span style="float:right"> 13,000원 </span> <br> 생선 초밥 </div> </a>
		  <a href=""> <img src="/resources/img/fried-food1.jpeg"> <div id="items-info"> 가벼운 맥주와 함께 <span style="float:right"> 13,000원 </span> <br> 모듬 튀김 </div> </a>
		  <a href=""> <img src="/resources/img/fried-food2.jpeg"> <div id="items-info"> 황금 빛깔 그녀석 <span style="float:right"> 13,000원 </span> <br> 새우 튀김 </div> </a>
		 <a href="">  <img src="/resources/img/fried-food3.jpeg"> <div id="items-info"> 맛과 모양까지 다 갖춘 <span style="float:right"> 13,000원 </span> <br> 한입 모듬 튀김 </div> </a>
		</div>
	</div>
	
	</section> <!-- 본문 -->
	
</body>
</html>