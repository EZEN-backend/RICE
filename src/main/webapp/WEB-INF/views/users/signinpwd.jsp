<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
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
   

   section input[type=submit] {
      width:80px;
      height:45px;
      border:1px solid black; 
      background:black;
      color:white;
      border-radius : 30px 30px 30px 30px / 30px 30px 30px 30px;
      margin-left : 300px;
   }
 	  section input[type=password] {
      width:270px;
      height:35px;
      border:1px solid black; 
      border-radius : 7px 7px 7px 7px / 7px 7px 7px 7px
   }
 </style>
</head>
<body>
	<section>
		<img src="../resources/img/rice.png" style = "float: left; margin-left : 280px;" width = "50px"> <br> <br> <br> <p>
		 <form method="post" action="signinok">
		 
		   <%
      		String email = request.getParameter("email");
      		%>
       
    			 <h2> 비밀번호를 입력하세요. </h2> <p>
    			 <input type = "hidden" name = "email" value = <%=email %>>
       			 <div> <%=email%> </div> <p>
       			 <input type = "password" name = "pwd" placeholder = "비밀번호">
        
        <div> <input type="submit" value="계속"> </div>
			
      </form>
	</section>
</body>
</html>