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
            <div id="partner_tabMenu_myreview" class="subTabMenu">마이 리뷰</div>
            <div id="partner_tabMenu_myres" class="subTabMenu active">예약 관리</div>
            <div id="partner_tabMenu_myavg" class="subTabMenu">통계 현황</div>
        </div>
    </div>
    <div class="myPage_mainbox4">
        <div class="reviewInner">
            <div class="review_title">
                <div class="review_title_count">
                    총<span>0</span>개
                </div>
                <div class="review_title_filter">
                    <a href="#">등록순</a>
                    <img src="resources/images/Ellipse 68.png" alt="ellipse">
                    <a href="#">이름순</a>
                </div>
            </div>
            <div class="review_tab">
                <button class="review_tab_btn">
                    전체<span>0</span>
                </button>
                <button class="review_tab_btn">
                    공개<span>0</span>
                </button>
                <button class="review_tab_btn">
                    비공개<span>0</span>
                </button>
            </div>
            <div class="theme_contents">
                <div class="theme_img">
                    <img src="resources/images/profile img.png" alt="profile">
                </div>
                <div class="theme_info">
                    맛집 기행
                    <div>
                        <div>
                            <img src="resources/images/icons _ emoji/Winking Face.png" alt="winking">
                            {닉네임}
                        </div>
                        <img src="resources/images/Ellipse 68.png" alt="ellipse">
                        <div>
                            <img src="resources/images/icons _ emoji/Pushpin.png" alt="Pushpin">
                            23
                        </div>
                        <img src="resources/images/Ellipse 68.png" alt="ellipse">
                        <span>2024.01.01</span>
                    </div>
                </div>
                <img src="resources/images/Meatballs_menu.png" alt="Meatballs_menu">
            </div>
            <button class="theme_content_btn btn-danger btn">
                테마 만들기
            </button>
    </div>
    </div>
</div>