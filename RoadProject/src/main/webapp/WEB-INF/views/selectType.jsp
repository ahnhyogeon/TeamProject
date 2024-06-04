<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/selectType.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="resources/js/jquery.min.js"></script>        
<script src="resources/js/script.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div id="container">

        <div class="step">
        <p>회원가입</p>
            <div class="step-indicator">
                <div class="step-item active">유형 선택</div>
                <div class="step-item">정보 입력</div>
                <div class="step-item">가입 완료</div>
            </div>
        </div>
        	<form id="joinForm" method="post"> 
            <div class="typeSelect">
                <button id="common" class="btn">
                    <img src="resources/images/icons _ emoji/Winking Face.png" alt="winking face">
                    <p>개인회원</p>
                    <p>만 14세 미만인 경우 가입이 제한됩니다.</p>
                </button>
                <button id="partner" class="btn">
                    <img src="resources/images/icons _ emoji/Camping.png" alt="Camping">
                    <p>파트너회원</p>
                    <p>사업자 인증을 진행합니다.</p>
                </button>
            </div>
           	<div class="checkBox">
            <div class="okBox">
                <input type="checkbox" id="checkAll">
                <label>전체 동의 합니다.</label>
            </div>
                <div class="checkform" >
                    <input type="checkbox" class="check">
                    <label><span>[필수]</span> 회원 약관 동의</label>
                    <div class="showdetail">
                        <a href="#">[전문 보기]</a>
                    </div>
                </div>
                <div class="checkform">
                    <input type="checkbox" class="check">
                    <label><span>[필수]</span> 개인정보 수집 및 이용에 대한 안내 동의</label>
                    <div class="showdetail">
                        <a href="#">[전문 보기]</a>
                    </div>
                </div>
                <div class="checkform">
                    <input type="checkbox" class="check">
                    <label><span>[필수]</span> 위치 정보 제공 동의</label>
                    <div class="showdetail">
                        <a href="#">[전문 보기]</a>
                    </div>
                </div>
                </div>
            <div id="secondaryBox">
                <button type="submit" id="nextbtn" class="btn btn-secondary">다음으로</button>
            </div>
         </form>
    </div>