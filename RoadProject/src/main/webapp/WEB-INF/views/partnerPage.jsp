<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                스페이스 정보
            </div>
            <div class="partnerInner_profile">
                <div class="profile_picture">
                    <img src="resources/images/icons _ emoji/Winking Face.png" alt="winking">  
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
            <div id="partner_tabMenu_home" class="subTabMenu active">홈</div>
            <div id="partner_tabMenu_review" class="subTabMenu">메뉴</div>
            <div id="partner_tabMenu_res" class="subTabMenu">리뷰 0</div>
        </div>
    </div>
    <div class="myPage_mainbox2">
        <div class="partner_imageBox">
            <div class="partner_imageBox_sub"></div>
            <div class="partner_imageBox_sub"></div>
            <div class="partner_imageBox_sub"></div>
            <div class="partner_imageBox_sub"></div>
        </div>
        <div class="partner_infoBox">
			<div>
				스페이스 정보
			</div>
			<div class="partner_infoBox_info">
				<div>
					<div class="partner_infoBox_info_title">
						<img src="resources/images/icons _ emoji/Camping.png" alt="camping">
						소개
					</div>
					${rdto.r_intro }
				</div>
			<div>
					<div class="partner_infoBox_info_title">
						<img src="resources/images/Telephone Receiver.png" alt="tel">
						전화번호
					</div>
					${rdto.r_tel }
				</div>
			<div>
					<div class="partner_infoBox_info_title">
						<img src="resources/images/icons _ emoji/Person Tipping Hand.png" alt="person">
						위치 
					</div>
					${rdto.r_addr1 }
					<img src="resources/images/Ellipse 67.png" alt="ellipse">
					${rdto.r_addr2 }
				</div>
			<div>
					<div class="partner_infoBox_info_title">
						<img src="resources/images/Alarm Clock.png" alt="clock">
						운영시간
					</div>
					${rdto.r_time }
				</div>
			<div>
					<div class="partner_infoBox_info_title">
						<img src="resources/images/Receipt.png" alt="receipt">
						메뉴
					</div>
					<div class="partner_infoBox_menu">
						<div>
						 <c:forEach var="m_list" items="${m_list }" begin="0" end="1">
							<div class="partner_menu_list">
								<div>${m_list.m_name }</div> ${m_list.m_cost }
							</div>
							</c:forEach>
												
						</div>
						<span>메뉴더보기</span>
					</div>
					</div>
			<div>
					<div class="partner_infoBox_info_title">
						<img src="resources/images/Globe With Meridians.png" alt="meridians">
						사이트
					</div>
					<a href="#">${rdto.r_url }</a>
				</div>
				</div>
				<div id="partner_infoBox_rotice">
						<div>
							공지사항
						</div>
						당일 예약 가능합니다 :)  <!-- ${rdto.notice } -->
					</div>
				</div>
        <div class="myPage_content">
            <div class="partner_title">
                <div>
                    <img src="resources/images/Bar Chart.png" alt="chart">
                </div>
                통계 데이터
            </div>
            <div class="partner_content">
                <div>
                    <img src="resources/images/Fire.png" alt="fire">
                </div>
              	이 가게는 <span>수요일</span> <span>13시</span>에 제일 인기가 많습니다!
              	<div>
                    <img src="resources/images/Fire.png" alt="fire">
                </div>
                
            </div>
            <div class="partner_chart">
                	<img src="resources/images/ex1.png" alt="ex"/>
                	<img src="resources/images/ex2.png" alt="ex"/>
                </div>
        </div>
        <div class="bannerBox">
            Banner
        </div>
    </div>
    
</div>