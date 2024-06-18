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
            <div id="partner_tabMenu_myhome" class="subTabMenu active">홈</div>
            <div id="partner_tabMenu_myreview" class="subTabMenu">마이 리뷰</div>
            <div id="partner_tabMenu_myres" class="subTabMenu">예약 관리</div>
            <div id="partner_tabMenu_myavg" class="subTabMenu">통계 현황</div>
        </div>
    </div>
    <div class="myPage_mainbox2">
        <div class="partner_myres">
			<div class="partner_myres_title">
				<img src="resources\images\Bell.png" alt="bell">
				<div class="partner_myres_title_text">
					예약 현황
					<img src="resources\images\Info_alt_light.png" alt="info">
				</div>
				<img src="resources\images\Expand_right_light.png" alt="expand_right">
			</div>
			<div class="partner_myres_title_content">
				<div class="partner_myres_title_contentbox">
					12
					<span>오늘 예약</span>
				</div>
				<div class="partner_myres_title_contentbox">
					190
					<span>추후 예약</span>
				</div>
				<div class="partner_myres_title_contentbox">
					3
					<span>예약 확정</span>
				</div>
			</div>
        </div>
        <div class="partner_myinfoBox">
			<div class="partner_myres_title">
				<img src="resources/images/icons _ emoji/Camping.png" alt="Camping">
				<div class="partner_myres_title_text">
					마이 스페이스 정보
				</div>
				<img src="resources\images\Expand_right_light.png" alt="expand_right">
			</div>
			<div class="partner_myinfoBox_info">
				<div>
					<div class="partner_myinfoBox_info_title">
						<img src="resources/images/icons _ emoji/Camping.png" alt="camping">
						소개
					</div>
					${rdto.r_intro }
				</div>
			<div>
					<div class="partner_myinfoBox_info_title">
						<img src="resources/images/Telephone Receiver.png" alt="tel">
						전화번호
					</div>
					${rdto.r_tel }
				</div>
			<div>
					<div class="partner_myinfoBox_info_title">
						<img src="resources/images/icons _ emoji/Person Tipping Hand.png" alt="person">
						위치 
					</div>
					${rdto.r_addr1 }
					<img src="resources/images/Ellipse 67.png" alt="ellipse">
					${rdto.r_addr2 }
				</div>
			<div>
					<div class="partner_myinfoBox_info_title">
						<img src="resources/images/Alarm Clock.png" alt="clock">
						운영시간
					</div>
					${rdto.r_time }
				</div>
			<div>
					<div class="partner_myinfoBox_info_title partner_myinfoBox_menu_position">
						<img src="resources/images/Receipt.png" alt="receipt">
						메뉴
					</div>
					<div class="partner_myinfoBox_menu">
						<div>
						 <c:forEach var="m_list" items="${m_list }" begin="0" end="1">
							<div class="partner_myinfoBox_menu_list">
								<div>${m_list.m_name }</div> ${m_list.m_cost }
							</div>
							</c:forEach>
												
						</div>
						<span>메뉴판 이미지</span>
					</div>
					</div>
			<div>
					<div class="partner_myinfoBox_info_title">
						<img src="resources/images/Globe With Meridians.png" alt="meridians">
						사이트
					</div>
					<a class="partner_mysite" href="#">${rdto.r_url }</a>
				</div>
				</div>
				<c:choose>
  				<c:when test="${not empty rdto.notice}">  
				<div id="partner_infoBox_rotice">
						<div>
							공지사항
							<img id="partner_myrotice_open"  src="resources\images\Edit_pen_light.png" alt="pen">
						</div>
						${rdto.notice }
					</div>
				</c:when>
			 <c:otherwise>
			 	<div id="partner_infoBox_rotice">
						<div>
							공지사항
							<img id="partner_myrotice_open"  src="resources\images\Edit_pen_light.png" alt="pen">
						</div>
						당일 예약 가능합니다 :) 
					</div>
				</c:otherwise>
			</c:choose>
			</div>
        <div class="myPage_content">
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
        <div class="bannerBox">
            Banner
        </div>
    </div>
    
</div>


<div id="overlay"></div>
<div id="myPartner_rotice">
	<form class="myPartner_rotice_form" action="updateNotice" method="post">
		공지사항 등록
		<div class="myPartner_rotice_info">
			<img src="resources\images\Info_alt_red.png" alt="info_red">
			공지사항이 이미 등록되어있는 경우에서 추가로 등록하실 경우 기존의 공지사항은 삭제됩니다.
		</div>
		<div class="myPartner_rotice_text">
			공지사항
			<textarea id="notice" name="notice" placeholder="공지사항을 입력해주세요"></textarea>
		</div>
		<div class="myPartner_rotice_btnBox">
			<button id="myPartner_rotice_close" class="myPartner_rotice_cancel">취소</button>
			<button type="submit" class="myPartner_rotice_submit">등록하기</button>
		</div>
		<input type="hidden" name="id" id="id" value="${rdto.id }" />
	</form>
</div>