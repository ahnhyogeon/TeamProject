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
                        <div id="profile_follow">
                            <label>팔로워</label>
                             <span>0</span>
                        </div>
                        <img src="resources/images/Ellipse 68.png" alt="ellipse">
                        <div id="profile_following">
                            <label>팔로잉</label>
                            <span>0</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="myTabMenu">
            <div id="partner_tabMenu_home" class="subTabMenu active">홈</div>
            <div id="partner_tabMenu_review" class="subTabMenu">마이 리뷰</div>
            <div id="partner_tabMenu_res" class="subTabMenu">예약 관리</div>
            <div id="partner_tabMenu_avg" class="subTabMenu">통계 현황</div>
        </div>
    </div>
    <div class="myPage_mainbox2">
        <div class="myPage_content">
            <div class="content_title">
                <div>
                    <img src="resources/images/icons _ emoji/Black Nib.png" alt="black nib">
                </div>
                가장 인기 있는 마이 리뷰는?
                <img src="resources/images/Expand_right_light.png" alt="right">
            </div>
            <div class="content_item">
                <div>
                    <img src="resources/images/icons _ emoji/Candle.png" alt="Candle">
                </div>
                작성하신 리뷰가 아직 없습니다.
                <button>리뷰 쓰러가기</button>
            </div>
        </div>
        <div class="myPage_content">
            <div class="content_title">
                <div>
                    <img src="resources/images/icons _ emoji/Card Index Dividers.png" alt="Card Index Dividers">
                </div>
                가장 인기 있는 마이 테마는?
                <img src="resources/images/Expand_right_light.png" alt="right">
            </div>
            <div class="content_item">
                <div>
                    <img src="resources/images/icons _ emoji/Candle.png" alt="Candle">
                </div>
                생성하신 테마가 아직 없습니다.
                <button>테마 만들기</button>
            </div>
        </div>
        <div class="myPage_content">
            <div class="content_title">
                <div>
                    <img src="resources/images/icons _ emoji/Pushpin.png" alt="Pushpin">
                </div>
                최근에 내가 저장한 장소는?
                <img src="resources/images/Expand_right_light.png" alt="right">
            </div>
            <div class="content_item">
                <div>
                    <img src="resources/images/icons _ emoji/Candle.png" alt="Candle">
                </div>
                저장하신 장소가 아직 없습니다.
                <button>장소 저장하기</button>
            </div>
        </div>
        <div class="bannerBox">
            Banner
        </div>
    </div>
    
</div>