/*자동 하이픈 기능*/
const autoHyphen = (target) => {
    target.value = target.value
     .replace(/[^0-9]/g, '')
     .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}

 /* 우편번호 검색 */
 $(function(){
   $("#zip").click(function(){
      dPostcode();
   });

   //검색
   $('.dropdown-menu>a.dropdown-item').click(function(e){
      e.preventDefault();
      let $val = $(this).attr("href");
      let $txt = $(this).text();
      $('.dropdown-toggle').text($txt);
      $('.dropdown-toggle').val($val);
      $('.searchname').val($val);
   });
   
   //삭제
   $("#delete").click(function(e){
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
            'action' : 'del'
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
             url: 'del',
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
                	location.href="delrest";
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

//다음주소 api
function dPostcode() {
   new daum.Postcode({
       oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var addr = ''; // 주소 변수
           var extraAddr = ''; // 참고항목 변수

           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
           } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('zipcode').value = data.zonecode;
           document.getElementById("addr1").value = addr;
           // 커서를 상세주소 필드로 이동한다.
           document.getElementById("addr2").focus();
       }
   }).open();
}

function clearSession(){
	sessionStorage.clear();
}

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




