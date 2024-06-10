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
  <div class="listbox container mt-4">
  
	<h4 class="text-center">임시 설정 : userid(4) / 이름(홍길동)</h4>
	<h4 class="text-center">리뷰 등록</h4>
  
  	<form action="reviewEditok" method="post" class="mb-3" enctype="multipart/form-data">
		<div class="form-group">

			<p>레스토랑 정보</p>

			<label for="comment">이용 소감<span style="color:red">*</span></label>
			<div class="d-flex justify-content-center align-items-center">
				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="score" id="btnradio1" autocomplete="off" value="5" checked>
				  <label class="btn btn-outline-primary m-3" for="btnradio1">정말 최고예요!</label>
				
				  <input type="radio" class="btn-check" name="score" id="btnradio2" autocomplete="off" value="4">
				  <label class="btn btn-outline-primary m-3" for="btnradio2">너무 만족해요!</label>
				
				  <input type="radio" class="btn-check" name="score" id="btnradio3" autocomplete="off" value="3">
				  <label class="btn btn-outline-primary m-3" for="btnradio3">그냥 평범해요!</label>
				  
				  <input type="radio" class="btn-check" name="score" id="btnradio4" autocomplete="off" value="2">
				  <label class="btn btn-outline-primary m-3" for="btnradio4">그저 그래요!</label>
				  
				  <input type="radio" class="btn-check" name="score" id="btnradio5" autocomplete="off" value="1">
				  <label class="btn btn-outline-primary m-3" for="btnradio5">별로예요!</label>
				</div>
			</div>
			<label for="title">제목<span style="color:red">*</span></label>
				<textarea class="form-control mb-3" rows="1" id="title" name="title"></textarea>
			<label for="comment">상세 내용 입력<span style="color:red">*</span></label>
				<textarea class="form-control mb-3" rows="7" id="detail" name="detail"></textarea>
				<div class="form-group">
			        <label for="image">이미지 첨부</label>
			        <input type="file" name="imnum" accept="image/*" multiple>
			    </div>
		</div>
		<a href="javascript:history.back();" class="btn btn-danger">뒤로</a>
		<button type="submit" class="btn btn-primary">저장</button>
		
		<input type="hidden" name="userid" value="4">
		<input type="hidden" name="nickname" value="홍길동">
		<input type="hidden" name="restaurant_id" value="61">
	</form>
	
	<a href="review">리뷰 페이지</a>
	
  </div>
</section>