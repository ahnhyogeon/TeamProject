<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.css" integrity="sha512-OQDNdI5rpnZ0BRhhJc+btbbtnxaj+LdQFeh0V9/igiEPDiWE2fG+ZsXl0JEH+bjXKPJ3zcXqNyP4/F/NegVdZg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="resources/js/jquery-ui-1.13.2/jquery-ui.css">
<link rel="stylesheet" href="resources/css/review.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-ui-1.13.2/jquery-ui.min.js"></script>
<script src="resources/js/jquery-ui-1.13.2/jquery-ui.js"></script>
<script src="resources/js/review.js"></script>  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <c:if test="${param.error != null}">
     <script>alert("${param.error}");</script>
  </c:if>

<section id="section" class="bg-white pb-3">
  <div class="reviewbox">
  
    <p class="mb-3">팔로우 기능 (임시 test1 -> test2): <button type="button" onclick="followUser()">팔로우</button></p>
    <p class="mb-3">팔로우 취소 기능 (임시 test1 -> test2를 삭제): <button type="button" onclick="unfollowUser()">팔로우 취소</button></p>  
    
    <nav class="navbar navbar-light bg-light">
  		<div class="container-fluid">
	    	<form class="d-flex" action="reviewSearch" method="post">
	      		<input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search">
	    	</form>
  		</div>
	</nav>
    
    <div class="row">
	    <table class="table col-4">
	        <colgroup>
	           <col width="65%">
	           <col width="35%">
	        </colgroup>
	     	<!-- 루프 -->
	        <c:forEach var="reviews" items="${reviews}">
	        <tbody>	
	            <tr>
	            	<td class="mt-3"><a href="reviewDetail?id=${reviews.id }">${reviews.title}</a></td>
	            	<td class="mt-3">${reviews.nickname}</td>	
	            </tr>
	            <tr>
	                <td>방문기록?</td>
	                <td>조회수 : ${reviews.hits}</td>
	            </tr>
	            <tr>
	                <td colspan="2">
                    	<c:choose>
                        	<c:when test="${fn:length(reviews.detail) > 120}">
                            	${fn:substring(reviews.detail, 0, 120)}...
                            </c:when>
                        	<c:otherwise>
                        		${reviews.detail}
                       		</c:otherwise>
                    	</c:choose>
                	</td>
	            </tr>
	            <tr>
	                <td colspan="2">${reviews.hashtag}</td>
	            </tr>
	            <tr>
	                <td colspan="2">루트보기?</td>
	            </tr>	
	            <tr>
	                <td>추천율 : <fmt:formatNumber value="${reviews.result}" type="number" maxFractionDigits="1"/>%</td>
	                <td>
	                	<form action="rating" method="get">
	                		<input type="hidden" name="id" id="id" value="${reviews.id}">
	                		<button type="submit">좋아요</button>
	                	</form>
	                </td>
	            </tr>
	            <tr><td colspan="2" class="no-line">&nbsp;</td></tr>
	        </tbody>
	        </c:forEach>
	            <!-- /루프 -->
	    </table>
    </div>

	<a href="reviewEdit?userid=4">리뷰 작성 페이지</a>
	
  </div>
</section>