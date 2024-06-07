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
</head>
<body>

	<!-- header -->
    <tiles:insertAttribute name="header"/>
    
    

    	<!-- content -->
    	<tiles:insertAttribute name="content"/>

    
    <!-- footer -->
    <tiles:insertAttribute name="footer"/>

</body>
</html>