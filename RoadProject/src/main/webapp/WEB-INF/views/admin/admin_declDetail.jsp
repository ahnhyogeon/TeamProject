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
                    <div id="admin_user_sub_btn" class="user_management_sub2">
                        <img class="activeIcon"  src="../resources/images/Group_light.png" alt="group">
                        사용자 관리
                    </div>
                    <div id="admin_user_decl_btn" class="user_management_sub2 active3">
                        <img class="activeIcon"  src="../resources/images/Remove_red.png" alt="remonve">
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
                신고 상세
            </div>
            <div class="rowside_review_content">
                <label>신고자 아이디 :</label>
                <div>{아이디}</div>
            </div>
            <div class="rowside_review_content">
                <label>신고 당한 아이디 :</label>
                <div>{아이디}</div>
            </div>
            <div class="rowside_review_content">
                <label>신고 사유 :</label>
                <div>욕설/부적절한 언어 사용</div>
            </div>
            <div class="rowside_review_content">
                <label>활성화 여부 :</label>
                <div>No</div>
            </div>
            <div class="rowside_review_content">
                <label>가입일 :</label>
                <div>2024.01.01</div>
            </div>
            <div class="rowside_review_delete">
                <button id="admin_user_decl" class="rowside_review_deletebtn">제제하기</button>
            </div>
        </div>
        <div class="rowside_review_back">
            <button id="admin_user_decl_btn2" class="rowside_backbtn">
                <img src="../resources/images/ICON.png" alt="leftarrow_red"> 
                뒤로가기
            </button>
        </div>    
    </div>
</div>