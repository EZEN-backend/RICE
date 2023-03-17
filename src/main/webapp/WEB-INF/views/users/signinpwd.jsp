<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
	 .fullbody {
		 place-items: center;
		 display:grid;
		 grid-template-columns: 1fr 1fr 1fr;
	 }
	 .mainbody {
		 width:435px;
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
   
	 .mainbody input[type=submit] {
      width:80px;
      height:45px;
      border:1px solid black; 
      background:black;
      color:white;
      border-radius : 30px;
	  float:right;
   }
 	  .mainbody input[type=password] {
      width:100%;
      height:35px;
      border:1px solid black; 
      border-radius : 7px;
   }
 </style>
</head>
<body>
	<div class="fullbody">
		<div></div>
		<div class="mainbody">
			<div class="mainlogo" style="margin-top:20px;">
				<a href = "/"> <img src="../resources/img/rice.png" width = "70px"> </a><br>
			</div>
			<div>
				<form method="post" action="signinok">

				<%
				String email = request.getParameter("email");
				%>

				<h2> 비밀번호를 입력하세요. </h2> <p>
					<input type = "hidden" name = "email" value = <%=email %>>
				<div> <%=email%>  <a href="/users/signin" style=""> 편집 </a> </div> <p>
				<input type = "password" name = "pwd" placeholder = "비밀번호">

				<div> <input type="submit" value="로그인"> </div>
				</form>
			</div>
		</div>
		<div></div>
	</div>
</body>
</html>