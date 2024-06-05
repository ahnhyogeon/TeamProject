<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="resources/js/jquery-ui-1.13.2/jquery-ui.css">
<link rel="stylesheet" href="resources/js/jquery-ui-1.13.2/jquery-ui.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-ui-1.13.2/jquery-ui.min.js"></script>
<script src="resources/js/jquery-ui-1.13.2/jquery-ui.js"></script>
<script src="resources/js/datepicker-ko.js"></script>
<script src="resources/js/script.js"></script>  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22cb58696de48cf5c8ef72c6b984f1df&libraries=services"></script>
<input type="text" id="searchInput" placeholder="도시를 검색하세요">
<button onclick="searchCity()">검색</button>
<form id="dateform" action="recommend.jsp" method="get">
<div>
	<input type="text" name="date" id="datepicker" autocomplete="off" placeholder="날짜 선택" style="text-align : center;"/>
</div>
</form>
<div>
	<table>
		<thead>
			<tr>
				<th>일자</th>
				<th>요일</th>
				<th>시작시간</th>
				<th>종료시간</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th id="dateCell"></th>	
				<td id="dayCell"></td>
				<td><input type="time" name="starttime" onchange="updateTimeValue(this)"/></td>
				<td><input type="time" name="endtime" onchange="updateTimeValue(this)"/></td>
			</tr>
		</tbody>
	</table>
</div>
<div class="map_wrap">
    <div id="map"></div>
    <ul id="category">
        <li id="CE7" data-order="4" data-keyword="카페"> 
            <span></span>
            카페
        </li>  
        <li id="FD6" data-order="5" data-keyword="맛집"> 
            <span></span>
            음식점
        </li>      
    </ul>
</div>
<script defer src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22cb58696de48cf5c8ef72c6b984f1df&libraries=services&autoload=false"></script>
<script>
var map; // 전역 변수로 map 선언
var infowindow = null; // 전역 변수로 인포윈도우 선언 및 초기화
var markers = [];
var ps;
var currCategory = '';

// 각 카테고리 클릭 이벤트에 대해 검색 키워드를 읽어와서 설정
function addCategoryClickEvent() {
    var categoryItems = document.querySelectorAll('#category li');
    categoryItems.forEach(function(item) {
        item.addEventListener('click', function() {
            var categoryId = this.id;
            currCategory = categoryId;
            console.log('클릭한 카테고리:', categoryId);
            searchPlaces(categoryId); // 카테고리 ID를 넘겨줌
        });
    });
}

// 지도를 초기화하고 이벤트 리스너 설정
function searchCity() {
    var keyword = document.getElementById('searchInput').value;

    if (!keyword) {
        return;
    }

    var geocoder = new kakao.maps.services.Geocoder();
    geocoder.addressSearch(keyword, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            var mapContainer = document.getElementById('map');
            var options = {
                center: coords,
                level: 9
            };
            map = new kakao.maps.Map(mapContainer, options); // 전역 변수로 할당

            var marker = new kakao.maps.Marker({
                position: coords,
                map: map
            });

            var infowindowContent = '<div style="padding:5px;">' + keyword + '</div>';

            kakao.maps.event.addListener(marker, 'click', function() {
                // 이전에 열려있던 인포윈도우가 있으면 닫기
                if (infowindow !== null) {
                    infowindow.close();
                }
                infowindow = new kakao.maps.InfoWindow({
                    content: infowindowContent
                });
                infowindow.open(map, marker);
            });

            searchNearbyRestaurants(result[0]);

            // 각 카테고리 클릭 이벤트 등록
            addCategoryClickEvent();
        } else {
            alert('검색 결과가 없습니다.');
        }
    });
}

function searchNearbyRestaurants(result) {
    var keyword = result.address_name;

    var places = new kakao.maps.services.Places();
    

    places.keywordSearch(keyword+" 맛집", function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            displayPlaces(result);
        }
    });
}

function displayPlaces(places) {
    console.log("displayPlaces 호출됨", places);
    for (var i = 0; i < places.length; i++) {
        var place = places[i];
        var markerPosition = new kakao.maps.LatLng(place.y, place.x);
        var marker = new kakao.maps.Marker({
            position: markerPosition,
            map: map // 전역 변수로 할당된 map 사용
        });

        // markers 배열에 마커 추가
        markers.push(marker);

        // 클로저를 사용하여 마커와 관련된 정보를 전달
        kakao.maps.event.addListener(marker, 'click', (function(place) {
            return function() {
                displayPlaceInfo(place);
            };
        })(place));
    }
}

function displayPlaceInfo(place) {
    var content = '<div class="placeinfo">' +
        '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
            '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    } else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }

    content += '<span class="rating">'+place.rating+'</span>    <span class="tel">' + place.phone + '</span>' +
        '</div>' +
        '<div class="after"></div>';

    // 이전에 열려있던 인포윈도우가 있으면 닫기
    if (infowindow !== null) {
        infowindow.close();
    }
    infowindow = new kakao.maps.InfoWindow({
        content: content,
        position: new kakao.maps.LatLng(place.y, place.x)
    });
    infowindow.open(map);

    // 지도 클릭 시 인포윈도우 닫기
    kakao.maps.event.addListener(map, 'click', function() {
        if (infowindow !== null) {
            infowindow.close();
        }
    });
}

function searchPlaces(category) {
    if (!category) {
        return;
    }

    console.log('searchPlaces 호출됨:', category);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();

    // 현재 지도 범위 내에서 장소를 검색합니다
    var bounds = map.getBounds();
    var options = {
        bounds: bounds // 지도 범위 내에서 검색
    };

    ps.categorySearch(category, placesSearchCB, options);
}

// 마커를 제거하는 함수
function removeMarker() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null); // 지도에서 마커를 제거합니다
    }
    markers = [];
}

// 장소 검색 결과 처리 콜백 함수 정의
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        // 검색 결과가 정상적으로 받아온 경우
        console.log('placesSearchCB 호출됨', data);
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색 결과가 없는 경우
        console.log("검색 결과가 없습니다.");
    } else if (status === kakao.maps.services.Status.ERROR) {
        // 검색 과정에서 오류가 발생한 경우
        console.log("검색 중 오류가 발생했습니다.");
    }
}

// DOM이 완전히 로드된 후에 실행
document.addEventListener("DOMContentLoaded", function() {
    // 카카오맵 API 로드 후 초기화 함수 호출
    kakao.maps.load(function() {
        ps = new kakao.maps.services.Places(); // Places 객체 초기화
        document.getElementById('searchInput').addEventListener('keydown', function(e) {
            if (e.key === 'Enter') {
                searchCity();
            }
        });
        document.querySelector('button').addEventListener('click', searchCity);
    });
});


</script>