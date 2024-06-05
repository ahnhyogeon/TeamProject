<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/follow.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="resources/js/jquery.min.js"></script>        
<script src="resources/js/script.js"></script>


<div id="containerM">
    <div class="follow_mainbox1">
        <div class="follow_inner">
            <div class="follow_inner_title">
                {닉네임}
                <div class="follow_inner_title_text">
                    {사용자}님의 팔로우 현황입니다.
                </div>
            </div>
            <div class="follow_inner_tab">
                <div id="follow_tab" class="active">
                    <label>팔로워</label>
                    <span>0</span>
                </div>
                <div id="following_tab">
                    <label>팔로잉</label>
                    <span>0</span>
                </div>
            </div>
        </div>
    </div>
    <div class="follow_mainbox2">
        <div class="follow_content">
                <div>
                    <img src="images/icons _ emoji/Candle.png" alt="Candle">
                </div>
                <div class="follow_content_text">
                    아직 팔로워가 없습니다.<br>
                    리뷰를 작성하여 더 많은 사용자들을 만나보세요.
                </div>
                <button id="follow_content_btn" class="btn">리뷰 쓰러가기</button>
        </div>
    </div>
    
</div>