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
                마이 스페이스
            </div>
            <div class="partnerInner_profile">
                <div class="profile_picture">
                    <img src="resources/images/icons _ emoji/Camping.png" alt="Camping">  
                </div>
                <div class="partnerInner_info">
                    <div class="partnerInner_info_title">
                        <span>{카테고리}</span>
                        {상호명}
                        <img id="partner_edit_gear" src="resources\images\icons _ emoji\Gear.png" alt="gear">
                    </div>
					<div class="partnerInner_info_num">
						<div>
							받은 리뷰
							<span>12</span>	
						</div>
						<img src="resources\images\Ellipse 67.png" alt="ellipse">
						<div>
							남긴 답변
							<span>11</span>
						</div>
					</div>
                </div>
                
            </div>
        </div>
        <div class="myTabMenu">
            <div id="partner_tabMenu_myhome" class="subTabMenu">홈</div>
            <div id="partner_tabMenu_myreview" class="subTabMenu active">마이 리뷰</div>
            <div id="partner_tabMenu_myres" class="subTabMenu">예약 관리</div>
            <div id="partner_tabMenu_myavg" class="subTabMenu">통계 현황</div>
        </div>
    </div>
    <div class="myPage_mainbox2">
        <div class="partner_myreview">
        <div class="partner_myreview_titleBox">
        	<div class="partner_myreview_title">
    			<img src="resources/images/icons _ emoji/Black Nib.png" alt="pen">
    			<div>리뷰 요약</div>
    		</div>
    		<div class="partner_myreview_avg">
            	<div class="partner_dmyreview_box1">
            		<div class="partner_myreview1_title">
            			<span>12</span>
            			명의 사용자들은 평균적으로
            		</div>
            		<div class="partner_myreview_box1_img">
            			<img src="resources/images/happy_red.png" alt="happy">
            			<div>‘그냥 평범해요!’</div>
            		</div>
            		<div> 
            			라고 평가합니다.
            		</div>
				</div>
				<div class="partner_myreview_box2">
					<div class="partner_myreview_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Star Struck.png" alt="star">
						</div>
						<div class="partner_myreview_box2_scope_ratio">
							<div id="partner_detail_star_line" class="partner_myreview_ratio_line"></div>
						</div>
						<div>4</div>
					</div>
					<div class="partner_myreview_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Winking Face.png" alt="wink">
						</div>
						<div class="partner_myreview_box2_scope_ratio">
							<div id="partner_detail_wink_line" class="partner_myreview_ratio_line"></div>
						</div>
						<div>3</div>
					</div>
					<div class="partner_myreview_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Slightly Smiling Face.png" alt="smile">
						</div>
						<div class="partner_myreview_box2_scope_ratio">
							<div id="partner_detail_smile_line" class="partner_myreview_ratio_line"></div>
						</div>
						<div>3</div>
					</div>
					<div class="partner_myreview_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Confused Face.png" alt="confused">
						</div>
						<div class="partner_myreview_box2_scope_ratio">
							<div id="partner_detail_confused_line" class="partner_myreview_ratio_line"></div>
						</div>
						<div>3</div>
					</div>
					<div class="partner_myreview_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Pensive Face.png" alt="pensive">
						</div>
						<div class="partner_myreview_box2_scope_ratio">
							<div id="partner_detail_pensive_line" class="partner_myreview_ratio_line"></div>
						</div>
						<div>0</div>
					</div>
				</div>
        	</div>
        </div>
		<div class="partner_myreview_center">
			<div>
				총<span>12</span>개
			</div>
			<div>
				<div class="partner_myreview_center_select partner_myreview_active">등록순</div>
				<img src="resources\images\Ellipse 67.png" alt="ellipse">
				<div class="partner_myreview_center_select">조회수순</div>
				<img src="resources\images\Ellipse 67.png" alt="ellipse">
				<div class="partner_myreview_center_select">이름순</div>
			</div>
		</div>
		<div class="partner_myrevivew_list">
			<div class="partner_myreview_list_user">
				<div class="partner_myreview_list_user_img">
					<img src="resources\images\icons _ emoji\Winking Face.png" alt="winking">
				</div>
				<div class="partner_myreview_list_user_title">
					<div class="partner_myreview_list_user_name">{닉네임}</div>
					<img src="resources\images\Ellipse 67.png" alt="ellipse">
					<div class="partner_myreview_list_user_date">2024.01.01</div>
					<img src="resources\images\Ellipse 67.png" alt="ellipse">
					<div class="partner_myreview_list_user_rat">
    					<img src="resources/images/icons _ emoji/Star Struck.png" alt="star">
    					정말 최고예요!
    				</div>
    				<img src="resources\images\Ellipse 67.png" alt="ellipse">
    				<div class="partner_myreview_list_user_view">
    					<img src="resources\images\View_light.png" alt="ellipse">
    					294
    				</div>
				</div>
				<div class="partner_myreview_list_user_btn1 partner_myreview_btn_active">답변달기</div>
			</div>
			<div class="partner_myreview_list_user">
				<div class="partner_myreview_list_user_img">
					<img src="resources\images\icons _ emoji\Winking Face.png" alt="winking">
				</div>
				<div class="partner_myreview_list_user_title">
					<div class="partner_myreview_list_user_name">{닉네임}</div>
					<img src="resources\images\Ellipse 67.png" alt="ellipse">
					<div class="partner_myreview_list_user_date">2024.01.01</div>
					<img src="resources\images\Ellipse 67.png" alt="ellipse">
					<div class="partner_myreview_list_user_rat">
    					<img src="resources/images/icons _ emoji/Winking Face.png" alt="winking">
    					너무 만족해요!
    				</div>
    				<img src="resources\images\Ellipse 67.png" alt="ellipse">
    				<div class="partner_myreview_list_user_view">
    					<img src="resources\images\View_light.png" alt="ellipse">
    					1099
    				</div>
				</div>
				<div class="partner_myreview_list_user_btn2">답변완료</div>
			</div>
			<div class="partner_myreview_list_user_more">
				더보기
				<img src="resources\images\Expand_down_light.png" alt="ellipse">
			</div>
		</div>
    </div>
</div>
</div>