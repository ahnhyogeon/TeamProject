function followUser() {
    var userId = prompt("팔로우할 사용자의 아이디를 입력하세요:");
    if (userId !== null && userId.trim() !== "") {
      $.ajax({
        type: "POST",
        url: "follow",
        data: userId,
        dataType: "json", // 반환되는 데이터 타입을 명시적으로 JSON으로 지정
        success: function(response) {
          if(response.message) {
            console.log(response.message);
            alert(response.message);
          } else {
          	console.log(response.message);
          	console.log(response);
            alert("팔로우가 성공하였습니다.");
          }
        },
        error: function(xhr, error) {
          console.error("팔로우 실패: " + error);      
        }
      });
    }
  }
  
function unfollowUser() {
	var userId = prompt("팔로우를 취소할 사용자의 아이디를 입력하세요:");
    if (userId !== null && userId.trim() !== "") {
      $.ajax({
        type: "POST",
        url: "unfollow",
        dataType: "json",
        success: function(response) {
          if(response.message) {
            console.log(response.message);
            alert(response.message);
          } else {
          	console.log(response.message);
          	console.log(response);
            alert("팔로우가 취소되었습니다.");
          }
        },
        error: function(xhr, error) {
          console.error("팔로우 실패: " + error);      
        }
      });
    }
  }
  