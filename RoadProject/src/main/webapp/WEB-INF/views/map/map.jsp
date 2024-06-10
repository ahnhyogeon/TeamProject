<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="containerA">
        <div class="aside">
            <div class="aside_menu">
                <div class="aside_content_main">
                    <a href="map.html" class="aside_content_sub_red">
                        <img class="activeIcon_shop" src="../resources/images/Shop_red.png" alt="Shop_red">
                    </a>
                    <a href="map_book.html" class="aside_content_sub" id="aside_content_sub">
                        <img class="activeIcon_book" src="../resources/images/Book_light.png" alt="book_light">
                    </a>
                </div>
            </div>
            <div class="aside_content">
                <div class="aside_top">
                     
                    <div class="row_main1_sub_inputBox">
                        <input type="text" placeholder="원하는 스페이스를 검색해보세요"> 
                    </div>
                    <div class="info">
                        <div class="frame29554">정확한 정보를 위해 위치 정보 제공에 동의해주세요!</div>
                        <a href="#" class="agree">위치 정보 제공 동의하기</a>
                    </div>
                    <div class="search">
                        <div class="frame29617">
                            <div class="search_title">
                                <img src="../resources/images/icons _ emoji/Person Tipping Hand.png" class="here" alt="here">
                                <p>경기도 김포시</p>
                            </div>
                            <div class="smalltab">
                                <div class="btn_token">
                                    상세 옵션 설정
                                    <img src="../resources/images/Filter_alt.png" class="filtertab" alt="filtertab">
                                </div>
                            </div>
                        </div>
                        <div class="btntab_none">
                            <div class="filtercheck">
                                <span class="checkred">추천순</span><img src="../resources/images/Ellipse 68.png" class="checkone" alt="check"><span>이름순</span>
                                <img src="../resources/images/Ellipse 68.png" class="checkone" alt="check"><span>거리순</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list">
                    <div class="spaceinfo">
                        <div class="checkbox">
                            <div class="contentinfo">
                                <div class="frameinfo">
                                    <div class="frameinfosec">
                                        <p id="map_test">{상호명}</p>
                                    </div>
                                    <div class="frameinfotag">{카테고리}</div>
                                </div>
                                <div class="frameaddr">
                                    <span class="addr">인천광역시 부평구 부평대로</span>
                                    <img src="../resources/images/Ellipse 67.png" class="ellipse67">
                                    <span>36.4km</span>
                                    <img src="../resources/images/Ellipse 67.png" class="ellipse67">
                                    <span>리뷰 100개</span>
                                </div>
                                <div class="photoframe">
                                    <div class="photo"></div>
                                    <div class="photo"></div>
                                    <div class="photo"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="spaceinfo">
                        <div class="checkbox">
                            <div class="contentinfo">
                                <div class="frameinfo">
                                    <div class="frameinfosec">
                                        <p>{상호명}</p>
                                    </div>
                                    <div class="frameinfotag">카페</div>
                                </div>
                                <div class="frameaddr">
                                    <span class="addr">인천광역시 부평구 부평대로</span>
                                    <img src="../resources/images/Ellipse 67.png" class="ellipse67">
                                    <span>36.4km</span>
                                    <img src="../resources/images/Ellipse 67.png" class="ellipse67">
                                    <span>리뷰 100개</span>
                                </div>
                                <div class="photoframe">
                                    <div class="photo"></div>
                                    <div class="photo"></div>
                                    <div class="photo"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="spaceinfo">
                        <div class="checkbox">
                            <div class="contentinfo">
                                <div class="frameinfo">
                                    <div class="frameinfosec">
                                        <p>{상호명}</p>
                                    </div>
                                    <div class="frameinfotag">카페</div>
                                </div>
                                <div class="frameaddr">
                                    <span class="addr">인천광역시 부평구 부평대로</span>
                                    <img src="../resources/images/Ellipse 67.png" class="ellipse67">
                                    <span>36.4km</span>
                                    <img src="../resources/images/Ellipse 67.png" class="ellipse67">
                                    <span>리뷰 100개</span>
                                </div>
                                <div class="photoframe">
                                    <div class="photo"></div>
                                    <div class="photo"></div>
                                    <div class="photo"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               
            </div>
            
        </div>
        <div id="map_con" style="width: 1332px;height: 1080px;">
    	
    </div>
    </div>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfGdSpW5kn_kMbCCsaJNyBiJLOnvEMkTU&callback=myMap"></script>