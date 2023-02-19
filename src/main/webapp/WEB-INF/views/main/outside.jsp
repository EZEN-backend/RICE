<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function() {
	  // 클릭 이벤트 등록
	  $('.toggle-form').click(function() {
	    $('.hidden-form').slideDown();
	  });
	  
	  // outside 클릭 이벤트 등록
	  $(document).mouseup(function(e) {
	    var container = $('.hidden-form');
	    if (!container.is(e.target) && container.has(e.target).length == 0) {
	      container.slideUp();
	    }
	  });
	});
</script>
<style>
	.toggle-form {
		width:800px;
		height:400px;
		background:yellow;
	}
	.hidden-form {
		width:800px;
		height:400px;
		background:yellow;
		display:none;
	}
</style>
</head>
<body>
	<div class="toggle-form"> 클릭시 보임 </div>
	
	<form method="get" action="#" class="hidden-form">
		<input type="text" name="search">
	</form>
</body>
</html>