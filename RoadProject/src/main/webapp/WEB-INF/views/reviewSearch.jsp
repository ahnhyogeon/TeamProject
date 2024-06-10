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
  <div class="reviewbox container">
  
    <p class="mb-3">팔로우 기능 (임시 test1 -> test2): <button type="button" onclick="followUser()">팔로우</button></p>
    <p class="mb-3">팔로우 취소 기능 (임시 test1 -> test2를 삭제): <button type="button" onclick="unfollowUser()">팔로우 취소</button></p>  
    
    <div class="reviewSummary row">
    	<div class="col-9">
    		<h3>리뷰 요약</h3>
    	</div>
    	<div class="col-3">
    		<a href="reviewEdit?userid=4" class="col-9 btn btn-primary">리뷰 등록</a> <!-- userid값 4로 고정 -->
    	</div>
    	<div class="col-4 d-flex justify-content-center align-items-center">
    		<span class="text-center">${reviewCount}명의 사용자들은 평균적으로
    		5점 만점에 ${reviewScoreResult}점
    		이라고 평가합니다.</span>
    	</div>
    	<div class="col-8 d-flex justify-content-center align-items-center">
    		<div>
    			<p class="text-center">5점 : ${reviewFiveScore}명</p>
    			<p class="text-center">4점 : ${reviewFourScore}명</p>
    			<p class="text-center">3점 : ${reviewThreeScore}명</p>
    			<p class="text-center">2점 : ${reviewTwoScore}명</p>
    			<p class="text-center">1점 : ${reviewOneScore}명</p>
    		</div>
    	</div>
    </div>
    
	<div class="d-flex justify-content-between align-items-center">
	    <p>총 ${reviewSearchCount}개</p>
	    <p><a href="#">등록순</a> | <a href="#">조회순</a></p>
	</div>
    
    
    
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
	        <c:forEach var="review" items="${reviews}">
	        <tbody>	
	            <tr>
	            	<td class="mt-3"><a href="reviewDetail?id=${review.id }">${review.title}</a></td>
	            	<td class="mt-3">${review.nickname}</td>
	            </tr>
	            <tr>
	                <td>방문기록?</td>
	                <td>조회수 : ${review.hits}</td>
	            </tr>
	            <tr>
	                <td colspan="2">
                    	<c:choose>
                        	<c:when test="${fn:length(review.detail) > 30}">
                            	${fn:substring(review.detail, 0, 30)}...
                            </c:when>
                        	<c:otherwise>
                        		${review.detail}
                       		</c:otherwise>
                    	</c:choose>
                	</td>
	            </tr>
	            <tr>
	                <td>추천율 : <fmt:formatNumber value="${review.result}" type="number" maxFractionDigits="1"/>%</td>
	                <td>
	                	<form action="rating" method="get">
	                		<input type="hidden" name="id" id="id" value="${review.id}">
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