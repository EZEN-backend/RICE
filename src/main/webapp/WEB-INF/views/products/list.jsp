<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="https://kit.fontawesome.com/804c868edf.js" crossorigin="anonymous"></script>
    <style>
        .Section {
            width:1920px;
            height:1080px;
            margin:auto;
        }
        .offsetSection {
            width:100%;
            height:15px;
        }
        .titleSection {
            width:100%;
            height:50px;
            display:flex;
        }
        .title {
            width:80%;
            height:100%;
            position:relative;
        }
        .title-text {
            position:absolute;
            display:block;
            top:25%;
            width:30%;
            height:100%;
            margin:auto;
            font-weight: bolder;
            padding-left:5%;
        }
        .navFilter {
            width:20%;
            height:100%;
            display:flex;
            align-items: center;
        }
        .filterButton {
            width:50%;
            height:65%;
            display:table;

        }
        .sortButton {
            width:50%;
            height:65%;
        }
        .filterbtn, .sortbtn {
            border: none;
            position: relative;
            height:100%;
        }
        .main {
            width:100%;
            height:1000px;
            display:flex;
            position:absolute;
        }
        .filterSection {
            width:13.5%;
            height:100%;
            position:relative;
        }
        .bodySection {
            width:86.5%;
            height:100%;
            position:relative;
        }
        .item {
            width:33%;
            height:600px;
            display:inline-block;
            margin-top:2px;
        }
        .item_body {
            width:97%;
            height:95%;
            margin:auto;
            position:static;
        }
    </style>
</head>
<body>
<section class="Section">
    <div class="offsetSection"></div>
    <div class="titleSection">
        <div class="title">
            <h1 class="title-text">

            </h1>
            <h1 class="item-count">

            </h1>
        </div>
        <nav class="navFilter">
            <div class="filterButton">
                <button class="filterbtn">
                    <span class="filter-text"></span>
                    <i class="fa-solid fa-arrow-down-short-wide"></i>
                </button>
            </div>
            <div class="sortButton">
                <button class="sortbtn">
                    <span class="sort-text"></span>
                    <i class="fa-sharp fa-solid fa-chevron-down"></i>
                </button>
            </div>
        </nav>
    </div>
    <div class="offsetSection"></div>
    <div class="main">
        <div class="filterSection">

        </div>
        <div class="bodySection">
            <main>
                <section class="mainSection">
                    <div class="items">
                        <c:forEach items="${list}" var="list" varStatus="status">
                        <div class="item">
                            <div class="item_body">
                                <figure>
                                    <a class="item_card">
                                        <div class="item_img">

                                        </div>
                                        <div class="item_info">
                                            <div class="item_title"></div>
                                            <div class="item_subtitle"></div>
                                        </div>
                                        <div class="item_price">

                                        </div>
                                    </a>
                                </figure>
                            </div>
                        </div>
                        <c:if test="${status.count % 3 == 0}">
                        </div>
                        <div>
                        </c:if>
                        </c:forEach>
                    </div>
                </section>
            </main>
        </div>
    </div>
</section>
</body>
</html>