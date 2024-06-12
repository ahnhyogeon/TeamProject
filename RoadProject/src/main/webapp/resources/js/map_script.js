document.addEventListener('DOMContentLoaded', function () {
    const map_aside_top_selectBox = document.getElementById("map_aside_top_selectBox");
    const map_aside_top_selectBox2 = document.getElementById("map_aside_top_selectBox2");
    const search_theme = document.getElementById("search_theme");

    if (search_theme) {
        search_theme.addEventListener('click', function() {
            if (map_aside_top_selectBox) {
                console.log("1");
                const currentDisplay = getComputedStyle(map_aside_top_selectBox).display;

                if (currentDisplay === "none") {
                    map_aside_top_selectBox.style.display = "flex";
                } else {
                    map_aside_top_selectBox.style.display = "none";
                }
            } else if (map_aside_top_selectBox2) {
                console.log("2");
                const currentDisplay = getComputedStyle(map_aside_top_selectBox2).display;

                if (currentDisplay === "none") {
                    map_aside_top_selectBox2.style.display = "flex";
                } else {
                    map_aside_top_selectBox2.style.display = "none";
                }
            }
        });
    }
});

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
    const agreeButton = document.querySelector('.agree');
    if (agreeButton) {
        agreeButton.addEventListener('click', function(event) {
            event.preventDefault();
            getLocation(); 
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
    if ((event.ctrlKey || event.metaKey) && event.keyCode === 82) {
        handleRefresh();
    }
});

document.addEventListener('keyup', function(event) {
    if (event.key === 'F5') {
        handleRefresh();
    }
});


