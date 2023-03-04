<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	    var offset = 0;
	    var limit = 10;
	    var isLoading = false;
	
	    $(window).scroll(function() {
	        if ($(window).scrollTop() == $(document).height() - $(window).height() && !isLoading) {
	            isLoading = true;
	            $.ajax({
	                url: "/items/data",
	                type: "GET",
	                data: {
	                    offset: offset,
	                    limit: limit
	                },
	                success: function(items) {
	                    isLoading = false;
	                    offset += limit;
	                    for (var i = 0; i < items.length; i++) {
	                        var item = items[i];
	                        $("#item-list").append("<li>" + item.id + " " + item.name + "</li>");
	                    }
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    isLoading = false;
	                    alert("데이터를 가져오는 중에 오류가 발생했습니다.");
	                }
	            });
	        }
	    });
	});
</script>
</head>
<body>
	<ul id="item-list">
    </ul>
</body>
</html>