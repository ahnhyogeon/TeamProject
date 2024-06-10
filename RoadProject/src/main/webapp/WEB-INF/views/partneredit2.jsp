<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<% %>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/joinedit.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="resources/js/jquery.min.js"></script>      
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>  
<script src="resources/js/script.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


   <script>
   $(function(){
	    $("#fileInput").change(function(){
	        const files = $(this)[0].files;
	        if (files.length > 0) {
	            sendData(files[0]);
	        }
	    });
	   
	    function sendData(file) {
	        const imnum = $("#imnum").val();
	        const data = new FormData();
	        data.append("file", file);
	        data.append("imnum", imnum);
	        $.ajax({
	            url: "upload",
	            type: "post",
	            data: data,
	            contentType: false,
	            processData: false,
	            success: function(data) {
	                // 서버에서 받은 JSON 데이터를 파싱합니다.
	                const dt = JSON.parse(data);
	                // 이미지의 URL을 사용하여 이미지를 표시합니다.
	                const imageUrl =  dt.url;
	                const imageDiv = $('<div><img src="' + imageUrl + '"></div>');
	                $("#imagePreview").append(imageDiv);
	            },
	            error: function(jqXHR, textStatus, errorThrown){
	                console.error(textStatus + ", " + errorThrown);
	            }
	        });
	    }
	});
   </script> 

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
                <div id="partner_tab_1">
                    <label>기본 정보</label>
                </div>
                <div id="partner_tab_2" class="partner_active">
                    <label>부가 정보</label>
                </div>
            </div>
        </div>
    </div>
       	
    <div class="joinedit_mainbox2">
    <div class="joinedit_edit">
        <c:choose>
            <c:when test="${{not empty rdto.r_url and not empty rdto.r_intro and not empty rdto.r_time and not empty rdto.imnum}">
                <form id="editForm" method="post">
                    <div id="partner_file_up" class="edit_id edit_div">
                        <label class="edit_nick_title">가게 이미지/영상<span>*</span></label>
                        <label class="file-input-container partner_menu_btn text-center">
                            <input type="file" id="fileInput" multiple>
                            파일 선택 <!-- 파일 선택 옆에 표시할 텍스트 -->
                        </label>
                        <label><span>*</span> 최대 5개 업로드 가능합니다. 파일 용량은 ~ jpg,png,mp4 포멧만 지원합니다.</label>
                        <div class="image-container" id="imagePreview"></div>
                    </div>
                    <div class="edit_id edit_div">
                        <label class="edit_nick_title">소개<span>*</span></label>
                        <input type="text" class="edit_id_input" name="r_intro" id="r_intro" value="${rdto.r_intro}">
                    </div>
                    <div class="edit_nick edit_div">
                        <label class="edit_nick_title">운영시간<span>*</span></label>
                        <div>
                            <textarea id="partner_textarea" name="r_time">${rdto.r_time}</textarea>
                        </div>
                    </div>
                    <div class="edit_pass edit_div">
                        <label class="edit_addr_title">메뉴<span>*</span></label>
                        <button class="partner_menu_btn">메뉴 수정하기</button>
                    </div>
                    <div class="edit_addr2 edit_div">
                        <label class="edit_addr_title">사이트<span>*</span></label>
                        <input type="text" class="edit_addr2_input" name="r_url" id="r_url" value="${rdto.r_url}">
                    </div>
                    <div class="row">
                        <button type="submit" id="edit_save_btn" class="edit_save" formaction="register">저장하기</button>
                        <button type="submit" data-id="${rdto.id}" data-business="${sessionScope.buisness}"
                            id="edit_update_btn" class="edit_save" formaction="resteditok">수정하기</button>
                    </div>
                    <input type="hidden" name="imnum" id="imnum" value="${imnum}" />
                    <input type="hidden" name="business" id="business" value="${sessionScope.buisness}" />
                </form>
            </c:when>
            <c:otherwise>
                <form id="editForm" method="post">
                    <div id="partner_file_up" class="edit_id edit_div">
                        <label class="edit_nick_title">가게 이미지/영상<span>*</span></label>
                        <label class="file-input-container partner_menu_btn text-center">
                            <input type="file" id="fileInput" multiple>
                            파일 선택 <!-- 파일 선택 옆에 표시할 텍스트 -->
                        </label>
                        <label><span>*</span> 최대 5개 업로드 가능합니다. 파일 용량은 ~ jpg,png,mp4 포멧만 지원합니다.</label>
                        <div class="image-container" id="imagePreview"></div>
                    </div>
                    <div class="edit_id edit_div">
                        <label class="edit_nick_title">소개<span>*</span></label>
                        <input type="text" class="edit_id_input" name="r_intro" id="r_intro"
                            placeholder="ex) 저희 가게는 이런 가게 입니다 :) 잘 부탁드립니다!">
                    </div>
                    <div class="edit_nick edit_div">
                        <label class="edit_nick_title">운영시간<span>*</span></label>
                        <div>
                            <textarea id="partner_textarea" name="r_time" placeholder="ex) 매일 10:00 ~ 24:00"></textarea>
                        </div>
                    </div>
                    <div class="edit_pass edit_div">
                        <label class="edit_addr_title">메뉴<span>*</span></label>
                        <button class="partner_menu_btn">메뉴 수정하기</button>
                    </div>
                    <div class="edit_addr2 edit_div">
                        <label class="edit_addr_title">사이트<span>*</span></label>
                        <input type="text" class="edit_addr2_input" name="r_url" id="r_url" placeholder="가게 도메인">
                    </div>
                    <div class="row">
                        <button type="submit" id="edit_save_btn" class="edit_save" formaction="register">저장하기</button>
                        <button type="submit" data-id="${rdto.id}" data-business="<%=session.getAttribute("buisness") %>"
                            id="edit_update_btn" class="edit_save" formaction="resteditok">수정하기</button>
                    </div>
                    <input type="hidden" name="imnum" id="imnum" value="${imnum}" />
                    <input type="hidden" name="business" id="business" value="<%=session.getAttribute("buisness") %>" />
                </form>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="edit_out">
        <a href="joinDelete.html">회원탈퇴</a>
    </div>
</div>
</div>
    
