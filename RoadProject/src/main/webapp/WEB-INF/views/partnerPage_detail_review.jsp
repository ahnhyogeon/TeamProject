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
                스페이스 정보
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
                <div class="partnerInner_info_btn">
                	<div class="partner_info_btn">
                		<img src="resources/images/Timer Clock.png" alt="clock"/>
                		오픈런 예약 대기
                	</div>
                	<div class="partner_info_btn">
                		<img src="resources/images/icons _ emoji/Spiral Calendar.png" alt="calendar"/>
                		일반 예약
                	</div>
                	<div class="partner_info_btn">
                		<img src="resources/images/pushpin.png" alt="pushpin"/>
                		스크랩
                	</div>
                </div>
            </div>
        </div>
        <div class="myTabMenu">
            <div id="partner_detail_tabMenu_home" class="subTabMenu">홈</div>
            <div id="partner_detail_tabMenu_menu" class="subTabMenu">메뉴</div>
            <div id="partner_detail_tabMenu_review" class="subTabMenu active">리뷰 <span>12</span></div>
        </div>
    </div>
    <div class="myPage_mainbox2">
        <div class="partner_detail_menu">
        <div class="partner_detail_review_titleBox">
        	<div class="partner_detail_review_title">
    			<img src="resources/images/icons _ emoji/Black Nib.png" alt="pen">
    			<div>리뷰 요약</div>
    			<div id="partner_detail_review_btn">리뷰 등록하기</div>
    		</div>
    		<div class="partner_detail_review_avg">
            	<div class="partner_detail_review_box1">
            		<div class="partner_detail_review_box1_title">
            			<span>12</span>
            			명의 사용자들은 평균적으로
            		</div>
            		<div class="partner_detail_review_box1_img">
            			<img src="resources/images/happy_red.png" alt="happy">
            			<div>‘그냥 평범해요!’</div>
            		</div>
            		<div> 
            			라고 평가합니다.
            		</div>
				</div>
				<div class="partner_detail_review_box2">
					<div class="partner_detail_review_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Star Struck.png" alt="star">
						</div>
						<div class="partner_detail_review_box2_scope_ratio">
							<div id="partner_detail_star_line" class="partner_detail_ratio_line"></div>
						</div>
						<div>4</div>
					</div>
					<div class="partner_detail_review_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Winking Face.png" alt="wink">
						</div>
						<div class="partner_detail_review_box2_scope_ratio">
							<div id="partner_detail_wink_line" class="partner_detail_ratio_line"></div>
						</div>
						<div>3</div>
					</div>
					<div class="partner_detail_review_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Slightly Smiling Face.png" alt="smile">
						</div>
						<div class="partner_detail_review_box2_scope_ratio">
							<div id="partner_detail_smile_line" class="partner_detail_ratio_line"></div>
						</div>
						<div>3</div>
					</div>
					<div class="partner_detail_review_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Confused Face.png" alt="confused">
						</div>
						<div class="partner_detail_review_box2_scope_ratio">
							<div id="partner_detail_confused_line" class="partner_detail_ratio_line"></div>
						</div>
						<div>3</div>
					</div>
					<div class="partner_detail_review_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Pensive Face.png" alt="pensive">
						</div>
						<div class="partner_detail_review_box2_scope_ratio">
							<div id="partner_detail_pensive_line" class="partner_detail_ratio_line"></div>
						</div>
						<div>0</div>
					</div>
				</div>
        	</div>
        </div>
        <div class="partner_detail_review_center_title">
        	<div class="partner_detail_review_center_title_top">
        		총
        		<span>12</span>
        		개
        	</div>
        	<div class="partner_detail_review_center_title_last">
        		<a id="partner_detail_review_first_a" href="#">등록순</a>
        		<img src="resources/images/Ellipse 67.png" alt="ellipse">
        		<a id="partner_detail_review_second_a" href="#">조회수순</a>
        	</div>
        </div>
    		<div class="partner_detail_review_list">
    			<div class="partner_detail_review_list_card">
    				<div class="partner_detail_review_list_card_top">
    					<img src="resources/images/icons _ emoji/Star Struck.png" alt="star">
    					정말 최고예요!
    				</div>
    				<div class="partner_detail_review_list_card_bottom">
    					<div id="partner_detail_review_list_card_bottom_date">2024.01.01</div>
    					<div id="partner_detail_review_list_card_bottom_user">{사용자}</div>
    				</div>
    			</div>
    			<div class="partner_detail_review_list_card">
    				<div class="partner_detail_review_list_card_top">
    					<img src="resources/images/icons _ emoji/Star Struck.png" alt="star">
    					정말 최고예요!
    				</div>
    				<div class="partner_detail_review_list_card_bottom">
    					<div id="partner_detail_review_list_card_bottom_date">2024.01.01</div>
    					<div id="partner_detail_review_list_card_bottom_user">{사용자}</div>
    				</div>
    			</div>
    			<div class="partner_detail_review_list_card">
    				<div class="partner_detail_review_list_card_top">
    					<img src="resources/images/icons _ emoji/Star Struck.png" alt="star">
    					정말 최고예요!
    				</div>
    				<div class="partner_detail_review_list_card_bottom">
    					<div id="partner_detail_review_list_card_bottom_date">2024.01.01</div>
    					<div id="partner_detail_review_list_card_bottom_user">{사용자}</div>
    				</div>
    			</div>
    			<div class="partner_detail_review_list_card">
    				<div class="partner_detail_review_list_card_top">
    					<img src="resources/images/icons _ emoji/Star Struck.png" alt="star">
    					정말 최고예요!
    				</div>
    				<div class="partner_detail_review_list_card_bottom">
    					<div id="partner_detail_review_list_card_bottom_date">2024.01.01</div>
    					<div id="partner_detail_review_list_card_bottom_user">{사용자}</div>
    				</div>
    			</div>
    		</div>
    		
    		<div class="partner_detail_review_list_more">
    				더보기
    				<img src="resources/images/Expand_down_light.png" alt="down">
    			</div>
    	</div>
        <div class="bannerBox">
            Banner
        </div>
    </div>
    
</div>

<div id="overlay"></div>
<div id="partner_detail_review_detailpop1" class="partner_detail_review_detailpop">
	<label>리뷰 정보</label>
	<div class="partner_detail_review_detailpop_inner">
		<div class="partner_detail_review_detailpop_inner_title">
			<div>
				<img src="resources\images\icons _ emoji\Winking Face.png" alt="wink">
			</div>
			<div  class="partner_detail_review_detailpop_inner_title_box">
				<div>
					{닉네임}
					<div class="partner_detail_review_detailpop_inner_card">
    					<img src="resources/images/icons _ emoji/Star Struck.png" alt="star">
    					정말 최고예요!
    				</div>
				</div>
				2024.01.01
			</div>
			<div class="partner_detail_review_detailpop_inner_follow">
				팔로우
			</div>		
		</div>
		<div class="partner_detail_review_detailpop_inner_img">
			<div></div>
			<div></div>
			<div></div>
		</div>
		<div class="partner_detail_review_detailpop_inner_text">
			너무 맛있네요! 다른 사람들에게도 추천하고 싶네요.
		</div>
		<div class="partner_detail_review_detailpop_inner_show">
			<div>
				<div>
					<img src="resources\images\icons _ emoji\Raising Hands.png" alt="hands">
					<div>
						<span>1</span>명이 공감했습니다!
					</div>
				</div>
				<div>
					<img src="resources\images\icons _ emoji\Raising Hands.png" alt="hands">
					공감 취소하기
				</div>
			</div>
			<div class="partner_detail_review_detailpop_inner_show_view">
				<img src="resources\images\icons _ emoji\Eyes.png" alt="eyes">
				<div>
					<span>100</span>명 클릭
				</div>
			</div>
		</div>
		<div class="partner_detail_review_detailpop_inner_partner">
			<div class="partner_detail_review_detailpop_inner_partner_title">
				<div>
					사장님의 한마디
				</div>
				<div>
					2024.01.01
				</div>
			</div>
			<div class="partner_detail_review_detailpop_inner_partner_inner">
				{닉네임}님 방문해주셔서 감사합니다 :)
			</div>
		</div>
		<div id="Xbox">
			<img src="resources\images\Close_square_light.png" alt="X">
		</div>
	</div>
</div>