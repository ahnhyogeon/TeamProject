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
                <h1 class="text-center mb-5">가게정보</h1>
                <div class="d-flex justify-content-between py-4">
                    <div>
                        <fmt:formatNumber value="${pg.totalPosts }" groupingUsed="true"/>posts /
                        <fmt:formatNumber value="${pg.totalPages }" groupingUsed="true" />pages
                    </div>             
                </div>
                <table class="table table-hover">
                    <colgroup>
                       <col width="11%">
                       <col width="11%">
                       <col width="11%">
                       <col width="11%">
                       <col width="11%">
                       <col width="11%">
                       <col width="11%">
                       <col width="11%">
                       <col width="11%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>사업자번호</th>
                            <th>가게명</th>
                            <th>가게코드</th>
                            <th>주소</th>
                            <th>상세주소</th>
                            <th>가게번호</th>
                            <th>가게도메인</th>
                            <th>소개글</th>
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach var="r_list" items="${r_list }">
                                                                                     
                       <tr>
                           <td class="text-center">${r_list.id }</td>
                           <td class="text-center">${r_list.business }</td>                           
                           <td class="text-center"><a href="menu?business=${r_list.business }&cpg=1">${r_list.r_name }</a></td>
                           <td class="text-center">${r_list.r_code }</td>
                           <td class="text-center">${r_list.r_addr1 }</td>
                           <td class="text-center">${r_list.r_addr2 }</td>  
                           <td class="text-center">${r_list.r_tel }</td>
                           <td class="text-center">${r_list.r_url }</td>
                           <td class="text-center">${r_list.r_intro }</td>                      
                       </tr>
                       </c:forEach> 
                       <!-- /loop -->
                    </tbody>
                </table>
                <div class="justify-content-between py-4">
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
            
               <form name="searchform" id="searchform" class="searchform" method="get">
                   <div class="input-group my-3">
                        <div class="input-group-prepend">
                            <button type="button" 
                                    class="btn btn-outline-secondary dropdown-toggle" 
                                    data-toggle="dropdown"
                                    value="r_name">
                                가게명검색
                              </button>
                              <div class="dropdown-menu">
                                <a class="dropdown-item" href="follow">팔로우검색</a>
                                <a class="dropdown-item" href="r_name">가게명검색</a>
                                <a class="dropdown-item" href="address">주소검색</a>
                            </div>
                        </div>
                       <input type="hidden" name="searchname" id="searchname" value="r_name" />
                       <input type="search" name="searchvalue" class="form-control" placeholder="검색">
                       <div class="input-group-append">
                          <button class="btn btn-primary"><i class="ri-search-line"></i></button>
                       </div>
                   </div>
               </form>
             
            </div>
            <!-- /listbox-->
