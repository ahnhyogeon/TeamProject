<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

 <link rel="stylesheet" href="resources/css/style.css">
  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/summernote-bs4.js"></script>
   <script src="resources/js/lang/summernote-ko-KR.min.js"></script> 
  
   <script>
   $(function(){
	   $("#r_intro").summernote({
	       placeholder: "내용을 입력하세요.",
	       tabsize: 2,
	       height:300,
	       lang: 'ko-KR',
	       callbacks: {
	         onImageUpload: function(files){
	            sendData(files[0]);
	         },
	         onMediaDelete: function(files){
	            delData(files[0]);
	         }   
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
	         success: function( data ) {
	            const dt = JSON.parse(data);
	            $("#r_intro").summernote("insertImage", dt.url);
	           // $("#imnum").val(data.imnum);
	         },
	         error: function(jqXHR, textStatus, errorThrown){
	            console.error(textStatus + ", " + errorThrown);
	         }
	      
	      });
	   }
	   
	   /*
	   function delData(file) {
	      const fileUrl = file.src; //delete 될 image 의 url
	      console.log(fileUrl);
	      
	      $.ajax({
	         url: 'delete',
	         type: 'post',
	         data: { "fileUrl" : fileUrl },
	         
	         success: function(data) {
	           if( data ){
	        	  const dt = JSON.parse(data);
		          $("#r_intro").summernote("deleteImage", dt.url);
	             console.log("파일삭제");
	           }else{
	             console.log("파일삭제 실패");
	           } 
	         },
	         error: function(jqXHR, textStatus, errorThrown){
	           console.log("삭제실패");   
	         }
	      });
	   }
	   */
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
                  
                  <div class="col-12">
                     <textarea name="r_intro" id="r_intro" class="form-control"></textarea>
                  </div>
                  <!-- /게스트일때 적용-->
                  <div class="col-12 text-center my-5">
                     <a href="list" class="btn btn-danger px-5 mx-2">취소</a>
                     <button class="btn btn-primary px-5 mx-2" type="submit">등록</button>
                  </div>
                  <input type="hidden" name="imnum" id="imnum" value="${imnum }" />
                  
              </form>
           </div>
