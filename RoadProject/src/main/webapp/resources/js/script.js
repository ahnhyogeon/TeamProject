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
});

/*자동 하이픈 기능*/
const autoHyphen = (target) => {
    target.value = target.value
     .replace(/[^0-9]/g, '')
     .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}

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

    // 삭제
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


		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
		        return result;
         }     
          });
          
          //메뉴 삭제
   $("#mDelete").click(function(e){
      e.preventDefault();
      var id = $(this).data("id");
      var result = "";
      const business = prompt("삭제를 위한 번호를 입력하세요.");
      /** 직접 폼으로 만들어서 전달 하는 방법 **/
      if(business) {
         //삭제를 위해서는 서버에 business 와 id 를 전달해 주어야 한다.
         /*
         var form = $('<form>', {
            'method' : 'post' ,
            'action' : 'mDel'
         }).append(
           $('<input>', {
              'name' : 'business',
              'value' : business,
              'type' : 'hidden'    
           })).append(
           $('<input>', {
              'name' : 'id',
              'value' : id,
              'type' : 'hidden'    
           }));
          $(document.body).append(form);
          form.submit();
          */
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
                	location.href="AllMenu";
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
          
      }
   });
   
   
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


