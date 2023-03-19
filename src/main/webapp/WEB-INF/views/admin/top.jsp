<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		width:100%;
	}	
	.top {
		width:100%;
		height:50px;
		display:grid;
		grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
		text-align:center;
		margin-top: 20px;
	}
	.top a:hover {
		border-radius:15px;
		color:blue;
		background:#cccccc;
	}
</style>
</head>
<body>
	<div class="top">
		<div><a href = "/"> <img src="../resources/img/rice.png" width = "70px"> </a></div>
		<div> <a href="/admin/register"> 상품등록 </a> </div>
		<div> <a> 상품목록 </a> </div>
		<div> <a> 1:1문의 </a> </div>
		<div></div>
	</div>