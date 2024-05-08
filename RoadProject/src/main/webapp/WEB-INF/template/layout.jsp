<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<!-- header -->
    <tiles:insertAttribute name="header"/>
    
    
   	<div>
    	<!-- content -->
    	<tiles:insertAttribute name="content"/>
    </div>
    
    <!-- footer -->
    <tiles:insertAttribute name="footer"/>
</div>
</body>
</html>