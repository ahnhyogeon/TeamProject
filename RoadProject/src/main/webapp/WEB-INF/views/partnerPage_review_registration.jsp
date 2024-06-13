<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/partnerPage_detail.css">
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
                스페이스 리뷰 등록
            </div>
            <div class="partnerInner_profile">
                <div class="profile_picture">
                     
                </div>
                <div class="partnerInner_info">
                    <div class="partnerInner_info_title">
                        <span>{카테고리}</span>
                        {상호명}
                    </div>
						인천광역시 부평구 부평대로 44
                </div>
            </div>
        </div>
    </div>
    <div class="myPage_mainbox2">
        <div class="partner_review_registration">
        	<form id="partner_review_registration_form" action="#" method="get">
        		<div class="review_registration_select">
        			<label>이용소감<span>*</span></label>
        			<div class="registration_select_group">
    					<input type="radio" id="radio1" name="registration_select" value="5" class="radio-button">
    					<div class="registration_select_group_token" data-radio="radio1">
    						<img src="resources/images/icons _ emoji/Star Struck.png" alt="star">
    						정말 최고예요!
    					</div>
    
    					<input type="radio" id="radio2" name="registration_select" value="4" class="radio-button">
    					<div class="registration_select_group_token" data-radio="radio2">
    						<img src="resources/images/icons _ emoji/Winking Face.png" alt="wink">
    						너무 만족해요!
    					</div>
    
    					<input type="radio" id="radio3" name="registration_select" value="3" class="radio-button">
   						 <div class="registration_select_group_token" data-radio="radio3">
   						 	<img src="resources/images/icons _ emoji/Slightly Smiling Face.png" alt="smile">
   						 	그냥 평범해요!
   						 </div>
   						 
   						 <input type="radio" id="radio4" name="registration_select" value="2" class="radio-button">
    					<div class="registration_select_group_token" data-radio="radio4">
    						<img src="resources/images/icons _ emoji/Confused Face.png" alt="confused">
    						그저 그래요!
    					</div>
    
    					<input type="radio" id="radio5" name="registration_select" value="1" class="radio-button">
   						 <div class="registration_select_group_token" data-radio="radio5">
   						 	<img src="resources/images/icons _ emoji/Pensive Face.png" alt="pensive">
   						 	별로예요!
   						 </div>
					</div>
        		</div>
        		<div class="partner_review_registration_textarea">
        			<label>상세 내용 입력<span>*</span></label>
        			<textarea id="partner_review_registration_area" placeholder="상세 내용을 입력해주세요."></textarea>
        		</div>
        		<div class="partner_review_registration_upload">
        			<label>이미지/동영상 파일</label>
        			<div id="review_registration_upload">
        				파일 선택
        				<img src="resources\images\Upload_red.png" alt="upload">
        			</div>
        			<div>
        				<span>*</span> 최대 5개 업로드 가능합니다. 파일 용량은 ~ jpg,png,mp4 포멧만 지원합니다.
        			</div>
        		</div>
        		<div class="review_registration_submitBox">
        			<div id="review_registration_review_rotice">
        				<img src="resources\images\Info_alt_light.png" alt="info">
        				<label>리뷰 작성 유의사항</label>
        			</div>
        			<button type="submit" class="review_registration_submit_btn">등록하기</button>
        		</div>
        	</form>
        </div>
    
        <div class="bannerBox">
            Banner
        </div>
    </div>
    
</div>