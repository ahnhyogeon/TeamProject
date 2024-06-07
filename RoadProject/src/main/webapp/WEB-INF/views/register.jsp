<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<link rel="stylesheet" href="resources/css/style2.css">
  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/summernote-bs4.js"></script>
   <script src="resources/js/lang/summernote-ko-KR.min.js"></script> 
  
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
       <div class="container">
              <h2 class="text-center mt-4 mb-5 pb-4">가게등록</h2>
              <form name="writeform" id="writeform" class="writeform row" method="post">
                  <!-- 게스트일때 적용 -->
              
                     <div class="col-9 row form-group">
                        <label class="form-label">가게명</label>
                        <input type="text" name="r_name" id="r_name" class="form-control" placeholder="이름" />
             	      </div>
             	      
                     <div class="col-9 row form-group">
                        <label class="form-label">가게주소1</label>
                        <input type="text" name="r_addr1" id="r_addr1" class="form-control" placeholder="비밀번호" />
                     </div>
                 
                  <div class="col-9 row form-group">
                     <label class="form-label">가게주소2</label>
                     <input type="text" name="r_addr2" id="r_addr2" class="form-control" placeholder="제목" />
                  </div>
                  
                  <div class="col-9 row form-group">
                     <label class="form-label">가게번호</label>
                     <input type="text" name="r_tel" id="r_tel" class="form-control" placeholder="제목" />
                  </div>
                  
                  <div class="col-9 row form-group">
                     <label class="form-label">가게 도메인</label>
                     <input type="text" name="r_url" id="r_url" class="form-control" placeholder="제목" />
                  </div>
                
                  <div class="col-12 row form-group">
                     <label>소개글</label>
                     <textarea name="r_intro" id="r_intro" class="form-control"></textarea>
                  </div>
             
                  <div class="col-12  row form-group">
                       <label>공지사항</label>
                     <textarea name="notice" id="notice" class="form-control"></textarea>
                  </div>
                   <div class="col-12 ">
						<!-- 파일 선택(input 요소)를 감싸는 컨테이너 -->
						<label>가게 이미지/영상</label>
						<br>
						<label class="file-input-container text-center">
						    <input type="file" id="fileInput" multiple>
						    파일 선택 <!-- 파일 선택 옆에 표시할 텍스트 -->
						</label>
						<div class="image-container" id="imagePreview"></div>
                  </div>
                  <!-- /게스트일때 적용-->
                  <div class="col-12 text-center my-5">
                     <a href="list" class="btn btn-danger px-5 mx-2">취소</a>
                     <button class="btn btn-primary px-5 mx-2" type="submit">등록</button>
                  </div>
                  <input type="hidden" name="imnum" id="imnum" value="${imnum }" />
                  
              </form>
           </div>
