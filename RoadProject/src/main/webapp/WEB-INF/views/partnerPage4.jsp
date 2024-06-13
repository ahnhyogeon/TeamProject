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
            <div id="partner_tabMenu_myres" class="subTabMenu">예약 관리</div>
            <div id="partner_tabMenu_myavg" class="subTabMenu active">통계 현황</div>
        </div>
    </div>
    <div class="myPage_mainbox4">
        <div class="myPage_content  partner_avg_margin">
            <div class="partner_title">
                <div>
                    <img id="partner_myrotice_open" src="resources/images/Bar Chart.png" alt="chart">
                </div>
                <div class="partner_title_text">
                	예약 통계 요약
                </div>
                <div class="partner_title_date">
                	2024.01.01 ~ 2024.01.07
                </div>
            </div>
            <div class="partner_chart">
            		<div>
            			시간별
            			<div class="partner_chart_time"></div>
            		</div>
            		<div>
            			예약별
            			<div class="partner_chart_res"></div>
            		</div>
                	
                </div>
        </div>
        <div id="partner_myavg_detail">통계현황 상세보기</div>
    <div class="bannerBox">
            Banner
        </div>
</div>
</div>