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
  	<img src = "../resources/img/logo.png" style = "float: left; margin-left : 280px;" width = "50px"> <br>
      <form method="post" action="login_ok">
       
        <h2> 계속 진행하시려면 아래 권한에 동의해 주세요.</h2> <p>
        * 필수 항목 <p>
        
        라이스에 오신것을 환영합니다! 법률 약관이 업데이트되었습니다. 진행하시기 전에 <p>
        내용을 검토하고 동의해 주세요. <p>
        
        <input type = "checkbox"> 모든 약관에 동의합니다 <p>
        
  		<input type = "checkbox"> <a href = "" >이용약관</a>에 동의합니다. * <p>
  		<input type = "checkbox"> <a href = "">개인정보 수집 및 이용</a>에 동의합니다 * <p>
  		<input type = "checkbox"> <a href = "">개인 정보의 제3자 제공 및 국외 이전</a>에 동의합니다 * <p>
        
        이 약관에 동의하지 않을 수 있지만, 그럴 경우 라이스 계정에 로그인할 수 없으며 새로운 계정을 생성할 수도 없습니다.
        <div> <input type="submit" value="취소" onclick = "javascript: form.action='login" style = "background :white; color :black;"> 
        	<input type="submit" value="계속" onclick = "javascript: form.action='after'"> </div>
      </form>
   
   </section>
</body>
</html>