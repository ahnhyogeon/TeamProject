<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/myPage.css">
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
                마이 페이지
            </div>
            <div class="myInner_profile">
                <div class="profile_picture">
                    <img src="resources/images/icons _ emoji/Winking Face.png" alt="winking">  
                </div>
                <div class="profile_info">
                    <div class="profile_title">
                        상위 10% 리뷰어
                    </div>
                    <div class="profile_name">
                        <span><%=session.getAttribute("nickname") %></span><img id="partner_edit_gear" src="resources/images/icons _ emoji/Gear.png" alt="Gear">
                    </div>
                    <div class="profile_count">
                        <div>
                            <label>마이 리뷰</label>
                            <span>0</span>
                        </div>
                        <img src="resources/images/Ellipse 68.png" alt="ellipse">
                        <div>
                            <label>팔로워</label>
                             <span>0</span>
                        </div>
                        <img src="resources/images/Ellipse 68.png" alt="ellipse">
                        <div>
                            <label>팔로잉</label>
                            <span>0</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="myTabMenu">
            <div id="partner_tabMenu_home" class="subTabMenu">홈</div>
            <div id="partner_tabMenu_review" class="subTabMenu active">마이 리뷰</div>
            <div id="partner_tabMenu_res" class="subTabMenu">예약 관리</div>
            <div id="partner_tabMenu_avg" class="subTabMenu">통계 현황</div>
        </div>
    </div>
    <div class="myPage_mainbox3">
        <div class="reviewInner">
        <div class="review_title">
            <div class="review_title_count">
                총<span>0</span>개
            </div>
            <div class="review_title_filter">
                <a href="#">등록순</a>
                <img src="resources/images/Ellipse 68.png" alt="ellipse">
                <a href="#">조회수순</a>
            </div>
        </div>
        <div class="review_tab">
            <button class="review_tab_btn">
                전체<span>0</span>
            </button>
            <button class="review_tab_btn">
                음식점<span>0</span>
            </button>
            <button class="review_tab_btn">
                취미<span>0</span>
            </button>
        </div>
        <div class="review_contents">
            <div class="review_contents_item">
                <div>
                    <img src="#" alt="blank">
                </div>
                <div class="review_contents_item_title">
                    작성하신 리뷰가 없습니다.
                </div>
            </div>
            
        </div>
        <button class="review_contents_btn">
            더보기
            <img src="resources/images/Expand_down_light.png" alt="Expand_down_light">
        </button>
        <div class="bannerBox">
            Banner
        </div>
    </div>
    </div>
</div>