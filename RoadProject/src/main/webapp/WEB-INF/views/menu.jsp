<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="resources/css/style2.css">
<link rel="stylesheet" href="resources/css/menu.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
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
	            url: "mupload",
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
	    }  //메뉴 파일,이미지 업로드 끝
	    
	    //토글버튼 db에 0,1 입력하기
	    $('.toggle-input').change(function () {
            var visible = $(this).is(':checked') ? 1 : 0;
            var menuId = $(this).data('id');

            $.ajax({
                url: 'updateVisibility',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ id: menuId, visible: visible }),
                success: function (data) {
                    console.log('Success:', data);
                },
                error: function (error) {
                    console.error('Error:', error);
                }
            });
        });
	});
   </script> 
 
  <div class="menu-container">
  	<div class="menu-box">
  		<div class="menu-update-box">
  			<p class="menu-update">메뉴 수정</p>
  		</div>

  </div>  
</div>
  	
    <div class="menu_edit">       
                <form id="menuForm" method="post">
                    <div id="menu_file_up" class="menu_id menu_div">
                        <label class="menu_nick_title">메뉴판이미지<span>*</span></label>
                        <label class="file-input-container menu_menu_btn text-center">
                            <input type="file" id="fileInput" multiple>
                            파일 선택 <!-- 파일 선택 옆에 표시할 텍스트 -->
                        </label>
                        <label><span>*</span> 최대 5개 업로드 가능합니다. 파일 용량은 ~ jpg,png,mp4 포멧만 지원합니다.</label>
                        <div class="image-container" id="imagePreview"></div>
                    </div>
                    <div class="menu-title">
                        <label class="menu_nick_title">메뉴<span class="span-color">*</span></label>
                        <div class="menu_add_btn_box">
                        <div id="menu_add_btn" class="menu_add"><span class="menu_add_btn">메뉴추가</span></div>
                        </div>
                    </div> 
                   
                    <div class="row_main2_sub_tableBox">
                      <table class="row_main2_sub_table">
                        <colgroup>
                            <col style="width: 7.3%">
                            <col style="width: 10.1%">
                            <col style="width: 43%">
                            <col style="width: 12.5%">
                            <col style="width: 12.5%">
                            <col style="width: 8.3%">
                            <col style="width: 5.8%">
                          </colgroup>
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>썸네일</th>
                                <th class="boxth">
                                    메뉴명
                                 
                                        <a class="menu_asc"><img src="resources/images/arrow_upward.png" alt="uparrow"></a>
                                         <a class="menu_desc"><img src="resources/images/arrow_downward.png" alt="downarrow"></a>
                            
                                </th>
                                 <th class="boxth">
                                    가격
                              
                                         <a class="menu_cost_asc"><img src="resources/images/arrow_upward.png" alt="uparrow"></a>
                             			 <a class="menu__cost_desc"><img src="resources/images/arrow_downward.png" alt="downarrow"></a>
                                </th>
                                <th>등록일</th>
                                <th>노출여부</th>
                                <th>수정</th>
                              
                            </tr>
                        </thead>
                        <tbody>
                         <c:forEach var="m_list" items="${m_list }">
                            <tr>
                                <td>${m_list.id }</td>
                                <td>썸네일</td>
                                <td>${m_list.m_name }</td>
                                <td>${m_list.m_cost }</td>
                                 <td class="text-center"><fmt:formatDate value="${m_list.wdate}" pattern="yyyy/MM/dd"/></td>              
                                <td>
                                	<label class="toggle-button">
                                        <input type="checkbox" data-id="${m_list.id}" class="toggle-input" ${m_list.visible == 1 ? 'checked' : ''}>
                                        <span class="slider round"></span>
                                    </label>
                                </td>
                                <td>
                                    <div class="row_btn_box">
                                    <div id="menu_edit_btn" class="row_edit_box">
                                        <img src="resources/images/Edit.png" alt="edit">
                                    </div>
                                    <div id="menu_del_btn" class="row_delete_box">
                                        <img src="resources/images/Delete.png" alt="delete">
                                    </div>
                                    </div>
                                </td>
                            </tr>
                          </c:forEach> 
                        </tbody>
                    </table>
                 </div>
                  <div class="row_main2_pagingbox text-center">
      
                <div class="row_main2_paging ">    
                   <div class="row_main2_paging_page">
                        <div class="paging_page_nav">
                            <a href="?cpg=1"><img src="resources/images/angle-left.png" alt="leftarrow"></a>
                        </div>
                        <div class="paging_page_nav">
                             <a href="?cpg=${pg.startPage-1 > 0? pg.startPage-1:pg.startPage }"><img src="resources/images/angle-double-left.png" alt="leftdouble"></a>
                        </div>
                         <c:forEach begin="${pg.startPage }" end="${pg.endPage }" var="i">
                        <div class="paging_page_num paging">
                             <a href="?cpg=${i }" class="${cpg==i?'active':'' }">${i}</a>
                        </div>                                    
                        </c:forEach>                  
                        <div class="paging_page_nav">
                             <a href="?cpg=${pg.endPage + 1 > pg.totalPages? pg.totalPages : pg.endPage + 1 }"><img src="resources/images/angle-right-bold.png" alt="rightarrow"></a>
                        </div>
                        <div class="paging_page_nav">
                            <a href="?cpg=${pg.totalPages }"><img src="resources/images/angle-double-right-bold.png" alt="rightdouble"></a>
                        </div>
                    </div>
                  
                   </div>
                  </div>
                   <div class="menu_div">
                        <label class="menu_nick_title">원산지 정보 관리<span>*</span></label>
                            <textarea id="menu_textarea" name="r_time" placeholder="원산지 정보 입력"></textarea>
                        </div>
                    <div class="row menu_btn_div">
                        <button type="submit" id="menu_save_btn" class="menu_save" >수정하기</button>
                        <!--  
                        <button type="submit" data-id="${rdto.id}" data-business="<%=session.getAttribute("buisness") %>"
                            id="edit_update_btn" class="edit_save" formaction="resteditok">수정하기</button>
                            -->
                    </div>
                    <input type="hidden" name="imnum" id="imnum" value="${imnum}" />
                    <input type="hidden" name="business" id="business" value="<%=session.getAttribute("buisness") %>" />
                </form>
        
    </div>
 
  

 
 
 
 
 <!-- 
            <div class="listbox">
                <h1 class="text-center mb-5">메뉴정보</h1>
                <div class="d-flex justify-content-between py-4">
                    <div>
                        <fmt:formatNumber value="${pg.totalPosts }" groupingUsed="true"/>posts /
                        <fmt:formatNumber value="${pg.totalPages }" groupingUsed="true" />pages
                        <a href="mRegister?business=${param.business }">메뉴등록</a>
                    </div>            
                </div>
                <table class="table table-hover">
                    <colgroup>
                       <col width="14%">
                       <col width="14%">
                       <col width="14%">
                       <col width="14%">
                       <col width="14%">
                       <col width="14%">   
                       <col width="14%">         
                    </colgroup>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>사업자번호</th>
                            <th>메뉴명</th>
                            <th>가격</th>
                            <th>소개글</th>
                            <th>메뉴코드</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach var="m_list" items="${m_list }">
                                                                                     
                       <tr>
                           <td class="text-center">${m_list.id }</td>
                           <td class="text-center">${m_list.business }</td>                           
                           <td class="text-center">${m_list.m_name }</td>
                           <td class="text-center">${m_list.m_cost }</td>
                           <td class="text-center">${m_list.m_intro }</td>
                           <td class="text-center">${m_list.m_code }</td>  
                            <td class="text-center"><fmt:formatDate value="${m_list.wdate}" pattern="yyyy/MM/dd"/></td>              
                       </tr>
                       </c:forEach> 
                       /loop -->
                       <!-- 
                    </tbody>
                </table>
                <div class="justify-content-between py-4">
                    <div>
                    </div>
                    
                    <ul class="paging">
                        <li>
                            <a href="?business=${param.business }&cpg=1"><i class="ri-arrow-left-double-line"></i></a>
                        </li>
                        <li>
                            <a href="?business=${param.business }&cpg=${pg.startPage-1 > 0? pg.startPage-1:pg.startPage }"><i class="ri-arrow-left-s-line"></i></a>
                        </li>
                        <c:forEach begin="${pg.startPage }" end="${pg.endPage }" var="i">
                        <li>                       
                           <a href="?business=${param.business }&cpg=${i }" class="${cpg==i?'active':'' }">${i}</a>
                        </li>
                        </c:forEach>
                        
                        <li>
                            <a href="?business=${param.business }&cpg=${pg.endPage + 1 > pg.totalPages? pg.totalPages : pg.endPage + 1 }"><i class="ri-arrow-right-s-line"></i></a>
                        </li>
                        
                        <li>
                            <a href="?business=${param.business }&cpg=${pg.totalPages }"><i class="ri-arrow-right-double-line"></i></a>
                        </li>
                    </ul>
                    
                
               </div>
                 <form name="searchform" id="searchform" class="searchform" method="get">
                   <div class="input-group my-3">
                        <div class="input-group-prepend">
                            <button type="button" 
                                    class="btn btn-outline-secondary dropdown-toggle" 
                                    data-toggle="dropdown"
                                    value="m_name">
                                메뉴명검색
                              </button>
                              <div class="dropdown-menu">
                                <a class="dropdown-item" href="m_name">메뉴명검색</a>
                                <a class="dropdown-item" href="m_cost">가격검색</a>
                            </div>
                        </div>
                       <input type="hidden" name="searchname" id="searchname" value="m_name" />
                       <input type="search" name="searchvalue" class="form-control" placeholder="검색">
                        <input type="hidden" name="business" class="form-control" value=${param.business }>
                       <div class="input-group-append">
                          <button class="btn btn-primary"><i class="ri-search-line"></i></button>
                       </div>
                   </div>
               </form>
            </div>
       
             /listbox-->
          

<!-- 메뉴페이지 팝업 -->
<div id="overlay"></div>
<div id="menu_add">
	메뉴 추가
	<div class="menu_add_formbox">
		<form class="menu_add_form" action="#" method="post">
			<div class="menu_add_form_top">
				<div class="menu_add_menu_name">
					<label>메뉴명<span>*</span></label>
					<input type="text" name="menu_add_name" placeholder="메뉴명 입력"/>
				</div>
				<div class="menu_add_menu_price">
					<label>가격(원)<span>*</span></label>
					<input type="text" name="menu_add_price" placeholder="가격 입력"/>
				</div>
			</div>
			<div class="menu_add_form_mid">
				<label>메뉴 설명</label>
				<textarea placeholder="사용자들의 이해를 돕기 위한 메뉴 설명을 입력해주세요"></textarea>
			</div>
			<div class="menu_add_bot">
				<label>썸네일</label>
				<div class="menu_add_uploadbtn">
					파일 선택
					<img src="resources\images\Upload_light.png" alt="upload">
				</div>
				<div class="menu_add_upload_info">
					<span>*</span> 최대 1개 업로드 가능합니다. 파일 용량은 ~ jpg,png 포멧만 지원합니다.
				</div>
				<div class="menu_add_upload_imgbox"></div>
			</div>
			<div class="btn_center">
				<button type="submit" class="menu_add_submit">추가하기</button>
			</div>
		</form>
	</div>
				<div id="Xbox">
			<img src="resources\images\Close_square_light.png" alt="X">
		</div>
</div>

<div id=menu_edit>
	메뉴 수정
	<div class="menu_add_formbox">
		<form class="menu_add_form" action="#" method="post">
			<div class="menu_add_form_top">
				<div class="menu_add_menu_name">
					<label>메뉴명<span>*</span></label>
					<input type="text" name="menu_add_name" value="{메뉴명}"/>
				</div>
				<div class="menu_add_menu_price">
					<label>가격(원)<span>*</span></label>
					<input type="text" name="menu_add_price" value="10000"/>
				</div>
			</div>
			<div class="menu_add_form_mid">
				<label>메뉴 설명</label>
				<textarea>메뉴 설명 입력</textarea>
			</div>
			<div class="menu_add_bot">
				<label>썸네일</label>
				<div class="menu_add_uploadbtn2">
					파일 선택
				</div>
				<div class="menu_add_upload_info">
					<span>*</span> 최대 1개 업로드 가능합니다. 파일 용량은 ~ jpg,png 포멧만 지원합니다.
				</div>
				<div class="menu_add_upload_imgbox">
					<img src="resources\images\test.jpg" alt="test">
				</div>
			</div>
			<div class="btn_center">
				<button type="submit" class="menu_add_submit">수정하기</button>
			</div>
		</form>
	</div>
		<div id="Xbox2">
			<img src="resources\images\Close_square_light.png" alt="X">
		</div>
</div>