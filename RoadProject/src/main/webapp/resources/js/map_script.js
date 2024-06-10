let map;

function myMap() {
    var mapOptions = {
        center: new google.maps.LatLng(37.6446455, 126.6670966),
        zoom: 18,
        mapTypeId: 'terrain',
        mapTypeControl: false
    };

    map = new google.maps.Map(document.getElementById("map_con"), mapOptions);

    var pos = new google.maps.LatLng(37.6446455, 126.6670966); // 마커의 위치

    new google.maps.Marker({
        position: pos,
        map: map
    });

    // 페이지 로드 시 이전에 저장된 지도 상태 불러오기
    var mapCenter = sessionStorage.getItem('mapCenter');
    var mapZoom = sessionStorage.getItem('mapZoom');
    if (mapCenter && mapZoom) {
        map.setCenter(JSON.parse(mapCenter));
        map.setZoom(parseInt(mapZoom));
    }

    // 지도 상태 저장
    google.maps.event.addListener(map, 'idle', function() {
        var center = map.getCenter();
        var zoom = map.getZoom();
        sessionStorage.setItem('mapCenter', JSON.stringify(center));
        sessionStorage.setItem('mapZoom', zoom);
    });
}

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}

function showPosition(position) {

    const confirmation = window.confirm("원활한 서비스를 위해 위치 공유에 동의하시겠습니까?");
    if (confirmation) {
        // 동의한 경우, 추가 동작 수행
        document.querySelector('.info').innerHTML = '<div class="frame29554">현재 위치를 찾았습니다!</div>';
        const pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
        };
        map.setCenter(pos);
        new google.maps.Marker({
            position: pos,
            map: map
        });
    } else {
        // 동의하지 않은 경우, 추가 동작 수행
        document.querySelector('.info').innerHTML = '<div class="frame29554">위치 공유에 동의하지 않았습니다!</div><a href="#" class="agree">위치 정보 제공 동의하기</a>';
    }
}

function showError(error) {
    let message;
    switch (error.code) {
        case error.PERMISSION_DENIED:
            message = "사용자가 위치 정보를 제공하지 않았습니다.";
            break;
        case error.POSITION_UNAVAILABLE:
            message = "위치 정보를 사용할 수 없습니다.";
            break;
        case error.TIMEOUT:
            message = "위치 정보 요청이 타임아웃되었습니다.";
            break;
        case error.UNKNOWN_ERROR:
            message = "알 수 없는 오류가 발생했습니다.";
            break;
    }
    alert(message);
}

document.addEventListener('DOMContentLoaded', function() {
    // 'agree' 클래스를 가진 요소에 이벤트 리스너 추가
    const agreeButton = document.querySelector('.agree');
    if (agreeButton) {
        agreeButton.addEventListener('click', function(event) {
            event.preventDefault();
            getLocation(); // "동의하기"를 클릭하면 위치 정보를 가져옴
        });
    }
});

// 페이지 로드 시 myMap 함수 호출
document.addEventListener('DOMContentLoaded', function() {
    myMap();
});

function handleRefresh() {
    sessionStorage.removeItem('mapCenter');
    sessionStorage.removeItem('mapZoom');
}

document.addEventListener('keydown', function(event) {
    // 사용자가 F5 키를 누른 경우 또는 Ctrl+R (Windows) / Command+R (Mac)를 누른 경우
    if ((event.ctrlKey || event.metaKey) && event.keyCode === 82) {
        handleRefresh();
    }
});

document.addEventListener('keyup', function(event) {
    // 사용자가 새로 고침 버튼을 클릭한 경우
    if (event.key === 'F5') {
        handleRefresh();
    }
});
