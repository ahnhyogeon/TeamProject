<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/joinDelete.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="resources/js/jquery.min.js"></script>        
<script src="resources/js/script.js"></script>

<div id="containerM">
    <div class="joindelete_mainbox1">
        <div class="joindelete_inner">
            <div class="joinedit_title">
                회원탈퇴
            </div>
        </div>
    </div>
    <div class="joindelete_mainbox2">
        <div class="joindelete_edit">
            <form action="joinDelete_success.html">
                <div class="delete_id delete_div">
                    <label class="delete_id_title">아이디</label>
                    <input type="text" class="delete_id_input" value="uesr1234" disabled>
                </div>
                <div class="delete_pass delete_div">
                    <label class="delete_pass_title">비밀번호<span>*</span></label>
                    <input type="password" class="delete_pass_input" name="delete_pass">
                </div>
                <div class="delete_pass delete_div">
                    <label class="delete_pass_title">비밀번호 확인<span>*</span></label>
                    <input type="password" class="delete_pass_input" name="delete_repass">
                </div>
                <div class="delete_text">
                    - 탈퇴시, 사용하시던 쿠폰 및 기타 혜택은 복원 할 수 없습니다.<br>
                    - 진행중인 주문 또는 이용중인 서비스가 있을 경우 탈퇴가 불가 합니다.<br>
                    - 탈퇴 즉시 개인정보가 삭제되면, 어떠한 방법으로도 복원할 수 없습니다.<br> 
                    (전자상거래 서비스 등의 거래내역은 전자상거래등에서의 소비자보호에 관한 법률에 의거하여 보호 됩니다.) 

                </div>
                <div class="delete_btnbox">
                   <button type="submit" id="delete_sbtn" class="btn btn-light">탈퇴하기</button> 
                   <button type="reset" id="delete_rbtn" class="btn btn-danger">취소하기</button>
                </div>
            </form>

        </div>
    </div>
    
</div>