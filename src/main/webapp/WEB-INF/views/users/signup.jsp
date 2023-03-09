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
   
  select {
      width:330px;
      height:35px;
      border:1px solid black; 
      border-radius : 7px 7px 7px 7px / 7px 7px 7px 7px
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
   
     section input[type=password] {
      width:330px;
      height:35px;
      border:1px solid black; 
      border-radius : 7px 7px 7px 7px / 7px 7px 7px 7px
   }
   
   	 section input[type=date] {
      width:330px;
      height:35px;
      border:1px solid black; 
      border-radius : 7px 7px 7px 7px / 7px 7px 7px 7px
   	}
 
  </style>
</head>
<body> 
   <section>
  	<a href = "/"> <img src = "../resources/img/rice.png" style = "float: left; margin-left : 280px;" width = "70px"> </a> <br> <br> <br> <p>
      <form method="post" action="userinputok">
       <% 
       		String email = request.getParameter("email");
  	 		session = request.getSession();
       %>
       
        <h2> 이제 라이스 멤버가 되어볼까요? </h2> <p>
        
        <input type = "hidden" name = "email" value = "<%=email%>">
        <input type = "hidden" name = "naveremail" value = "<%=session.getAttribute("naveremail") %>">

		<c:if test = "${naveremail == null }">
        <input type = "text" name = "name" placeholder = "이름" style = "width: 320px;"> <p>
       	<input type = "password" name = "pwd" placeholder = "비밀번호"> <p>
       	<input type = "date" name = "birthdate" placeholder = "생년월일"> <p>
		</c:if>
		  
       	 <c:if test = "${naveremail != null }">
        <input type = "hidden" name = "name" value = "${navername}">
        <input type = "hidden" name = "pwd" value = "null">
        <input type = "date" name = "birthdate" placeholder = "생년월일"> <p>
         </c:if>

        <input type = "checkbox"> 라이스의 <a href ="" >개인 정보 처리 방침</a> 및 <a href = ""> 이용약관 </a>에 동의합니다.<p>
        
        <div> <input type="submit" value="계정 만들기"> </div>
      </form>
   
   </section>
</body>
</html>