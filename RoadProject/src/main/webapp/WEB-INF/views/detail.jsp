<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
  <h2>Content</h2>      
</div>      

                 <%
                 	String nick = (String) session.getAttribute("nickname");
                 
                 	if(nick != null){
                 		
                 %>
                 
                 <%=nick %>님 환영합니다.
                 
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
                        <a href="/roadproject/content3">회원가입</a>
                        <div class="remem text-right mr-4 font-weight-400">
                           <label> 아이디 기억 <input type="checkbox" name="rid" value="rid" id="rid"></label>
                        </div>
                     </form>
                 </div>
                 <%
                 	}
                 %>