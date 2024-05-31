<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
  <div class="listbox">
  
  	<form action="reviewEditok" method="post" class="mb-3">
		<div class="form-group">
			<p>임시 설정 : userid(4)(아직 미구현ㅜ) / 이름(홍길동)</p>
			<p>아직 작업중</p>
			<label for="comment">제목 : </label>
				<input type="text" name="title" id="title" class="form-control mb-3">
			<label for="comment">리뷰 작성 : </label>
				<textarea class="form-control mb-3" rows="7" id="detail" name="detail"></textarea>
			<label for="comment">해시태그 : </label>
				<textarea class="form-control" rows="1" id="hashtag" name="hashtag"></textarea>
				<input type="hidden" name="nickname" id="nickname" value="홍길동">
				<input type="hidden" name="userid" id="userid" value="${userid }">
		</div>
		<a href="javascript:history.back();" class="btn btn-danger">뒤로</a>
		<button type="submit" class="btn btn-primary">저장</button>
	</form>
	
	<a href="review">리뷰 페이지</a>
	
  </div>
</section>