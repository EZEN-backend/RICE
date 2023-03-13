<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   .fullbody {
   	 display:grid;
   	 grid-template-columns: 1fr 1fr 1fr;
   }
   .mainbody {
     width:435px;
   }
   
   #country, #agree {
	 color : #A5A5A5;
   }
   #agree > a {
     color:#A5A5A5;
   }
   
  input::placeholder {
	text-align : left;
  }
   .mainbody input[type=text] {
      width:435px;
      height:40px;
      border:1px solid black; 
      border-radius : 7px;	
   }
   .mainbody input[type=submit] {
      width:100px;
      height:55px;
      border:1px solid black; 
      background:black;
      color:white;
      border-radius : 30px;
   }

   
 
  </style> 
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

	// 이메일의 value률 참조하여 submit이 작동하거나,안하거나 
	$(document).ready(function(){
		$('form').submit(function(event){
			var email = $('.email').val();
			
			 // 조건은 이메일의 value의 길이가 8보다 작으면, 이메일의 value에 @가 포함되지 않으
			if(email.length < 8 || email.indexOf("@") == -1)
			{
				event.preventDefault();
				alert('이메일 형식으로 작성해주세요');
			}
		});
	});
</script>
</head>
<body> 
   <div class="fullbody">
   <div></div>
	   <div class="mainbody">
	     <div class="mainlogo" style="margin-top:20px;">
	   	   <a href = "/"> <img src="../resources/img/rice.png" width = "70px"> </a><br>
	     </div>  
	       <form method="post" action="signup">
	        <h2> 가입 또는 로그인을 위해 이메일을 입력하세요. </h2> <p>
	        <div id = "country"> 대한민국 </div>
	        <div> <input class="email" type="text" name="email" placeholder="이메일"> 
	        	  <input type = "hidden" name = "naveremail" value = "null">
	        </div>
	        <br>

	        <div id = "agree"> 계속 진행하면 라이스의  <a href="#">개인 정보 처리 방침</a> 및 <a href="#">이용약관</a>에<br>
	        동의하게 됩니다. </div>
	        <p>
	        <div style="width:440px;margin-top:30px;"> 
	        <!-- 네이버 로그인 창으로 이동 -->
	       	 <span class="naverlogo"><a href="${url}"> <img src="../resources/img/naverlogin.png" width = "50px;"> </a></span>
	       	 <input type="submit" value="계속" style="cursor:pointer;float:right;">
	        </div>
	      </form>
	      
		</div>
	<div></div>
   </div>
</body>
</html>