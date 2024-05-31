<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="resources/js/jquery.min.js"></script>        
<script src="resources/js/script.js"></script>
    <div id="containerM">
        
        <div class="main">
            <img src="resources/images/main.png" alt="main"> 
            <div class="Mainbox1">
                <div class="MainlogoBox"><img src="resources/images/LOGO_w.png" alt="logo"></div>
                <div class="MainTextBox">
                    <span>원하는 곳,가고싶은 곳</span><span>을 입력해보세요!</span>
                </div>
                <div class="MaininputBox">
                    <form action="#">
                        <div>
                        <img src="resources/images/Search.png" alt="search">
                        <input type="text" name="search" id="search" placeholder="원하는 장소, 혹은 스페이스 입력">
                        </div>
                    </form>
                </div>
                <div class="MainPopularBox">
                    <div>
                        <img src="resources/images/icons _ emoji/Fire.png" alt="fire">
                        <span>실시간 인기 검색어</span>
                    </div>
                    <div class="popular">{tag name}</div>
                    <div class="popular">{tag name}</div>
                    <div class="popular">{tag name}</div>
                    <div class="popular">{tag name}</div>
                    <div class="popular">{tag name}</div>
                </div>
            </div>
        </div>
        <div class="Mainbox2">
            <div class="subMainbox2">
                <div class="Fintroduction">
                    <div>
                        <img src="resources/images/symbol.png" alt="symbol">
                    </div>
                    <div>
                        나의 인생 맛집, linkisy로<br>
                        <span>저장부터 추천</span>까지 모아보세요. 
                    </div>
                    <div>
                        <div>
                            맛집과 루트 안내 서비스
                        </div>
                        <div>
                            사용자의 위치 기반 서비스로 추천해 주는 맛집을 찾아 보세요.<br>
                            내가 방문한 곳을 루트로 만들어 다른 사람과 공유와 루트까지 볼 수 있어요.
                        </div>
                    </div>
                </div>
                <div class="subMainimagebox2">
                    <img src="resources/images/section_1.png" alt="section_1">
                </div>
            </div>
        </div>
        <div class="Mainbox3">
            <div class="symbolBox">
                <img src="resources/images/symbol.png" alt="symbol">
            </div>
            <div class="titleBox3">
                테마별 실시간 <span>TOP 3</span> 루트를 만나 보세요.
            </div>
            <div class="contentBox3">
                <div>
                    <div>
                        <div class="tgnamebox active2"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                        <div class="tgnamebox"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                        <div class="tgnamebox"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                        <div class="tgnamebox"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                        <div class="tgnamebox"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                    </div>
                </div>
                <div>
                    <div class="contentSubBox3">
                        <div>
                            <div>
                                <div class="titleSubBox3">
                                    <span>성수동 카페 거리</span>
                                    <div>
                                        <img src="resources/images/icons _ emoji/Winking Face.png" alt="winking face">
                                        <span>{작성자 닉네임}</span>
                                    </div>
                                    <div class="subLineBox3"></div>
                                    <div class="subBoxcontent">
                                        <img src="resources/images/icons _ emoji/Pushpin.png" src="pushpin">
                                        카페 및 식당포함<span id="numBold">6</span>개의 스페이스
                                    </div>
                                    <div class="subBoxTagname">
                                        <div class="tgnamebox2"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                                        <div class="tgnamebox2"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                                        <div class="tgnamebox2"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                                        <div class="tgnamebox2"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                                    </div>
                                </div>
                            </div>
                          <div class="btnBox3">
                            <button id="root" class="btn">
                                <img src="resources/images/icons _ emoji/World Map.png" alt="map">
                                루트 보기
                            </button>
                            <div></div>
                            <button id="scrip" class="btn">
                                <img src="resources/images/icons _ emoji/Bookmark.png" alt="bookmark">
                                스크랩하기
                            </button>
                          </div>
                        </div>
                        <div>
                            <div>
                                <div class="titleSubBox3">
                                    <span>서울숲 카페 모음집</span>
                                    <div>
                                        <img src="resources/images/icons _ emoji/Winking Face.png" alt="winking face">
                                        <span>{작성자 닉네임}</span>
                                    </div>
                                    <div class="subLineBox3"></div>
                                    <div class="subBoxcontent">
                                        <img src="resources/images/icons _ emoji/Pushpin.png" src="pushpin">
                                        카페 및 식당포함<span id="numBold">6</span>개의 스페이스
                                    </div>
                                    <div class="subBoxTagname">
                                        <div class="tgnamebox2"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                                        <div class="tgnamebox2"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                                        <div class="tgnamebox2"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                                        
                                    </div>
                                </div>
                            </div>
                          <div class="btnBox3">
                            <button id="root" class="btn">
                                <img src="resources/images/icons _ emoji/World Map.png" alt="map">
                                루트 보기
                            </button>
                            <div></div>
                            <button id="scrip" class="btn">
                                <img src="resources/images/icons _ emoji/Bookmark.png" alt="bookmark">
                                스크랩하기
                            </button>
                          </div>
                        </div>
                        <div>
                            <div>
                                <div class="titleSubBox3">
                                    <span>블루리본 맛집 투어</span>
                                    <div>
                                        <img src="resources/images/icons _ emoji/Winking Face.png" alt="winking face">
                                        <span>{작성자 닉네임}</span>
                                    </div>
                                    <div class="subLineBox3"></div>
                                    <div class="subBoxcontent">
                                        <img src="resources/images/icons _ emoji/Pushpin.png" src="pushpin">
                                        카페 및 식당포함<span id="numBold">6</span>개의 스페이스
                                    </div>
                                    <div class="subBoxTagname">
                                        <div class="tgnamebox2"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                                        <div class="tgnamebox2"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                                        <div class="tgnamebox2"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                                        <div class="tgnamebox2"><img src="resources/images/icons _ emoji/Clapper Board.png"><span>{tag name}</span></div>
                                    </div>
                                </div>
                            </div>
                          <div class="btnBox3">
                            <button id="root" class="btn">
                                <img src="resources/images/icons _ emoji/World Map.png" alt="map">
                                루트 보기
                            </button>
                            <div></div>
                            <button id="scrip" class="btn">
                                <img src="resources/images/icons _ emoji/Bookmark.png" alt="bookmark">
                                스크랩하기
                            </button>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="Mainbox4">
            <div class="Mainbox4Inner">
                <div class="Fintroduction">
                    <div>
                        <img src="resources/images/symbol.png" alt="symbol">
                    </div>
                    <div>
                        웨이팅 없는 예약 원하시나요?<br>
                        집에서 편하게 기다릴 수 있어요.
                    </div>
                    <div>
                        <div id="innerBox4">
                            오픈런 예약 및 당일 예약 서비스
                        </div>
                        <div>
                            오픈부터 줄 서기 힘든 가게에서 미리 예약 서비스를 지원합니다!<br>
                            이용 시간에 맞춰 편하게 예약해 불필요한 시간을 절약하세요.
                        </div>
                    </div>                    
            </div>
            <div class="subMainimagebox2">
                <img src="resources/images/section_2.png" alt="section_2">
            </div>
        </div>
        </div>
        <div class="Mainbox5">
        <div class="Mainbox5Inner">
            <div class="subMainimagebox2">
                <img src="resources/images/section_3.png" alt="section_3">
            </div>
            <div class="Fintroduction5">
                <div>
                    <img src="resources/images/symbol.png" alt="symbol">
                </div>
                <div>
                    찾기 어려우신가요??<br>
                    저장부터 추천까지 모아보세요.
                </div>
                <div>
                    <div id="innerBox5">
                        맛집과 루트 안내 서비스
                    </div>
                    <div>
                        사용자의 위치 기반 서비스로 추천해 주는 맛집을 찾아 보세요!<br>
                        내가 방문한 곳을 루트로 만들어 다른 사람과 공유와 루트까지 볼 수 있어요.
                    </div>
                </div>                    
        </div> 
    </div>
        </div>
        <div class="Mainbox6">
            <div class="innerBox6">
                <div class="innerBox6_title">
                    <div class="symbolBox">
                        <img src="resources/images/symbol.png" alt="symbol">
                    </div>
                    <span>링키지에게 루트를 추천 받아 보세요!</span>
                    <span>링키지는 사용자의 데이터와 날짜를 분석해 최적의 루트를 찾아 줍니다.</span>
                    <div><span>※</span> 루트를 확인하려면 회원가입을 하셔야 합니다!</div>
                </div>
                <div class="innerBox6_content">
                    <img src="resources/images/content.png" alt="content">
                </div>
            </div>
        </div>