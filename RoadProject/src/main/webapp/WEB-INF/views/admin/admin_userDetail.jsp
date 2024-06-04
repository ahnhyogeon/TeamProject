<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="containerA">
    <div class="aside">
        <div class="aside_content">
            <div class="aside_content_main">
                <div id="admin_review_btn" class="aside_content_sub">
                    <img class="activeIcon"  src="../resources/images/Edit_light.png" alt="edit_light">
                    리뷰 관리
                </div>
                <div id="admin_keyword_btn" class="aside_content_sub">
                    <img class="activeIcon" src="../resources/images/Chat_alt_add_light.png" alt="edit_light">
                    키워드 관리
                </div>
                <div class="user_management" >
                <div class="aside_content_sub active3" id="userManagementToggle">
                    <img class="activeIcon"  src="../resources/images/User_alt_red.png" alt="edit_light">
                    사용자 관리
                    <img id="toggleIcon" src="../resources/images/Expand_up_red.png" alt="expand_down">
                </div>
                <div class="user_management_sub">
                    <div id="admin_user_sub_btn" class="user_management_sub2 active3">
                        <img class="activeIcon"  src="../resources/images/Group_red.png" alt="group">
                        사용자 관리
                    </div>
                    <div id="admin_user_decl_btn" class="user_management_sub2">
                        <img class="activeIcon"  src="../resources/images/Remove_light.png" alt="remonve">
                        신고 관리
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    <div class="seperator"></div>
    </div>
    <div class="rowside">
        <div class="rowside_review">
            <div class="rowside_review_title">
                사용자 상세
            </div>
            <div class="rowside_review_content">
                <label>타입 :</label>
                <div>일반 회원</div>
            </div>
            <div class="rowside_review_content">
                <label>아이디 :</label>
                <div>{아이디}</div>
            </div>
            <div class="rowside_review_content">
                <label>닉네임 :</label>
                <div>{닉네임}</div>
            </div>
            <div class="rowside_review_content">
                <label>전화번호 :</label>
                <div>010 1234 1234</div>
            </div>
            <div class="rowside_review_content">
                <label>활성화 여부 :</label>
                <div>No <span>(신고를 받은적이 있습니다.)</span></div>
            </div>
            <div class="rowside_review_content">
                <label>가입일 :</label>
                <div>2024.01.01</div>
            </div>
            <div class="rowside_review_content">
                <label>작성한 리뷰 수 :</label>
                <div>100개</div>
            </div>
            <div class="rowside_review_delete">
                <button id="admin_user_decl" class="rowside_review_deletebtn">제제하기</button>
            </div>
        </div>
        <div class="rowside_review_back">
            <button id="rowside_user_backbtn" class="rowside_backbtn">
                <img src="../resources/images/ICON.png" alt="leftarrow_red">
                뒤로가기
            </button>
        </div>    
    </div>
</div>