<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="register">가게등록</a>
<a href="rest">가게정보</a> <!-- 가게명을 누르면 business를 비교하여 각 가게의 메뉴를 뜨게함. -->
<a href="delrest">삭제</a>
<a href="AllMenu">전체메뉴</a> <!-- 관리자만 들어갈 수 있음. -->
<a href="review">리뷰</a>
</body>
</html>
