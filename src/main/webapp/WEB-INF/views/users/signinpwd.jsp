<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		<img src="../resources/img/rice.png" style = "float: left; margin-left : 280px;" width = "50px"> <br> <br>
		 <form method="post" action="signinok">
		 
		   <%
      		String email = request.getParameter("email");
      		%>
       
    		비밀번호를 입력하세요.
    			 <input type = "hidden" name = "email" value = <%=email %>>
       			 <div> <%=email%> </div>
       			 <input type = "password" name = "pwd" placeholder = "비밀번호">
        
        <div> <input type="submit" value="계속"> </div>
			
      </form>
	</section>
</body>
</html>