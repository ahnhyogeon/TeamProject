<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="containerA">
    <div class="aside">
        <div class="aside_content">
            <<div class="aside_content_main">
                <div id="admin_review_btn" class="aside_content_sub">
                    <img class="activeIcon"  src="../resources/images/Edit_light.png" alt="edit_light">
                    리뷰 관리
                </div>
                <div id="admin_keyword_btn" class="aside_content_sub active3">
                    <img class="activeIcon" src="../resources/images/Chat_alt_add_red.png" alt="edit_light">
                    키워드 관리
                </div>
                <div class="user_management" >
                <div class="aside_content_sub" id="userManagementToggle">
                    <img class="activeIcon"  src="../resources/images/User_alt_light.png" alt="edit_light">
                    사용자 관리
                    <img id="toggleIcon" src="../resources/images/Expand_down_light.png" alt="expand_down">
                </div>
                <div class="user_management_sub" style="display: none;">
                    <div id="admin_user_sub_btn" class="user_management_sub2">
                        <img class="activeIcon"  src="../resources/images/Group_light.png" alt="group">
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
                키워드 상세
            </div>
            <div class="rowside_review_content">
                <label>키워드 :</label>
                <div>{키워드}</div>
            </div>
            <div class="rowside_review_content">
                <label>등록일 :</label>
                <div>{2024/06/04}</div>
            </div>
            <div class="rowside_review_content">
                <label>최근 수정일 :</label>
                <div>{2024/06/04}</div>
            </div>
            <div class="rowside_review_delete">
                <button class="rowside_review_deletebtn">삭제하기</button>
                <button class="rowside_review_editbtn">수정하기</button>
            </div>
        </div>
        <div class="rowside_review_back">
            <button id="rowside_keyword_backbtn" class="rowside_backbtn">
                <img src="../resources/images/ICON.png" alt="leftarrow_red">
                뒤로가기
            </button>
        </div>    
    </div>
</div>