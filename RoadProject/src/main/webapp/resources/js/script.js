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