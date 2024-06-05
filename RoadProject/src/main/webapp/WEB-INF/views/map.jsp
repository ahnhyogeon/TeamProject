<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<div class="map_wrap">
        <!-- 지도 표시 영역 -->
        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

        <!-- 검색 기능 및 검색 결과 목록 영역 -->
        <div id="menu_wrap" class="bg_white">
            <div class="option">
                <div>
                    <!-- 검색 폼 -->
                    <form onsubmit="searchPlaces(); return false;">
                        키워드 : <input type="text" id="keyword" size="15" placeholder="맛집을 검색하세요."> 
                        <button type="submit">검색하기</button> 
                    </form>
                </div>
            </div>
            <hr>
            <!-- 검색 결과 목록 -->
            <ul id="placesList"></ul>
            <!-- 페이지네이션 -->
            <div id="pagination"></div>
        </div>
    </div>

    <!-- 카카오맵 JavaScript SDK -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22cb58696de48cf5c8ef72c6b984f1df&libraries=services"></script>
    <script>
        // 사용자의 현재 위치를 가져와서 검색하는 함수
        function getUserLocationAndSearch() {
            if (navigator.geolocation) {
                // 위치 정보 수집에 대한 동의 여부를 확인
                var userConsent = confirm("사용자 위치 정보를 수집하고 저장하시겠습니까?");
                if (userConsent) {
                    // 사용자가 동의한 경우 위치 정보를 가져옴
                    navigator.geolocation.getCurrentPosition(function(position) {
                        var lat = position.coords.latitude, // 위도
                            lon = position.coords.longitude; // 경도
                        var locPosition = new kakao.maps.LatLng(lat, lon); // 현재 위치

                        // 위치 정보를 가져온 후에 지도를 생성하고 검색을 수행
                        createMap(locPosition);
                        searchNearbyRestaurants(locPosition);
                        console.log(locPosition);
                    });
                } else {
                    // 사용자가 동의하지 않은 경우, 기본 위치로 지도 생성
                    createMap(new kakao.maps.LatLng(37.566826, 126.9786567)); // 서울 시청 좌표
                }
            } else {
                // 위치 정보를 사용할 수 없는 경우, 기본 위치로 지도 생성
                createMap(new kakao.maps.LatLng(37.566826, 126.9786567)); // 서울 시청 좌표
            }
        }

        // 지도를 생성하는 함수
        function createMap(locPosition) {
            var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
            var mapOption = { 
                center: locPosition, // 지도의 중심좌표
                level: 2 // 지도의 확대 레벨 
            }; 
            window.map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
            map.setCenter(locPosition); // 지도 중심 설정
            // 현재 위치를 지도 중심으로 설정하고 주소 정보 표시
            searchAddrFromCoords(map.getCenter(), displayCenterInfo);
        }

        // 장소 검색을 수행하는 함수
        function searchPlaces() {
            var keyword = document.getElementById('keyword').value;
            if (!keyword.trim()) {
                alert('키워드를 입력해주세요!');
                return;
            }
            // 장소 검색 요청
            ps.keywordSearch(keyword, placesSearchCB);
        }

        // 장소 검색 결과를 처리하는 콜백 함수
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
                // 검색 결과 목록과 마커 표시
                displayPlaces(data);
                // 페이지 번호 표시
                displayPagination(pagination);
            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
                alert('검색 결과가 없습니다.');
            } else if (status === kakao.maps.services.Status.ERROR) {
                alert('검색 중 오류가 발생했습니다.');
            }
        }

        // 검색 결과를 목록으로 표시하는 함수
        function displayPlaces(places) {
            var listEl = document.getElementById('placesList'), 
                fragment = document.createDocumentFragment(), 
                bounds = new kakao.maps.LatLngBounds(); // 검색 결과 범위

            // 검색 결과 목록과 지도 위 마커 초기화
            removeAllChildNods(listEl);
            removeMarker();

            // 검색된 장소들을 처리
            for (var i = 0; i < places.length; i++) {
                var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x); // 장소 위치
                var marker = addMarker(placePosition, i); // 마커 추가
                bounds.extend(placePosition); // 검색 결과 범위 확장

                // 마커와 목록 항목 간 이벤트 처리
                (function(marker, title) {
                    kakao.maps.event.addListener(marker, 'click', function() {
                        displayInfowindow(marker, title);
                    });
                    fragment.appendChild(getListItem(i, places[i])); // 목록 항목 추가
                })(marker, places[i].place_name);
            }
            listEl.appendChild(fragment); // 목록에 추가
            map.setBounds(bounds); // 검색 결과 범위 지도에 표시
        }

        // 마커를 생성하고 지도에 표시하는 함수
        function addMarker(position, idx) {
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 URL
                imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지 크기
                imgOptions =  {
                    spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지 크기
                    spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                    offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내 좌표
                },
                markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                    position: position, // 마커 위치
                    image: markerImage // 마커 이미지 설정
                });
            marker.setMap(map); // 지도에 마커 표시
            return marker; // 마커 반환
        }

        // 검색 결과 목록 항목을 생성하는 함수
        function getListItem(index, place) {
            var el = document.createElement('li'),
                itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                            '<div class="info">' +
                            '<a href="' + place.place_url + '" target="_blank">' + place.place_name + '</a><br>';
            if (place.road_address_name) {
                itemStr += '    <span>' + place.road_address_name + '</span>' +
                            '   <span class="jibun gray">' +  place.address_name  + '</span>';
            } else {
                itemStr += '    <span>' +  place.address_name  + '</span>'; 
            }
            itemStr += '  <span class="tel">' + place.phone  + '</span>' +
                        '</div>';           
            el.innerHTML = itemStr;
            el.className = 'item';
            return el;
        }

        // 검색 결과 목록 하단에 페이지 번호를 표시하는 함수
        function displayPagination(pagination) {
            var paginationEl = document.getElementById('pagination'),
                fragment = document.createDocumentFragment();

            removeAllChildNods(paginationEl); // 기존 페이지 번호 삭제
            // 페이지 번호 생성 및 이벤트 처리
            for (var i = 1; i <= pagination.last; i++) {
                var el = document.createElement('a');
                el.href = "#";
                el.innerHTML = i;
                if (i === pagination.current) {
                    el.className = 'on';
                } else {
                    el.onclick = (function(i) {
                        return function() {
                            pagination.gotoPage(i);
                        };
                    })(i);
                }
                fragment.appendChild(el);
            }
            paginationEl.appendChild(fragment); // 페이지 번호 추가
        }

        // 인포윈도우에 장소명을 표시하는 함수
        function displayInfowindow(marker, title) {
            var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
            infowindow.setContent(content);
            infowindow.open(map, marker);

            // 네이버 플레이스 API를 호출하여 상세 정보 표시
            displayInfowindowDetail(marker, title);
        }

        // 인포윈도우에 장소 상세 정보를 표시하는 함수
        function displayInfowindowDetail(marker, title) {
            // 장소 검색 요청
            ps.keywordSearch(title, function(data, status) {
                if (status === kakao.maps.services.Status.OK) {
                    // 검색 결과가 있을 경우, 첫 번째 결과를 사용
                    var place = data[0];
                    var detailEl = document.createElement('div');
                    detailEl.innerHTML = '<a href="' + place.place_url + '" target="_blank">' + place.place_name + '</a><br>' +
                                         place.address_name + '<br>' +
                                         '평점: ' + place.rating + '<br>' +
                                         '전화번호: ' + place.phone;
                    infowindow.setContent(detailEl);
                    console.log(place);
                } else {
                    // 검색 결과가 없는 경우, 간단한 정보만 표시
                    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
                    infowindow.setContent(content);
                }
            });
        }

        // 검색 결과 목록의 자식 Element를 제거하는 함수
        function removeAllChildNods(el) {   
            while (el.hasChildNodes()) {
                el.removeChild(el.lastChild);
            }
        }

        // 지도 위 마커를 모두 제거하는 함수
        function removeMarker() {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(null);
            }   
            markers = [];
        }

        // GPS로 검색한 주변 맛집을 검색하는 함수
        function searchNearbyRestaurants(center) {
            // 반경 2km 내의 맛집을 검색
            ps.keywordSearch('맛집', placesSearchCB, {
                location: center,
                radius: 2000
            });
        }

        // 주소-좌표 변환 객체를 생성하는 함수
        var geocoder = new kakao.maps.services.Geocoder();

        // 좌표로 주소 정보를 검색하는 함수
        function searchAddrFromCoords(coords, callback) {
            geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
        }

        // GPS로 검색한 위치의 주소를 표시하는 함수
        function displayCenterInfo(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                for(var i = 0; i < result.length; i++) {
                    if (result[i].region_type === 'H') {
                        console.log(result[i].address_name+", "+i);
                        
                        break;
                    }
                }
            }
        }

        // 장소 검색 객체 생성
        var ps = new kakao.maps.services.Places();  
        // 마커 배열
        var markers = [];
        // 검색 결과를 표시할 인포윈도우
        var infowindow = new kakao.maps.InfoWindow({zIndex:1});

        // 페이지 로드 시 사용자 위치로 검색
        getUserLocationAndSearch();
    </script>
