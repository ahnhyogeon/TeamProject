<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/partnerPage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="resources/js/jquery.min.js"></script>        
<script src="resources/js/script.js"></script>

<div id="containerM">
    <div class="myPage_mainbox1">
        <div class="myInner">
            <div class="myInner_title">
                리뷰 상세
            </div>
        </div>
    </div>
    <div class="myPage_mainbox2">
        <div class="partner_myreview_detail">
	<div class="partner_myreview_detail_inner">
		<div class="partner_myreview_detail_inner_title">
			<div>
				<img src="resources\images\icons _ emoji\Winking Face.png" alt="wink">
			</div>
			<div  class="partner_myreview_detail_inner_title_box">
				<div class="partner_myreview_detail_inner_title1">
					상위 10% 리뷰어
				</div>
				<div class="partner_myreview_detail_inner_title2">
					{닉네임}
					<img src="resources\images\Ellipse 67.png" alt="ellipse">
					2024.01.01
					<img src="resources\images\Ellipse 67.png" alt="ellipse">
					<div class="partner_myreview_detail_inner_card">
    					<img src="resources/images/icons _ emoji/Star Struck.png" alt="star">
    					정말 최고예요!
    				</div>
				</div>
			</div>		
		</div>
		<div class="partner_myreview_detail_inner_img">
			<div></div>
			<div></div>
			<div></div>
		</div>
		<div class="partner_myreview_detail_inner_text">
			너무 맛있네요! 다른 사람들에게도 추천하고 싶네요.
		</div>
		<div class="partner_myreview_detail_inner_textshow">
			<div>
				<div>
					<img src="resources\images\icons _ emoji\Grinning Face.png" alt="hands">
					<div>
						<span>1</span>
						명이 공감했습니다!
					</div>
				</div>
			</div>
			<div class="partner_myreview_detail_inner_view">
				<img src="resources\images\icons _ emoji\Eyes.png" alt="eyes">
				<div>
					<span>100</span>명 클릭
				</div>
			</div>
		</div>
		<div class="partner_myreview_myanswer">
			<div class="partner_myreview_myanswer_title">
				<div>
					사장님의 한마디
				</div>
				<div>
					2024.01.01
				</div>
			</div>
			<div class="partner_myreview_myanswer_inner">
				{닉네임}님 방문해주셔서 감사합니다 :)
			</div>
		</div>
		<div class="right-align">
			<div id="edit_btn" class="partner_myreview_detail_inner_respon">
				수정하기
			</div>
		</div>
	</div>
</div>
<div id="respon_box">
	<form class="partner_myreview_edit_form" action="#" method="post">
		<div class="partner_myreview_respon_formbox">
			<label>답변</label>
			<textarea>{닉네임}님 방문해주셔서 감사합니다 :)</textarea>
		</div>
		<div class="partner_myreview_respon_formbox_btnBox">
			<button type="reset" class="partner_myreview_respon_form_reset">취소</button>
			<button type="submit" class="partner_myreview_respon_form_submit">등록하기</button>
		</div>
	</form>
</div>
</div>
</div>