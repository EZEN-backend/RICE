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
      width:330px;
      height:35px;
      border:1px solid black; 
      border-radius : 7px 7px 7px 7px / 7px 7px 7px 7px
   }

   section input[type=submit] {
      width:80px;
      height:45px;
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
   
   <c:choose>
		<c:when test="${sessionId != null}">
			<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
			<h3>'${sessionId}' 님 환영합니다! </h3>
            	<h3><a href="logout">로그아웃</a></h3>
 
		</c:when>
		<c:otherwise>
  	<img src="../resources/img/rice.png" style = "float: left; margin-left : 280px;" width = "50px"> <br> <br>
      <form method="post" action="login_ok">
       
        <h2> 가입 또는 로그인을 위해 이메일을 입력하세요. </h2> <p>
        <div id = "country"> 대한민국 <a href = "country"> 변경 </a> </div>
        
        <div> <input type="text" name="userid" placeholder="이메일"> </div> <p>
        
        <div id = "agree"> 계속 진행하면 라이스의 <a href = "agree"> 개인 정보 처리 방침 </a> 및 <a href = "rule"> 이용약관 </a>에 <p>
        동의하게 됩니다. </p> </div>
        
        <div> <input type="submit" value="계속"> </div>
			
      </form>
      
      <!-- 네이버 로그인 창으로 이동 -->
		<div id="naver_id_login" style="text-align:center; float :left; margin-left : 350px;"><a href="${url}">
		<img src="../resources/img/navericon.png" width = "50px;"></a></div>
		<br>
   </c:otherwise>
   </c:choose>
   </section>
</body>
</html>