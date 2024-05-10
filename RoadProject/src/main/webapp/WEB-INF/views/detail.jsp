<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="resources/js/jquery-ui-1.13.2/jquery-ui.css">
<link rel="stylesheet" href="resources/css/style.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-ui-1.13.2/jquery-ui.min.js"></script>
<script src="resources/js/jquery-ui-1.13.2/jquery-ui.js"></script>
<script src="resources/js/datepicker-ko.js"></script>
<script src="resources/js/script.js"></script>  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div>
  <h2>Content</h2>      
</div>
   

                 <%
                 	String nick = (String) session.getAttribute("nickname");
                 	
                 
                 	if(nick != null){
                 		
                 %>
                 
                 <%=nick %>님 환영합니다.
                 <a href="/roadproject/logout">로그아웃</a>
                 
                 <%
                 	}
                 	else{
                 %>
                 <div class="login_box_st">
                 <form name="loginForm" action="/roadproject/searchMember" class="loginform" id="loginform" method="post">
                        <input type="text" class="form-control userid mb-3" id="uid"
                              placeholder="아이디를 입력하세요." name="userid"/>
                        <input type="password" class="form-control userpass mb-3" id="upass"
                              placeholder="비밀번호를 입력해 주세요." name="password" />        
                        <button type="submit" id ="login_btn" class="btn btn-outline-secondary btn-block">로그인</button>                     
                        <a href="/roadproject/SelectJoin">회원가입</a>
                        <div class="remem text-right mr-4 font-weight-400">
                           <label> 아이디 기억 <input type="checkbox" name="rid" value="rid" id="rid"></label>
                        </div>
                     </form>
                 </div>
                 <%
                 	}
                 %>