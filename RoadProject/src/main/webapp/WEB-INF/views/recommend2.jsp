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
<form id="postForm" method="POST" action="/roadproject/recommend2" style="display: none;">
    <input type="hidden" name="keyword" id="formKeyword">
</form>
<div class="map_wrap">
    <div id="map"></div>
</div>
${keyword }
<script>

var map;

// 지도를 초기화하고 이벤트 리스너 설정
function searchCity() {
    var keyword = document.getElementById('searchInput').value;
	document.getElementById('formKeyword').value = keyword;
    document.getElementById('postForm').submit();
    
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
            
            // 폼을 사용하여 POST 요청 보내기
            
            

        } else {
            alert('검색 결과가 없습니다.');
        }
    });
}

//DOM이 완전히 로드된 후에 실행
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
