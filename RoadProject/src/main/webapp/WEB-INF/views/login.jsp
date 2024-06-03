<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/login.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="resources/js/jquery.min.js"></script>        
<script src="resources/js/script.js"></script>
<div id="container">
        <p>통합 로그인</p>
        <div class="login">
            <form id="loginForm" action="searchMember" method="post">
                <div class="inpform">
                <div class="idBox">
                    <label>아이디</label>
                    <input type="text" name="userid" id="userid" placeholder="아이디">
                </div>
                <div class="passBox">
                    <label>비밀번호</label>
                    <input type="password" name="password" id="userpass" placeholder="비밀번호">
                </div>
                </div>
            
            <div class="another">
                <div class="saveidbox">
                    <input type="checkbox" name="save" id="saveid">
                    <label>아이디 저장하기</label>
                </div>
                <span></span>
                <div class="searchBox">
                    <li>
                    <a href="#">아이디찾기</a>
                    </li>
                    <li class="pli"><a class="pa" href="#">비밀번호찾기</a></li>
                </div> 
            </div>
            
            <button type="submit" class="btn btn-danger">로그인</button>
            
            </form>
            <div class="ezloginbox">
            <div class="ezlogin">간편로그인</div>
            <div class="selectlogin">
                <div class="brand">
                <img class="kakao" src="resources/images/icons/kakao.png" alt="kakao"><a href="#" class="kakaohre">카카오톡으로 로그인</a>
                </div>
                <div class="brand">
                <img class="naver" src="resources/images/icons/naver.png" alt="naver"><a href="#" class="navhre">네이버로 로그인</a>
                </div>
                <div class="brand">
                <img class="google" src="resources/images/icons/google.png" alt="google"><a href="#" calss="googlehre">구글로 로그인</a>
                </div>
            </div> 
        </div>  
    </div>
        <div class="joinBox">
            아직 비회원이신가요? 가입하고 많은 서비스를 이용해보세요!&nbsp;&nbsp;<a href="selectType.html">회원가입 바로가기</a>
        </div>
        <div class="bannerBox">
            Banner
        </div>
    </div>