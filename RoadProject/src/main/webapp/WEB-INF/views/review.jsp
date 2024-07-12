<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/partnerPage_detail.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />     
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script>
<script src="resources/js/script.js"></script>
<script src="resources/js/review.js"></script> 

  <script>
    $(document).ready(function() {
        var totalReviews = ${reviewCount};
        var percentageFive = (${reviewFiveScore} / totalReviews) * 100;
        var percentageFour = (${reviewFourScore} / totalReviews) * 100;
        var percentageThree = (${reviewThreeScore} / totalReviews) * 100;
        var percentageTwo = (${reviewTwoScore} / totalReviews) * 100;
        var percentageOne = (${reviewOneScore} / totalReviews) * 100;
        
        console.log(percentageFive);
        
        $('#partner_detail_star_line').css('width', percentageFive + '%');
        $('#partner_detail_wink_line').css('width', percentageFour + '%');
        $('#partner_detail_smile_line').css('width', percentageThree + '%');
        $('#partner_detail_confused_line').css('width', percentageTwo + '%');
        $('#partner_detail_pensive_line').css('width', percentageOne + '%');
        
     // 리뷰 리스트 카드 클릭 이벤트
        $('.partner_detail_review_list_card').on('click', function() {
            var reviewId = $(this).data('review-id'); // 리뷰 ID 가져오기
            
            //display 초기화
            $('.loading').css('display', 'flex');
            $('.partner_detail_review_detailpop_inner').css('display', 'none');
            
            setTimeout(function() {
            $.ajax({
                url: 'getReviewDetail', // 서버 엔드포인트 URL
                method: 'GET',
                data: { reviewId: reviewId },
                success: function(response) {
                	
                	console.log(response); // 서버 응답 확인
                	
                	// 성공적으로 데이터를 가져오면 오버레이에 표시                	
                    if (response && response.length > 0) {
                        var review = response[0]; // 배열의 첫 번째 요소를 가져옴

                        // 타이틀 박스에 닉네임 삽입
                        var htmlContent = '<div>' + review.nickname;
                        htmlContent += '<div class="partner_detail_review_detailpop_inner_card">';
                        htmlContent += '<img src="' + review.detailScoreUrl + '"alt="star" >';
                        htmlContent += review.scoremessage;
                        htmlContent += '</div>' + '</div>';
                        htmlContent += new Date(review.wdate).toLocaleDateString(); // 날짜 포맷 변경 예시

                        // 기존 내용 유지한 채 추가
                        $('#partner_detail_review_detailpop1 .partner_detail_review_detailpop_inner_title_box').html(htmlContent);

                        // 텍스트 영역에 리뷰 내용 삽입
                        $('#partner_detail_review_detailpop1 .partner_detail_review_detailpop_inner_text').text(review.detail);
                        
                        //display 수정
                        $('.loading').css('display', 'none');
                        $('.partner_detail_review_detailpop_inner').css('display', 'flex');
                        
                     	// 사진 삽입
                        var htmlImg = '';
                        review.photoUrls.forEach(function(photoUrl) {
                            console.log(photoUrl); // 파일 데이터 로그 출력
                            htmlImg += '<div><img src="' + photoUrl + '"></div>';
                        });
                        console.log(htmlImg); // 생성된 HTML 로그 출력
                        $('#reviewDetailImg').html(htmlImg);

                        // 팔로우 기능
                        var htmlFollow = '<span onclick="followUser()">팔로우</span>';
                        $('#reviewDetailFollow').html(htmlFollow);
                        
                    	// 공감하기 기능
                        var htmlRating = '<img src="resources/images/icons _ emoji/Raising Hands.png" alt="hands">';
                        htmlRating += '<span class="rating-btn" data-review-id="'+ review.id +'">공감하기</span>';
                        $('#detailRating').html(htmlRating);
                        
                        // 공감한 사람의 수
                        var htmlRatingScore = review.rating;
                        $('#ratingScore').html(htmlRatingScore);
                        
                        $('#overlay').show();
                        $('#partner_detail_review_detailpop1').show();
                    }
                },
                error: function(error) {
                    console.error('리뷰 상세 정보를 가져오는 중 오류 발생:', error);
                }
            });
        }, 1000); // 1초 지연
    });
     
     // 공감하기 버튼 클릭 이벤트 핸들러 (이벤트 위임)
        $(document).on('click', '.rating-btn', function() {
            var $this = $(this); // 클릭된 버튼을 가리키는 참조 변수
            var reviewUserId = $this.data('review-id'); // 리뷰 작성자의 userid 가져오기

            console.log('클릭된 리뷰 작성자 ID:', reviewUserId); // 콘솔에 로그 출력

            $.ajax({
                url: 'rating', // 서버 엔드포인트 URL
                method: 'POST',
                data: { reviewId: reviewUserId },
                success: function(response) {
                    console.log('공감하기 성공:', response);

                    // 버튼 텍스트를 '공감하기 취소'로 변경
                    $this.text('공감하기 취소');

                    // 필요에 따라 클래스 변경 또는 추가 작업 수행 / 테이블 추가 제작 필요성
                    //$this.removeClass('rating-btn').addClass('unrating-btn');
                },
                error: function(error) {
                    console.error('공감하기 중 오류 발생:', error);
                }
            });
        });

        // 오버레이 닫기 이벤트
        $('#Xbox').on('click', function() {
            $('#overlay').hide();
            $('#partner_detail_review_detailpop1').hide();
        });
        
        // 처음에 6개만 보여주기
        var reviews = $('.partner_detail_review_list_card');
        reviews.slice(6).hide();

        // '더보기' 버튼 클릭 이벤트
        $('.partner_detail_review_list_more').on('click', function() {
            var hiddenReviews = reviews.filter(':hidden');
            hiddenReviews.slice(0, 6).slideDown(); // 6개씩 보여주기

            // 모든 리뷰가 보이면 '더보기' 버튼 숨기기
            if (hiddenReviews.length <= 6) {
                $(this).hide();
            }
        });
    });
    </script>

<div id="containerM">
    <div class="myPage_mainbox1">
        <div class="myInner">
            <div class="myInner_title">
                스페이스 정보
            </div>
            <div class="partnerInner_profile">
                <div class="profile_picture">
                   
                </div>
                <div class="partnerInner_info">
                    <div class="partnerInner_info_title">
                        <span>{카테고리}</span>
                        {상호명}
                    </div>
						인천광역시 부평구 부평대로 44
                </div>
                <div class="partnerInner_info_btn">
                	<div class="partner_info_btn">
                		<img src="resources/images/Timer Clock.png" alt="clock"/>
                		오픈런 예약 대기
                	</div>
                	<div class="partner_info_btn">
                		<img src="resources/images/icons _ emoji/Spiral Calendar.png" alt="calendar"/>
                		일반 예약
                	</div>
                	<div class="partner_info_btn">
                		<img src="resources/images/pushpin.png" alt="pushpin"/>
                		스크랩
                	</div>
                </div>
            </div>
        </div>
        <div class="myTabMenu">
            <div id="partner_detail_tabMenu_home" class="subTabMenu">홈</div>
            <div id="partner_detail_tabMenu_menu" class="subTabMenu">메뉴</div>
            <div id="partner_detail_tabMenu_review" class="subTabMenu active">리뷰 <span>${reviewCount}</span></div>
        </div>
    </div>
    <div class="myPage_mainbox2">
        <div class="partner_detail_menu">
        <div class="partner_detail_review_titleBox">
        	<div class="partner_detail_review_title">
    			<img src="resources/images/icons _ emoji/Black Nib.png" alt="pen">
    			<div>리뷰 요약</div>
    			<form method="post" action="reviewEdit?memberId=${memberId}">
    				<button type="submit" id="partner_detail_review_btn">리뷰 등록하기</button>
    			</form>
    		</div>
    		<div class="partner_detail_review_avg">
            	<div class="partner_detail_review_box1">
            		<div class="partner_detail_review_box1_title">
            			<span>${reviewCount }</span>
            			명의 사용자들은 평균적으로
            		</div>
            		<div class="partner_detail_review_box1_img">
            			<img src="${iconUrl}" alt="ScoreIcon">
            		</div>
            		<div> 
            			라고 평가합니다.
            		</div>
				</div>
				<div class="partner_detail_review_box2">
					<div class="partner_detail_review_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Star Struck.png" alt="star">
						</div>
						<div class="partner_detail_review_box2_scope_ratio">
							<div id="partner_detail_star_line" class="partner_detail_ratio_line" style="width: ${percentageFive}%"></div>
						</div>
						<div>${reviewFiveScore}</div>
					</div>
					<div class="partner_detail_review_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Winking Face.png" alt="wink">
						</div>
						<div class="partner_detail_review_box2_scope_ratio">
							<div id="partner_detail_wink_line" class="partner_detail_ratio_line" style="width: ${percentageFour}%"></div>
						</div>
						<div>${reviewFourScore}</div>
					</div>
					<div class="partner_detail_review_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Slightly Smiling Face.png" alt="smile">
						</div>
						<div class="partner_detail_review_box2_scope_ratio">
							<div id="partner_detail_smile_line" class="partner_detail_ratio_line" style="width: ${percentageThree}%"></div>
						</div>
						<div>${reviewThreeScore}</div>
					</div>
					<div class="partner_detail_review_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Confused Face.png" alt="confused">
						</div>
						<div class="partner_detail_review_box2_scope_ratio">
							<div id="partner_detail_confused_line" class="partner_detail_ratio_line" style="width: ${percentageTwo}%"></div>
						</div>
						<div>${reviewTwoScore}</div>
					</div>
					<div class="partner_detail_review_box2_scope">
						<div>
							<img src="resources/images/icons _ emoji/Pensive Face.png" alt="pensive">
						</div>
						<div class="partner_detail_review_box2_scope_ratio">
							<div id="partner_detail_pensive_line" class="partner_detail_ratio_line" style="width: ${percentageOne}%"></div>
						</div>
						<div>${reviewOneScore}</div>
					</div>
				</div>
        	</div>
        </div>
        <div class="partner_detail_review_center_title">
        	<div class="partner_detail_review_center_title_top">
        		총
        		<span>${reviewCount}</span>
        		개
        	</div>
        	<div class="partner_detail_review_center_title_last">
        		<a id="partner_detail_review_first_a" href="review?restaurant_id=${restaurant_id}">등록순</a>
        		<img src="resources/images/Ellipse 67.png" alt="ellipse">
        		<a id="partner_detail_review_second_a" href="reviewScoreSelcetList?restaurant_id=${restaurant_id}">조회수순</a>
        	</div>
        </div>
    		<div class="partner_detail_review_list">
    			<!-- 루프 -->
	  			<c:forEach var="review" items="${reviews}">
	    			<div class="partner_detail_review_list_card" data-review-id="${review.id}" style="background: 
        														 linear-gradient(0deg, rgba(0, 0, 0, 0.20) 0%, rgba(0, 0, 0, 0.20) 100%), 
        														 linear-gradient(180deg, rgba(0, 0, 0, 0.00) 50%, rgba(0, 0, 0, 0.80) 100%), 
        														 url(${review.photoUrl}) lightgray 50% / cover no-repeat;">
	    				<div class="partner_detail_review_list_card_top">
	    					<img src="${review.detailScoreUrl}" alt="star">
	    					${review.scoremessage}
	    				</div>
	    				<div class="partner_detail_review_list_card_bottom">
	    					<div id="partner_detail_review_list_card_bottom_date">
	    					<fmt:formatDate value="${review.wdate}" pattern="yyyy-MM-dd"/>
	    					</div>
	    					<div id="partner_detail_review_list_card_bottom_user">${review.nickname}</div>
	    				</div>
	    			</div>
	    		</c:forEach>
	   			<!-- /루프 -->
    		</div>
    		
    		<div class="partner_detail_review_list_more">
    				더보기
    				<img src="resources/images/Expand_down_light.png" alt="down">
    			</div>
    	</div>
        <div class="bannerBox">
            Banner
        </div>
    </div>
    
</div>

<div id="overlay"></div>
<div id="partner_detail_review_detailpop1" class="partner_detail_review_detailpop">
	<label class="reviewLabel">리뷰 정보</label>
	<div class="loading">
    	<dotlottie-player src="https://lottie.host/2459f294-ab2c-41b2-bbba-18f5979d6d07/J0UTdNikng.json" background="transparent" speed="1.5" style="width: 300px; height: 300px;" loop autoplay></dotlottie-player>
	</div>
	<div class="partner_detail_review_detailpop_inner">
		<div class="partner_detail_review_detailpop_inner_title">
			<div>
				<img src="resources\images\icons _ emoji\Winking Face.png" alt="wink">
			</div>
			<div  class="partner_detail_review_detailpop_inner_title_box">
				<div>
					{닉네임}
					<div class="partner_detail_review_detailpop_inner_card">
    					<img src="resources/images/icons _ emoji/Star Struck.png" alt="star">
    					정말 최고예요!
    				</div>
				</div>
				2024.01.01
			</div>
			<div id="reviewDetailFollow" class="partner_detail_review_detailpop_inner_follow">
				팔로우
			</div>		
		</div>
		<div id="reviewDetailImg" class="partner_detail_review_detailpop_inner_img">
			<div></div>
			<div></div>
			<div></div>
		</div>
		<div class="partner_detail_review_detailpop_inner_text">
			너무 맛있네요! 다른 사람들에게도 추천하고 싶네요.
		</div>
		<div class="partner_detail_review_detailpop_inner_show">
			<div>
				<div>
					<img src="resources\images\icons _ emoji\Raising Hands.png" alt="hands">
					<div>
						<span id="ratingScore">1</span>명이 공감했습니다!
					</div>
				</div>
				<div id="detailRating">
					<img src="resources\images\icons _ emoji\Raising Hands.png" alt="hands">
					공감하기
				</div>
			</div>
			<div class="partner_detail_review_detailpop_inner_show_view">
				<img src="resources\images\icons _ emoji\Eyes.png" alt="eyes">
				<div>
					<span>100</span>명 클릭
				</div>
			</div>
		</div>
		<div class="partner_detail_review_detailpop_inner_partner">
			<div class="partner_detail_review_detailpop_inner_partner_title">
				<div>
					사장님의 한마디
				</div>
				<div>
					2024.01.01
				</div>
			</div>
			<div class="partner_detail_review_detailpop_inner_partner_inner">
				{닉네임}님 방문해주셔서 감사합니다 :)
			</div>
		</div>
	</div>
	<div id="Xbox">
			<img src="resources\images\Close_square_light.png" alt="X">
		</div>
</div>

  
