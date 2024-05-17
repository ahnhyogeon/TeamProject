<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><tiles:getAsString name="title"/></title>
  <link rel="stylesheet" href="resources/css/style.css">
  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/script.js"></script>
</head>
<body>
  <div class="container">
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