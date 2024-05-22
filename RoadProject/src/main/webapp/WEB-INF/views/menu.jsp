<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="resources/css/style.css">
  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/script.js"></script>
  
            <div class="listbox">
                <h1 class="text-center mb-5">메뉴정보</h1>
                <div class="d-flex justify-content-between py-4">
                    <div>
                        <fmt:formatNumber value="${pg.totalPosts }" groupingUsed="true"/>posts /
                        <fmt:formatNumber value="${pg.totalPages }" groupingUsed="true" />pages
                    </div>            
                </div>
                <table class="table table-hover">
                    <colgroup>
                       <col width="16%">
                       <col width="16%">
                       <col width="16%">
                       <col width="16%">
                       <col width="16%">
                       <col width="16%">            
                    </colgroup>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>사업자번호</th>
                            <th>메뉴명</th>
                            <th>가격</th>
                            <th>소개글</th>
                            <th>메뉴코드</th>                  
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach var="m_list" items="${m_list }">
                                                                                     
                       <tr>
                           <td class="text-center">${m_list.id }</td>
                           <td><a href="contents?id=${m_list.id }&cpg=${cpg}">${m_list.business }</a>                        
                           </td>                           
                           <td class="text-center">${m_list.m_name }</td>
                           <td class="text-center">${m_list.m_cost }</td>
                           <td class="text-center">${m_list.m_intro }</td>
                           <td class="text-center">${m_list.m_code }</td>  
                                      
                       </tr>
                       </c:forEach> 
                       <!-- /loop -->
                    </tbody>
                </table>
                <div class="d-flex justify-content-between py-4">
                    <div>
                    </div>
                    
                    <ul class="paging">
                        <li>
                            <a href="?cpg=1"><i class="ri-arrow-left-double-line"></i></a>
                        </li>
                        <li>
                            <a href="?cpg=${pg.startPage-1 > 0? pg.startPage-1:pg.startPage }"><i class="ri-arrow-left-s-line"></i></a>
                        </li>
                        <c:forEach begin="${pg.startPage }" end="${pg.endPage }" var="i">
                        <li>                       
                           <a href="?cpg=${i }" class="${cpg==i?'active':'' }">${i}</a>
                        </li>
                        </c:forEach>
                        
                        <li>
                            <a href="?cpg=${pg.endPage + 1 > pg.totalPages? pg.totalPages : pg.endPage + 1 }"><i class="ri-arrow-right-s-line"></i></a>
                        </li>
                        
                        <li>
                            <a href="?cpg=${pg.totalPages }"><i class="ri-arrow-right-double-line"></i></a>
                        </li>
                    </ul>
                    
                
               </div>
               <!-- 
               <form name="searchform" id="searchform" class="searchform" method="get">
                   <div class="input-group my-3">
                        <div class="input-group-prepend">
                            <button type="button" 
                                    class="btn btn-outline-secondary dropdown-toggle" 
                                    data-toggle="dropdown"
                                    value="title">
                                제목검색
                              </button>
                              <div class="dropdown-menu">
                                <a class="dropdown-item" href="writer">이름검색</a>
                                <a class="dropdown-item" href="title">제목검색</a>
                                <a class="dropdown-item" href="content">내용검색</a>
                            </div>
                        </div>
                       <input type="hidden" name="searchname" id="searchname" value="title" />
                       <input type="search" name="searchvalue" class="form-control" placeholder="검색">
                       <div class="input-group-append">
                          <button class="btn btn-primary"><i class="ri-search-line"></i></button>
                       </div>
                   </div>
               </form>
                -->
            </div>
            <!-- /listbox-->
