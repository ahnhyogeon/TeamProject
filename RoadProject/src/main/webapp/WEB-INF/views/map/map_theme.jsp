<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="containerA">
        <div class="aside">
            <div class="aside_menu">
                    <div class="aside_content_main">
                        <a href="map.html" class="aside_content_sub">
                            <img class="activeIcon_shop" src="../resources/images/Shop_light.png" alt="Shop_red">
                        </a>
                        <a href="map_book.html" class="aside_content_sub_red">
                            <img class="activeIcon_book" src="../resources/images/Book_red.png" alt="book_light">
                        </a>
                    </div>
            </div>
            <div class="aside_content">
                <div class="aside_top">
         				<div id="map_aside_top_selectBox">
         					<div id="map_aside_select1">추천 테마</div>
         					<div id="map_aside_select2" class="map_aside_select_active">마이 테마</div>
         				</div>
                        <div class="row_main1_sub_inputBox">
                            <input type="text" placeholder="원하는 스페이스를 검색해보세요"> 
                        </div>

                    <div class="mythema_menu">
                        <div class="ossume">
                            <div id="search_theme" class="search_thema">
                                마이 테마
                                <img src="../resources/images/Expand_down_light.png" class="Expand_down_light" alt="Expand_down_light">
                            </div>
                        </div>
                        <div class="mycount">
                            <span class="first">총</span><span class="second">3</span><span class="first">개</span>
                            <div class="btntab">
                                <div class="filtercheck">
                                    <span class="checkred">등록순</span>
                                    <img src="../resources/images/Ellipse 68.png" class="checkone" alt="check">
                                    <span>이름순</span>
                                </div>
                            </div>
                        </div>
                        <div class="countmenu">
                            <div class="allcount_onclick">
                                전체<span>3</span>
                            </div>
                            <div class="allcount">
                                공개<span>2</span>
                            </div>
                            <div class="allcount">
                                미공개<span>1</span>
                            </div>
                        </div>
                    </div>
                
                </div>
                <div class="list">
                    <div class="frameinfo">
                        <div class="framethumbs">
                            <div class="thumbsimg">
                                <img src="../resources/images/profile-img.png" alt="profileimg">
                            </div>
                            <div class="thumbscon">
                                <p>찾아라 맛집 기행!</p>
                                <img src="../resources/images/winking-face.png" alt="face">
                                <span>{닉네임}</span>
                                <img src="../resources/images/Ellipse 67.png">
                                <img src="../resources/images/pushpin.png" alt="pin">
                                <span>34</span>
                                <img src="../resources/images/Ellipse 67.png">
                                <img src="../resources/images/thumbs-up.png" alt="thumbs">
                                <span class="thumbsup">1,891</span>
                            </div>
                            <div class="moremenu">
                                <img src="../resources/images/Meatballs_menu.png" alt="moremenu">
                            </div>
                        </div>
                    </div>       

                    <div class="frameinfo">
                        <div class="framethumbs">
                            <div class="thumbsimg">
                                <img src="../resources/images/profile-img2.png" alt="profileimg">
                            </div>
                            <div class="thumbscon">
                                <p>비 오는 날 여기가 딱이야!</p>
                                <img src="../resources/images/winking-face.png" alt="face">
                                <span>{닉네임}</span>
                                <img src="../resources/images/Ellipse 67.png">
                                <img src="../resources/images/pushpin.png" alt="pin">
                                <span>6</span>
                                <img src="../resources/images/Ellipse 67.png">
                                <img src="../resources/images/thumbs-up.png" alt="thumbs">
                                <span class="thumbsup">1,891</span>
                            </div>
                            <div class="moremenu">
                                <img src="../resources/images/Meatballs_menu.png" alt="moremenu">
                            </div>
                        </div>
                    </div>       

                    <div class="frameinfo">
                        <div class="framethumbs">
                            <div class="thumbsimg">
                                <img src="../resources/images/glowing-star.png" alt="secretstar">
                            </div>
                            <div class="thumbscon">
                                <p>마이 테마</p>
                                <img src="../resources/images/locked.png" alt="locking">
                                <span>비공개</span>
                                <img src="../resources/images/Ellipse 67.png">
                                <img src="../resources/images/pushpin.png" alt="pin">
                                <span>3</span>
                            </div>
                            <div class="moremenu">
                                <img src="../resources/images/Meatballs_menu.png" alt="moremenu">
                            </div>
                        </div>
                    </div>       
                    
                    <div class="thema_btn_container">
                        <div class="thema_btn">
                            테마 만들기 
                            <img src="../resources/images/add-square-light.png" alt="add_square">
                        </div>
                    </div>
                </div>
               
            </div>
            
        </div>
               <div id="map_con" style="width: 1332px;height: 1080px;">
    	
    </div>
    </div>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfGdSpW5kn_kMbCCsaJNyBiJLOnvEMkTU&callback=myMap"></script>