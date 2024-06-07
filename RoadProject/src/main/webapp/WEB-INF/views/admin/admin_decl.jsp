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
        <div class="row_main1">
        <form id="reviewSearchForm">
            <div class="row_main1_sub">
                <div class="row_main1_sub_title">
                    신고 관리
                </div>
                <div class="row_main1_sub_sub1">
                    <div class="row_main1_sub_inputBox row_main1_sub_inputBox2">
                        <label>신고자 아이디</label>
                        <input type="text" placeholder="신고자 아이디 입력">
                    </div>
                    <div class="row_main1_sub_inputBox row_main1_sub_inputBox2">
                        <label>신고일</label>
                        <input type="text" placeholder="YYYY/MM/DD - YYYY/MM/DD">
                    </div>
                </div>
                <div class="row_main1_sub_sub2">
                    <button type="reset" id="reset-btn" class="btn">검색 초기화</button>
                    <button type="submit" class="btn btn-danger">검색</button>
                </div>  
            </div>
        </form>
        </div>
        <div class="row_main2">
            <div class="row_main2_sub">
                <div class="row_main2_sub_title">
                    리뷰 리스트
                </div>
                <div class="row_main2_sub_tableBox">
                    <table class="row_main2_sub_table">
						<colgroup>
    						<col style="width: 6.45%;">
    						<col style="width: 26.45%;">
    						<col style="width: 26.45%;">
    						<col style="width: 26.45%;">
    						<col style="width: 6.45%;">
    						<col style="width: 7.74%;">
						</colgroup>
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>신고자 아이디</th>
                                <th>신고 당한 아이디</th>
                                <th>신고 사유</th>
                                <th>처리 여부</th>
                                <th>신고일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{num}</td>
                                <td><a href="admin_declDetail">{아이디}</a></td>
                                <td>{아이디}</td>
                                <td>욕설/부적절 언어 사용</td>
                                <td><span  class="admin_user_activate1">N</span></td>
                                <td>2024.06.04</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row_main2_pagingbox">
                <span></span>
                <div class="row_main2_paging">
                    <div class="row_main2_paging_text">
                        <div>
                            총 X건 중 1 - 10건 표시
                        </div>
                    </div>
                    <div class="row_main2_paging_page">
                        <div class="paging_page_nav">
                            <img src="../resources/images/angle-left.png" alt="leftarrow">
                        </div>
                        <div class="paging_page_nav">
                            <img src="../resources/images/angle-double-left.png" alt="leftdouble">
                        </div>
                        <div class="paging_page_num paging_active">
                            1
                        </div>
                        <div class="paging_page_num">
                            2
                        </div>
                        <div class="paging_page_nav">
                            <img src="../resources/images/angle-right-bold.png" alt="rightarrow">
                        </div>
                        <div class="paging_page_nav">
                            <img src="../resources/images/angle-double-right-bold.png" alt="rightdouble">
                        </div>
                    </div>
                    <div class="row_main2_paging_drop">
                        <div>
                            <div class="row_main2_paging_drop_num">
                                10
                            </div>
                            <div class="row_main2_paging_drop_button">
                                <div>
                                    <img src="../resources/images/chevron-down.png" alt="downbutton">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <span></span>
            </div>
        </div>
	</div>
</div>