<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
 	body {
 		width:100%;
 		height:100%;
 		margin:0px;
 		line-height:1.5;
 	}
	.fullbody {
		display:flex;
		justify-content:center;
		height:100%;
	}
	.mainbody {
		max-width:460px;
		margin: 0px 36px;
		width:100%;
	}
	
   #country, #agree {
	 color : #A5A5A5;
   }
   
   a {
  	color : #A5A5A5;
   }

  
  .mainbody input[type=text] {
      width:460px;
      height:55px;
      border:1px solid black; 
      border-radius : 7px;
   }

   
     .mainbody input[type=password] {
      width:460px;
      height:55px;
      border:1px solid black; 
      border-radius : 7px;
   }
   
   	 .mainbody input[type=date] {
      width:464px;
      height:55px;
      border:1px solid black; 
      border-radius : 7px;
   	}
   .mainbody input[type=submit] {
      width:80px;
      height:45px;
      border:1px solid white;
      background:#e0e0e0;
      color:#666666;
      border-radius : 30px;
      float:right;
      cursor:pointer;
   }
   	
  </style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script>
	
	
  	$(document).ready(function(){
  		var $submit = $('.submit');
  		var $check = $('.agreecheck');
  		
  		$check.on('change',function(){
  			if (this.checked) {
  	  		    $submit.prop('disabled',false),
  	  		    $submit.css("background","black"),
  	  		    $submit.css("color","white");
  	  		  } else {
  	  		    $submit.prop('disabled',true),
  	  		  	$submit.css("background","#e0e0e0"),
  				$submit.css("color","#666666");
  	  		  }
  		});
  	});
  	
  	
	// 체크박스 체크안하면 진행 안되게 막기
	
	
  </script>
</head>
<body> 
	<div class="fullbody">
	   <div class="mainbody">
	    <div style="margin-top:20px;">
	  		<a href = "/"> <img src = "../resources/img/rice.png" width = "60px"> </a> 
	  	</div>
	      <form method="post" action="userinputok">
	       <% 
	       		String email = request.getParameter("email");
	  	 		session = request.getSession();
	       %>
	       
	        <h2> 이제 라이스 멤버가 되어볼까요? </h2> <p>
	        
	        <input type = "hidden" name = "email" value = "<%=email%>">
	        <input type = "hidden" name = "naveremail" value = "<%=session.getAttribute("naveremail") %>">
	
			<c:if test = "${naveremail == null }">
	        <input type = "text" name = "name" placeholder = "이름"> <p>
	       	<input type = "password" name = "pwd" placeholder = "비밀번호"> <p>
	       	<input type = "date" name = "birthdate" placeholder = "생년월일"> <p>
			</c:if>
			  
	       	 <c:if test = "${naveremail != null }">
	        <input type = "hidden" name = "name" value = "${navername}">
	        <input type = "hidden" name = "pwd" value = "null">
	        <input type = "date" name = "birthdate" placeholder = "생년월일"> <p>
	         </c:if>
	
	        <input type = "checkbox" class="agreecheck"> 라이스의 <a href ="#" >개인 정보 처리 방침</a> 및 <a href = "#"> 이용약관 </a>에 동의합니다.<p>
	        
	        <div> <input type="submit" value="계정 만들기" class="submit" disabled> </div>
	      </form>
	   
	   </div>
	</div>
</body>
</html>