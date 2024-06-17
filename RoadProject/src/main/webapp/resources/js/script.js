$(function(){

    const joinNextBtn = document.getElementById('join_nextbtn');
    if (joinNextBtn) {
        joinNextBtn.addEventListener('click', function() {
            window.location.href = 'joinFine.html';
        });
    }

    const loginBtn = document.getElementById('login_btn');
    if (loginBtn) {
        loginBtn.addEventListener('click', function() {
            window.location.href = 'login.html';
        });
    }

    const homeTab = document.getElementById('tabMenu_home');
    if(homeTab){
        homeTab.addEventListener('click', function(){
            window.location.href = 'myPage.html';
        });
    }

    const reviewTab = document.getElementById('tabMenu_review');
    if(reviewTab){
        reviewTab.addEventListener('click', function(){
            window.location.href = 'myPage2.html';
        });
    }

    const themeTab = document.getElementById('tabMenu_theme');
    if(themeTab){
        themeTab.addEventListener('click', function(){
            window.location.href = 'myPage3.html';
        });
    }

    const editGear = document.getElementById('edit_gear');
    if(editGear){
        editGear.addEventListener('click', function(){
            window.location.href = "joinedit.html";
        });
    }
    
    const partner_homeTab = document.getElementById('partner_tabMenu_myhome');
    if(partner_homeTab){
        partner_homeTab.addEventListener('click', function(){
            window.location.href = 'partnerPage.html';
        });
    }

    const partner_reviewTab = document.getElementById('partner_tabMenu_myreview');
    if(partner_reviewTab){
        partner_reviewTab.addEventListener('click', function(){
            window.location.href = 'partnerPage2.html';
        });
    }

    const partner_themeTab = document.getElementById('partner_tabMenu_myres');
    if(partner_themeTab){
        partner_themeTab.addEventListener('click', function(){
            window.location.href = 'partnerPage3.html';
        });
    }
    
    const partner_avgTab = document.getElementById('partner_tabMenu_myavg');
    if(partner_avgTab){
        partner_avgTab.addEventListener('click', function(){
            window.location.href = 'partnerPage4.html';
        });
    }

    const partner_editGear = document.getElementById('partner_edit_gear');
    if(partner_editGear){
        partner_editGear.addEventListener('click', function(){
            window.location.href = "partneredit.html";
        });
    }

    const followTab = document.getElementById('follow_tab');
    if(followTab){
        followTab.addEventListener('click', function(){
            window.location.href = "follow.html";
        });
    }

    const followingTab = document.getElementById('following_tab');
    if(followingTab){
        followingTab.addEventListener('click', function(){
            window.location.href = "following.html";
        });
    }

    const profileFollow = document.getElementById('profile_follow');
    if(profileFollow){
        profileFollow.addEventListener('click', function(){
            window.location.href = 'follow.html';
        });
    }

    const profileFollowing = document.getElementById('profile_following');
    if(profileFollowing){
        profileFollowing.addEventListener('click', function(){
            window.location.href = "following.html";
        });
    }
    
    const make_theme = document.getElementById('make_theme');
    if(make_theme){
        make_theme.addEventListener('click', function(){
            if (sessionStorage.getItem('mapCenter')) {
            sessionStorage.removeItem('mapCenter');
        }
        if (sessionStorage.getItem('mapZoom')) {
            sessionStorage.removeItem('mapZoom');
        }

        window.location.href = "map/map";
        });
    }
    
    const save_theme = document.getElementById('save_theme');
    if(save_theme){
        save_theme.addEventListener('click', function(){
            if (sessionStorage.getItem('mapCenter')) {
            sessionStorage.removeItem('mapCenter');
        }
        if (sessionStorage.getItem('mapZoom')) {
            sessionStorage.removeItem('mapZoom');
        }

        window.location.href = "map/map";
        });
    }
    
    const map_test = document.getElementById('map_test');
    if(map_test){
        map_test.addEventListener('click', function(){

        window.location.href = "../partnerPage_detail";
        });
    }
    
    const partner_detail_tabMenu_home = document.getElementById('partner_detail_tabMenu_home');
    if(partner_detail_tabMenu_home){
        partner_detail_tabMenu_home.addEventListener('click', function(){

        window.location.href = "partnerPage_detail";
        });
    }
    
    const partner_detail_tabMenu_menu = document.getElementById('partner_detail_tabMenu_menu');
    if(partner_detail_tabMenu_menu){
        partner_detail_tabMenu_menu.addEventListener('click', function(){

        window.location.href = "partnerPage_detail_menu";
        });
    }
    
    const partner_detail_tabMenu_review = document.getElementById('partner_detail_tabMenu_review');
    if(partner_detail_tabMenu_review){
        partner_detail_tabMenu_review.addEventListener('click', function(){

        window.location.href = "partnerPage_detail_review";
        });
    }
    
    const partner_detail_review_btn = document.getElementById('partner_detail_review_btn');
    if(partner_detail_review_btn){
        partner_detail_review_btn.addEventListener('click', function(){

        window.location.href = "partnerPage_review_registration";
        });
    }
    
    const review_registration_review_rotice = document.getElementById('review_registration_review_rotice');
    if(review_registration_review_rotice){
        review_registration_review_rotice.addEventListener('click', function(){

        window.location.href = "#";
        });
    }
    
    const map_aside_select1 = document.getElementById('map_aside_select1');
    if(map_aside_select1){
        map_aside_select1.addEventListener('click', function(){

        window.location.href = "map_book";
        });
    }
    
    const map_aside_select2 = document.getElementById('map_aside_select2');
    if(map_aside_select2){
        map_aside_select2.addEventListener('click', function(){

        window.location.href = "map_theme";
        });
    }
    
    const partner_myavg_detail = document.getElementById('partner_myavg_detail');
    if(partner_myavg_detail){
        partner_myavg_detail.addEventListener('click', function(){

        window.location.href = "partner_avg_detail";
        });
    }
    
	const cards = document.querySelectorAll('.partner_detail_review_list_card');


	cards.forEach(function(card) {
    card.addEventListener('click', function() {
        console.log("으악");
        const overlay = document.getElementById('overlay');
        const popup = document.getElementById('partner_detail_review_detailpop1');

        overlay.style.display = 'block';
        popup.style.display = 'block';
    	});
	});
   
   const buttons = document.querySelectorAll('.partner_myreview_list_user_btn1');

	buttons.forEach(function(button) {
   		button.addEventListener('click', function() {
        	console.log("btn1");
        	window.location.href = "partnerPage_myreview";
    	});
	});
    
    
    const buttons2 = document.querySelectorAll('.partner_myreview_list_user_btn2');

	buttons2.forEach(function(button2) {
   		button2.addEventListener('click', function() {
        	console.log("btn2");
        	window.location.href = "partnerPage_myreview2";
    	});
	});
	
});

document.addEventListener('DOMContentLoaded', function () {
const popup = document.getElementById("partner_detail_review_detailpop1");
    const popupClose = document.getElementById("Xbox");
    const overlay = document.getElementById("overlay");

    if (popupClose) {
        popupClose.addEventListener('click', function() {
			console.log(popup);
			console.log(overlay);
            popup.style.display = "none";
            overlay.style.display="none";
        });
    } 
});



$(function(){

    $("#addrsearch").click(function(event){
        event.preventDefault(); // 폼 제출 방지
        dPostcode();
    });

    // 검색
    $('.dropdown-menu>a.dropdown-item').click(function(e){
        e.preventDefault();
        let $val = $(this).attr("href");
        let $txt = $(this).text();
        $('.dropdown-toggle').text($txt);
        $('.dropdown-toggle').val($val);
        $('.searchname').val($val);
    });

    // 가게 삭제
    $("#delete").click(function(e){
        e.preventDefault();
        var id = $(this).data("id");
        var result = "";
        const business = prompt("삭제를 위한 번호를 입력하세요.");
        if(business) {
            $.ajax({
                url: 'del',
                type: 'post',
                data: { id: id, business: business },
                dataType: 'json',
                async: false,
                success: function(res){
                    console.log(res);
                    result = res;
                    const rs = Number(res);
                    if(rs){
                        alert("삭제 성공");
                        location.href="delrest";
                    }
                    else{
                        alert("비밀번호가 틀렸습니다.");
                    }
                },
                error: function (request, status, error) {
                    console.log("code: " + request.status);
                    console.log("message: " + request.responseText);
                    console.log("error: " + error);
                    return result;
                }     
            });
        }
    });
          
           
   /*       
    //메뉴 삭제
   $("#mDelete").click(function(e){
      e.preventDefault();
      var id = $(this).data("id");
      var result = "";
      const business = prompt("삭제를 위한 번호를 입력하세요.");

          $.ajax({
             url: 'mDel',
             type: 'post',
             data: { id: id, business: business },
             dataType: 'json',
             async: false,   //비동기 처리
             success: function(res){
                console.log(res);
                result = res;
                const rs = Number(res);
                if(rs){
                	alert("삭제 성공");
                	location.href="menu";
                }
                else{
                	alert("비밀번호가 틀렸습니다.");
                }
             },
                error: function (request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
		        return result;
         	}     
          })
        });
      */	
     /*	  
	  $('#edit-menu-btn').click(function(event) { //원래 코드
        event.preventDefault(); // 기본 동작(링크 이동)을 막음

        var menuId = $(this).data('id'); // data-id 속성에서 'id' 값을 추출

        // AJAX 요청을 통해 'id' 값을 서버로 전송
        $.ajax({
        url: 'menu', // 서버가 처리할 URL
        type: 'POST',
        data: { id: menuId }, // 전송할 데이터
        dataType: 'text',  //json타입으로 해도 mdto 나옴.
            success: function(response) {
                console.log('Edit menu id ' + menuId + ' success!');
                // 성공적으로 처리된 경우 추가 로직 구현
            },
            error: function(xhr, status, error) {
                console.error('Edit menu id ' + menuId + ' failed: ' + error);
                // 오류 발생 시 처리할 추가 로직
            }
        });
    });
     */
    //검색
   $('.dropdown-menu>a.dropdown-item').click(function(e){
      e.preventDefault();
      let $val = $(this).attr("href");
      let $txt = $(this).text();
      $('.dropdown-toggle').text($txt);
      $('.dropdown-toggle').val($val);
      $('#searchname').val($val);
   });   
          

});


$(document).ready(function() {  //강제로 클릭이벤트를 1번이상 실행되지 않게 하는 코드 (계속 메소드가 2번씩 실행돼서 사용 위에 원래코드가 있음)
    // .edit-menu-btn 클래스에 대한 클릭 이벤트 핸들러 등록
    $('#edit-menu-btn').off('click').on('click', function(event) {
       // event.preventDefault(); // 기본 동작(링크 이동)을 막음
        
        var menuId = $(this).data('id'); // data-id 속성에서 'id' 값을 추출
        console.log(menuId);
        // AJAX 요청을 통해 'id' 값을 서버로 전송
        $.ajax({
            url: 'menuedit', // 서버가 처리할 URL
            type: 'POST',
            data: { id: menuId }, // 전송할 데이터
            dataType: 'json',  //json타입으로 해도 mdto 나옴.
            success: function(response) {
                console.log('Edit menu id ' + menuId + ' success!');
                // 성공적으로 처리된 경우 추가 로직 구현                
            },
            error: function(xhr, status, error) {
                console.error('Edit menu id ' + menuId + ' failed: ' + error);
                // 오류 발생 시 처리할 추가 로직
            }
        });
    });
});
	

 //메뉴 삭제
$(document).ready(function() {  //강제로 클릭이벤트를 1번이상 실행되지 않게 하는 코드 (계속 메소드가 2번씩 실행돼서 사용 위에 원래코드가 있음) 
    $('#mDelete').off('click').on('click', function(e) {
      e.preventDefault();
      var id = $(this).data("id");
      var result = "";
      const business = prompt("삭제를 위한 번호를 입력하세요.");

          $.ajax({
             url: 'mDel',
             type: 'post',
             data: { id: id, business: business },
             dataType: 'json',
             async: false,   //비동기 처리
             success: function(res){
                console.log(res);
                result = res;
                const rs = Number(res);
                if(rs){
                	alert("삭제 성공");
                	location.href="menu";
                }
                else{
                	alert("비밀번호가 틀렸습니다.");
                }
             },
                error: function (request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
		        return result;
         	}     
          });
        });
});
   
/*  
function dPostcode(event) {
    event.preventDefault();     
});
 */
 
function dPostcode() {

    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}


function clearSession(){
	sessionStorage.clear();
}

/*
    $(function() {
        $("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd (D)',
            showButtonPanel: true,
            closeText: '닫기',
            onSelect: function(dateString) {
                // 선택된 날짜 출력
                console.log("선택된 날짜:", dateString);
                // 선택된 날짜의 월일과 요일을 가져옴
                var date = new Date(dateString);
                var month = date.getMonth() + 1;
                var day = date.getDate();
                var dayOfWeek = date.toLocaleDateString('ko-KR', { weekday: 'long' });

                // 일자와 요일을 해당하는 td에 넣어줌
                $("#dateCell").text(month + '/' + day);
                $("#dayCell").text(dayOfWeek);
            },
            // 시작 날짜와 끝나는 날짜 설정
            minDate: new Date(), // 오늘부터 선택 가능
            defaultDate: new Date()
        });

        // 오늘 버튼 클릭 시 오늘 날짜 선택
        $(document).on('click', '.ui-datepicker-current', function() {
            var today = new Date();
            $("#datepicker").datepicker('setDate', today);
            // 날짜를 dateFormat 형식으로 출력
            var formattedDate = $.datepicker.formatDate('yy-mm-dd (D)', today);
            console.log("선택된 날짜:", formattedDate);
        });
    });

    function updateTimeValue(input) {
        // 선택된 시간 값을 가져옵니다.
        var selectedTime = input.value;

        // 입력 필드의 value 속성을 선택된 시간 값으로 설정합니다.
        input.setAttribute('value', selectedTime);
    }

*/

$(document).ready(function() {
    // common 버튼 클릭 이벤트
    $('#common').click(function() {
    	event.preventDefault();
    	console.log("클릭");
    	console.log(this.id);
        // common 버튼에 active 클래스를 추가하여 활성화 상태로 변경
        $(this).addClass('active2');
        // partner 버튼의 active 클래스 제거하여 비활성화 상태로 변경
        $('#partner').removeClass('active2');
    });
    
    $('#partner').click(function() {
    	event.preventDefault();
    	console.log("클릭");
    	console.log(this.id);
        // common 버튼에 active 클래스를 추가하여 활성화 상태로 변경
        $(this).addClass('active2');
        // partner 버튼의 active 클래스 제거하여 비활성화 상태로 변경
        $('#common').removeClass('active2');
    });
    
     $('#checkAll').click(function() {
        // 전체 동의 체크박스의 상태를 가져옴
        var isChecked = $(this).prop('checked');
        
        // 모든 체크박스의 상태를 전체 동의 체크박스와 동일하게 설정
        $('.check').prop('checked', isChecked);
    });
    
$('#nextbtn').click(function(event) {
    var isAllChecked = $('#checkAll').prop('checked');
    
    var isChecked = $('.check').map(function() {
        return $(this).prop('checked');
    }).get();
    
    if (!isAllChecked || isChecked.indexOf(false) !== -1) {
        event.preventDefault();
        alert('필수 항목에 모두 동의해주세요.');
    } else {
    	// #partner가 active인 경우
        if ($('#partner').hasClass('active2')) {
            // form 요소 가져오기
            var form = $('#joinForm');
            // hidden input 요소 생성하여 form에 추가
            var hiddenInput = $('<input type="hidden" name="role" value="2">');
            form.append(hiddenInput);
            form.attr('action', 'join2');
            
            window.location.href='/join2';
        }
        else if($('#common').hasClass('active2')){
        	var form = $('#joinForm');
        	form.attr('action', 'join');
        	
        	// '/join' 엔드포인트로 이동
        	window.location.href = '/join';
        }
        else{
        	alert('회원 유형을 선택해주세요.');
        }
    }
});
$('#join2_nextbtn').click(function(event) {
    var userid = $('#userid').val().trim();
    var nickname = $('#nickname').val().trim();
    var pass1 = $('#pass1').val().trim();
    var pass2 = $('#pass2').val().trim();
    var addr1 = $('#addr1').val().trim();
    var addr2 = $('#addr2').val().trim();
    var tel = $('#tel').val().trim();

    if ((!userid || !nickname || !pass1 || !pass2 || !addr1 || !tel)) {
        event.preventDefault(); // 전송을 막음
        alert('모든 필수 항목을 입력하세요.');
    }  
});

$('#join_nextbtn').click(function(event) {
    var userid = $('#userid').val().trim();
    var nickname = $('#nickname').val().trim();
    var pass1 = $('#pass1').val().trim();
    var pass2 = $('#pass2').val().trim();
    var addr1 = $('#addr1').val().trim();
    var addr2 = $('#addr2').val().trim();

    if ((!userid || !nickname || !pass1 || !pass2 || !addr1)) {
        event.preventDefault(); // 전송을 막음
        alert('모든 필수 항목을 입력하세요.');
    } 
});




});

$(document).ready(function() {
    $('.aside_content_sub').click(function() {
        // 모든 aside_content_sub 요소에서 active3 클래스를 제거
        $('.aside_content_sub').removeClass('active3');
        // 클릭한 요소에만 active3 클래스를 추가
        $(this).addClass('active3');

        // 모든 아이콘 이미지를 초기 상태로 되돌림
        $('.aside_content_sub img').each(function() {
            var imgSrc = $(this).attr('src');
            var newSrc = imgSrc.replace('_red.png', '_light.png');
            $(this).attr('src', newSrc);
        });

        $('.user_management_sub2').removeClass('active3');
        $('.user_management_sub2 img').each(function() {
            var imgSrc = $(this).attr('src');
            var newSrc = imgSrc.replace('_red.png', '_light.png');
            $(this).attr('src', newSrc);
        });

        // 클릭한 요소의 이미지 경로를 변경
        var icon = $(this).find('.activeIcon');
        var iconSrc = icon.attr('src');
        var newIconSrc = iconSrc.replace('_light.png', '_red.png');
        icon.attr('src', newIconSrc);

        if ($(this).attr('id') === 'userManagementToggle') {
            $('.user_management_sub').show();

            // 토글 아이콘을 변경
            var toggleIcon = $(this).find('#toggleIcon');
            if (toggleIcon.attr('src') === '../resources/images/Expand_up_red.png') {
                toggleIcon.attr('src', '../resources/images/Expand_down_light.png');
            } else {
                toggleIcon.attr('src', '../resources/images/Expand_up_red.png');
            }
            
            $('#admin_user_sub_btn').addClass('active3');
            var icon = $('#admin_user_sub_btn').find('.activeIcon');
        	var iconSrc = icon.attr('src');
        	var newIconSrc = iconSrc.replace('_light.png', '_red.png');
        	icon.attr('src', newIconSrc);
            
        } else {
            // 다른 메뉴를 클릭했을 때 사용자 관리 메뉴를 숨기기
            $('.user_management_sub').hide();
            
            // 토글 아이콘을 초기 상태로 되돌림
            $('#toggleIcon').attr('src', '../resources/images/Expand_down_light.png');
        }
    });

    $('.user_management_sub2').click(function() {
        // 모든 aside_content_sub 요소에서 active3 클래스를 제거
        $('.user_management_sub2').removeClass('active3');
        // 클릭한 요소에만 active3 클래스를 추가
        $(this).addClass('active3');

        // 모든 아이콘 이미지를 초기 상태로 되돌림
        $('.user_management_sub2 img').each(function() {
            var imgSrc = $(this).attr('src');
            var newSrc = imgSrc.replace('_red.png', '_light.png');
            $(this).attr('src', newSrc);
        });

        // 클릭한 요소의 이미지 경로를 변경
        var icon = $(this).find('.activeIcon');
        var iconSrc = icon.attr('src');
        var newIconSrc = iconSrc.replace('_light.png', '_red.png');
        icon.attr('src', newIconSrc);
    });
    
    $('#logo').click(function(){
		console.log("되냐?");
		window.location.href = "../index";
	});
    
    $('#rowside_review_backbtn').click(function(){
		console.log("되냐?");
        window.location.href = "adminPage";
    });
    
     $('#admin_review_btn').click(function(){
		console.log("되냐?");
        window.location.href = "adminPage";
    });
    
    $('#admin_keyword_btn').click(function(){
		console.log("되냐?");
        window.location.href = "admin_keyword";
    });
    
    $('#rowside_keyword_backbtn').click(function(){
		console.log("되냐?");
        window.location.href = "admin_keyword";
    });
    
    $('#userManagementToggle').click(function(){
		console.log("되냐?");
        window.location.href = "admin_user";
    });
    
    $('#rowside_user_backbtn').click(function(){
		console.log("되냐?");
        window.location.href = "admin_user";
    });
    
    $('#admin_user_sub_btn').click(function(){
		console.log("되냐?");
        window.location.href = "admin_user";
    });
    
    $('#admin_user_decl_btn').click(function(){
		console.log("되냐?");
        window.location.href = "admin_decl";
    }); 
    
    $('#admin_user_decl_btn2').click(function(){
		console.log("되냐?");
        window.location.href = "admin_decl";
    });
    
    $('#partner_tab_1').click(function(){
    	window.location.href = "partneredit";
    }); 
    
    $('#partner_tab_2').click(function(){
    	window.location.href = "partneredit2";
    });
    
    /*자동 하이픈 기능*/
	document.getElementById('tel').addEventListener('input', function() {

    let value = this.value;
    
    value = value.replace(/[^0-9]/g, '');
    
    let formattedValue = '';
    for (let i = 0; i < value.length; i++) {
        if (i === 3 || i === 7) {
            formattedValue += '-';
        }
        formattedValue += value[i];
    }

    this.value = formattedValue;
	});
	
});

 document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.registration_select_group_token').forEach(div => {
                div.addEventListener('click', function() {
                    console.log("꺅");
                    const radioId = this.getAttribute('data-radio');
                    document.getElementById(radioId).checked = true;
                });
            });
        });


document.addEventListener('DOMContentLoaded', function () {
const popup = document.getElementById("myPartner_rotice");
	const popupOpen =document.getElementById("partner_myrotice_open")
    const popupClose = document.getElementById("myPartner_rotice_close");
    const overlay = document.getElementById("overlay");

	if (popupOpen) {
        popupOpen.addEventListener('click', function() {
			console.log(popup);
			console.log(overlay);
            popup.style.display = "flex";
            overlay.style.display="block";
        });
    
    }
    if (popupClose) {
        popupClose.addEventListener('click', function() {
			console.log(popup);
			console.log(overlay);
            popup.style.display = "none";
            overlay.style.display="none";
        });
    } 
});

document.addEventListener('DOMContentLoaded', function () {
const popup = document.getElementById("respon_box");
	const popupOpen =document.getElementById("res_btn")

	if (popupOpen) {
        popupOpen.addEventListener('click', function() {
			console.log(popup);
            popup.style.display = "flex";
            popupOpen.style.display="none";
        });
    
    }
});

document.addEventListener('DOMContentLoaded', function () {
const popup = document.getElementById("respon_box");
	const popupOpen =document.getElementById("edit_btn")

	if (popupOpen) {
        popupOpen.addEventListener('click', function() {
			console.log(popup);
            popup.style.display = "flex";
            popupOpen.style.display="none";
        });
    
    }
});

document.addEventListener('DOMContentLoaded', function () {
const popup = document.getElementById("menu_edit");
	const popupOpen =document.getElementById("menu_edit_btn")
    const popupClose = document.getElementById("Xbox2");
    const overlay = document.getElementById("overlay");

	if (popupOpen) {
        popupOpen.addEventListener('click', function() {
			console.log(popup);
			console.log(overlay);
            popup.style.display = "flex";
            overlay.style.display="block";
        });
    
    }
    if (popupClose) {
        popupClose.addEventListener('click', function() {
			console.log(popup);
			console.log(overlay);
            popup.style.display = "none";
            overlay.style.display="none";
        });
    } 
});

document.addEventListener('DOMContentLoaded', function () {
const popup = document.getElementById("menu_add");
	const popupOpen =document.getElementById("menu_add_btn")
    const popupClose = document.getElementById("Xbox");
    const overlay = document.getElementById("overlay");

	if (popupOpen) {
        popupOpen.addEventListener('click', function() {
			console.log(popup);
			console.log(overlay);
            popup.style.display = "flex";
            overlay.style.display="block";
        });
    
    }
    if (popupClose) {
        popupClose.addEventListener('click', function() {
			console.log(popup);
			console.log(overlay);
            popup.style.display = "none";
            overlay.style.display="none";
        });
    } 
});

