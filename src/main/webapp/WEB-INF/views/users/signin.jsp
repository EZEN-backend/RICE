<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   section {
      width:1000px;
      height:600px;
      margin:auto;
      margin-top : 50px;
      text-align:center;
   }
   section div {
   	text-color : red;
     margin-top:12px;
   }
   
   #country, #agree {
	 color : #A5A5A5;
   }
   
   a {
  	color : #A5A5A5;
   }
   
  input::placeholder {
	text-align : left;
  }
   
  section input[type=text] {
      width:270px;
      height:35px;
      border:1px solid black; 
      border-radius : 7px 7px 7px 7px / 7px 7px 7px 7px
   }

   section input[type=submit] {
      width:100px;
      height:55px;
      border:1px solid black; 
      background:black;
      color:white;
      border-radius : 30px 30px 30px 30px / 30px 30px 30px 30px;
      margin-left : 300px;
   }
 
  </style> 

</head>
<body> 

   <section>

   	  <a href = "/"> <img src="../resources/img/rice.png" style = "float: left; margin-left : 280px;" width = "70px"> </a> <br> <br> <br> <p>
      <form method="post" action="signup">
       
        <h2> 가입 또는 로그인을 위해 이메일을 입력하세요. </h2> <p>
        <div id = "country"> 대한민국 </div>
        
        <div> <input type="text" name="email" placeholder="이메일"> 
        	  <input type = "hidden" name = "naveremail" value = "null">
        </div> <p>
        
        
        <div id = "agree"> 계속 진행하면 라이스의  개인 정보 처리 방침 및 이용약관에 <p>
        동의하게 됩니다. </p> </div>
        
        <div> <input type="submit" value="계속"> </div>
			
      </form>
      
      <!-- 네이버 로그인 창으로 이동 -->
		<div id="naver_id_login" style="text-align:center; float :left; margin-left : 350px;"><a href="${url}">
		<img src="../resources/img/naverlogin.png" width = "50px;"> </a></div>
		<br>
 
   </section>
</body>
</html>