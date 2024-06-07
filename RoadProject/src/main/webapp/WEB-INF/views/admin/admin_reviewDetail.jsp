<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="containerA">
    <div class="aside">
        <div class="aside_content">
            <div class="aside_content_main">
                <div id="admin_review_btn" class="aside_content_sub active3">
                    <img class="activeIcon"  src="../resources/images/Edit_red.png" alt="edit_light">
                    리뷰 관리
                </div>
                <div id="admin_keyword_btn" class="aside_content_sub">
                    <img class="activeIcon" src="../resources/images/Chat_alt_add_light.png" alt="edit_light">
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
                리뷰 상세
            </div>
            <div class="rowside_review_content">
                <label>상호명 :</label>
                <div>{상호명}</div>
            </div>
            <div class="rowside_review_content">
                <label>아이디 :</label>
                <div>{아이디}</div>
            </div>
            <div class="rowside_review_content">
                <label>등록일 :</label>
                <div>{2024/06/04}</div>
            </div>
            <div class="rowside_review_content">
                <label>최근 수정일 :</label>
                <div>{2024/06/04}</div>
            </div>
            <div class="rowside_review_content">
                <label>리뷰내용 :</label>
                <div>너무 맛있네요! 다른 사람들에게도 추천하고 싶네요.</div>
            </div>
            <div id="rowside_review_img" class="rowside_review_content">
                <label>이미지 :</label>
                <div>
                    <img src="#" alt="#">
                    <img src="#" alt="#">
                </div>
            </div>
            <div class="rowside_review_content">
                <label>사장님의 한마디 :</label>
                <div>{닉네임}님 방문해주셔서 감사합니다 :)</div>
            </div>
            <div class="rowside_review_delete">
                <button class="rowside_review_deletebtn">삭제하기</button>
            </div>
        </div>
        <div class="rowside_review_back">
            <button id="rowside_review_backbtn" class="rowside_backbtn">
                <img src="../resources/images/ICON.png" alt="leftarrow_red">
                뒤로가기
            </button>
        </div>    
    </div>
</div>