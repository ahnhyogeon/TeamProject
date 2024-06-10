<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/joinedit.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="resources/js/jquery.min.js"></script>        
<script src="resources/js/script.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div id="containerM">
    <div class="joinedit_mainbox1">
        <div id="partneredit_inner" class="joinedit_inner">
            <div class="joinedit_title">
                스페이스 정보 수정
            </div>
            <div class="joinedit_profile">
            	<div class="partneredit_profile_text">
            		대표이미지 설정
            		<span>*</span>
            	</div>
                <div class="partner_edit_profile_picture"> 
                    <img src="resources/images/partner_user.png" alt="user">  
                </div> 
                <div class="joinedit_profile_btnbox">
                    <button class="btn">사진 삭제</button>
                    <button class="btn btn-danger partner_picture_input">사진 등록</button>
                </div>
            </div>
            <div class="partnerdeit_inner_tab">
                <div id="partner_tab_1" class="partner_active">
                    <label>기본 정보</label>
                </div>
                <div id="partner_tab_2">
                    <label>부가 정보</label>
                </div>
            </div>
        </div>
    </div>
    <div class="joinedit_mainbox2">
        <div class="joinedit_edit">
            <form method="post">
                <div class="edit_id edit_div">
                    <label class="edit_id_title">아이디</label>
                    <input type="text" class="edit_id_input" value="<%=session.getAttribute("userid") %>" disabled>
                </div>
                <div class="edit_id edit_div">
                    <label class="edit_id_title">상호명</label>
                    <input type="text" class="edit_id_input" value="<%=session.getAttribute("userid") %>" disabled>
                </div>
                <div class="edit_nick edit_div">
                    <label class="edit_nick_title">스페이스 유형 설정<span>*</span></label>
                    <div>
                        <input type="text" class="edit_nick_input" value="<%=session.getAttribute("nickname") %>">
                    </div>
                </div>
                <div class="edit_pass edit_div">
                    <label class="edit_pass_title">비밀번호</label>
                    <button class="edit_pass_btn">비밀번호변경</button>
                </div>
                <div class="edit_addr edit_div">
                    <label class="edit_addr_title">주소<span>*</span></label>
                    <div>
                        <input type="text" class="edit_addr1_input" value="{주소1}">
                        <button class="edit_addr_btn btn btn btn-danger">주소검색</button>
                    </div>
                    <input type="text" class="edit_addr2_input" value="{주소2}">
                </div>
                <div class="edit_addr2 edit_div">
                    <label class="edit_addr_title">전화번호<span></span></label>
                    <input type="text" class="edit_addr2_input" value="<%=session.getAttribute("tel") %>">
                </div>
                <button type="submit" id="edit_save_btn" class="edit_save">저장하기</button>
                 <input type="hidden" name="business" id="business" value="<%=session.getAttribute("buisness") %>" />
            </form>
        </div>
        <div class="edit_out">
            <a href="joinDelete.html">회원탈퇴</a>
        </div>
    </div>
    
</div>