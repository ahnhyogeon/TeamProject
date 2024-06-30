package com.pk.roadproject;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pk.dto.FollowDto;
import com.pk.dto.MemberDto;
import com.pk.dto.ReviewDto;
import com.pk.dto.ReviewUploadFileDto;
import com.pk.service.FollowService;
import com.pk.service.ReviewService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FollowController {
	
	private static final Logger logger = LoggerFactory.getLogger(FollowController.class);
	
	@Inject
	private FollowService serviceF;
	
	@Inject
	private ReviewService serviceR;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	FollowDto followDto;
	
	@Autowired
	ReviewDto reviewDto;
	
	@Autowired
	MemberDto memberDto;
	
	@Autowired
	ReviewUploadFileDto uploadDto;
	
	  @RequestMapping(value = "/partnerPage_detail_review", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partnerPage_detail_review(Locale locale, Model model) {
	        logger.info("partnerPage_detail_review 접속");
	        
	        System.out.println("리뷰 정상 테스트");
	        
	        return "partnerPage_detail_review.tiles";
	    }

	  @RequestMapping(value = "/review", method = RequestMethod.GET)
	  public String review(@RequestParam("restaurant_id") int restaurant_id,
			  			   Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		  System.out.println("review 접속");
		  
		  System.out.println(restaurant_id);
		  reviewDto.setRestaurant_id(restaurant_id);
		  		  
		  List<ReviewDto> reviews = serviceR.reviewRestaurantIdSelectList(reviewDto, restaurant_id);
		  for(ReviewDto review : reviews) {
			  
			  // 스코어 확인 후 icon 출력
			  int detailScore = review.getScore();
			  switch (detailScore) {
	          case 5:
	        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Star Struck.png");
	        	  review.setScoremessage("정말 최고예요!");
	              break;
	          case 4:
	        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Winking Face.png");
	        	  review.setScoremessage("아주 좋아요!");
	              break;
	          case 3:
	        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Slightly Smiling Face.png");
	        	  review.setScoremessage("나쁘지 않아요.");
	              break;
	          case 2:
	        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Confused Face.png");
	        	  review.setScoremessage("조금 별로예요.");
	              break;
	          case 1:
	        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Pensive Face.png");
	        	  review.setScoremessage("실망이에요.");
	              break;
	          default:
	              System.out.println("detailScoreUrl에 문제 발생. 5점으로 출력");
	              review.setDetailScoreUrl("resources/images/icons _ emoji/Star Struck.png");
	              review.setScoremessage("정말 최고예요!");
			  }
			  
			  
			  //이미지 출력 작업
			  System.out.println("imnum = " + review.getImnum());
			  uploadDto = serviceR.rSelectFileByImnum(review.getImnum());
			  
			  System.out.println(uploadDto.getNfilename());
			  review.setPhotoUrl("/roadproject/resources/reviewupload/" + uploadDto.getNfilename());
			  
		  }
		  
		  int reviewCount = serviceR.reviewCount(restaurant_id); // 리뷰를 작성한 고객의 수
		  double reviewScoreResult = serviceR.reviewResultScore(restaurant_id); // 리뷰의 평균점
		  
		  // 1~5점 점수 출력
		  reviewDto.setScore(1);
		  int reviewOneScore = serviceR.reviewOneScore(reviewDto);
		  reviewDto.setScore(2);
		  int reviewTwoScore = serviceR.reviewOneScore(reviewDto);
		  reviewDto.setScore(3);
		  int reviewThreeScore = serviceR.reviewOneScore(reviewDto);
		  reviewDto.setScore(4);
		  int reviewFourScore = serviceR.reviewOneScore(reviewDto);
		  reviewDto.setScore(5);
		  int reviewFiveScore = serviceR.reviewOneScore(reviewDto);
		  
		  // 전체 스코어 평균 확인 후 icon 출력
		  int iconScore = (int) Math.round(reviewScoreResult);
		  String iconUrl = "";
		  switch (iconScore) {
          case 5:
        	  iconUrl = "resources/images/icons _ emoji/Star Struck.png";
              break;
          case 4:
        	  iconUrl = "resources/images/icons _ emoji/Winking Face.png";
              break;
          case 3:
        	  iconUrl = "resources/images/icons _ emoji/Slightly Smiling Face.png";
              break;
          case 2:
        	  iconUrl = "resources/images/icons _ emoji/Confused Face.png";
              break;
          case 1:
        	  iconUrl = "resources/images/icons _ emoji/Pensive Face.png";
              break;
          case 0:
        	  iconUrl = "resources/images/icons _ emoji/Star Struck.png";
              break;
          default:
        	  iconUrl = "resources/images/icons _ emoji/Star Struck.png";
              System.out.println("iconSocre에 문제 발생. 5점으로 출력");
		  }
		  
		  System.out.println(iconUrl);
		  System.out.println(reviewCount);
		  System.out.println(reviewScoreResult);
		  
		  model.addAttribute("reviews", reviews);
		  model.addAttribute("reviewCount", reviewCount);
		  model.addAttribute("reviewScoreResult", reviewScoreResult);
		  model.addAttribute("reviewOneScore", reviewOneScore);
		  model.addAttribute("reviewTwoScore", reviewTwoScore);
		  model.addAttribute("reviewThreeScore", reviewThreeScore);
		  model.addAttribute("reviewFourScore", reviewFourScore);
		  model.addAttribute("reviewFiveScore", reviewFiveScore);
		  model.addAttribute("iconUrl", iconUrl);
		  model.addAttribute("restaurant_id", restaurant_id);
		  
		  return "review.tiles";
	  }
	  
	  // hit순 조회
	  @RequestMapping(value = "/reviewScoreSelcetList", method = RequestMethod.GET)
	  public String reviewScoreSelcetList(@RequestParam("restaurant_id") int restaurant_id,
			  Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		  System.out.println("reviewScoreSelcetList 접속");
		  		  
		  System.out.println(restaurant_id);
		  reviewDto.setRestaurant_id(restaurant_id);
		  
		  //리뷰 사진 첨부되면서 게시글은 보이지 않음. count만 표시
		  		  
		  List<ReviewDto> reviews = serviceR.reviewRestaurantIdScoreSelcetList(reviewDto, restaurant_id);
		  for(ReviewDto review : reviews) {
			  
			  // 스코어 확인 후 icon 출력
			  int detailScore = review.getScore();
			  switch (detailScore) {
	          case 5:
	        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Star Struck.png");
	        	  review.setScoremessage("정말 최고예요!");
	              break;
	          case 4:
	        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Winking Face.png");
	        	  review.setScoremessage("아주 좋아요!");
	              break;
	          case 3:
	        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Slightly Smiling Face.png");
	        	  review.setScoremessage("나쁘지 않아요.");
	              break;
	          case 2:
	        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Confused Face.png");
	        	  review.setScoremessage("조금 별로예요.");
	              break;
	          case 1:
	        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Pensive Face.png");
	        	  review.setScoremessage("실망이에요.");
	              break;
	          default:
	              System.out.println("detailScoreUrl에 문제 발생. 5점으로 출력");
	              review.setDetailScoreUrl("resources/images/icons _ emoji/Star Struck.png");
	              review.setScoremessage("정말 최고예요!");
			  }
			  
			  if(review.getRating() == 0 || review.getHits() == 0) {
				  review.setResult(0);
			  }else {
			  double result = (review.getRating() * 100) / (double) review.getHits();
			  review.setResult(result);
			  }
			  
			  //이미지 출력 작업
			  
			 // String imnum = "f6f8e2e9-ccbd-4af4-a747-3ca26d29f61f";  테스트용 임시 imnum
			  System.out.println("imnum = " + review.getImnum());
			  uploadDto = serviceR.rSelectFileByImnum(review.getImnum());
			  
			  System.out.println(uploadDto.getNfilename());
			  review.setPhotoUrl("/roadproject/resources/reviewupload/" + uploadDto.getNfilename());
			  
		  }
		  
		  int reviewCount = serviceR.reviewCount(restaurant_id); // 리뷰를 작성한 고객의 수
		  double reviewScoreResult = serviceR.reviewResultScore(restaurant_id); // 리뷰의 평균점
		  
		  // 1~5점 점수 출력
		  reviewDto.setScore(1);
		  int reviewOneScore = serviceR.reviewOneScore(reviewDto);
		  reviewDto.setScore(2);
		  int reviewTwoScore = serviceR.reviewOneScore(reviewDto);
		  reviewDto.setScore(3);
		  int reviewThreeScore = serviceR.reviewOneScore(reviewDto);
		  reviewDto.setScore(4);
		  int reviewFourScore = serviceR.reviewOneScore(reviewDto);
		  reviewDto.setScore(5);
		  int reviewFiveScore = serviceR.reviewOneScore(reviewDto);
		  
		  // 전체 스코어 평균 확인 후 icon 출력
		  int iconScore = (int) Math.round(reviewScoreResult);
		  if(iconScore == 0) iconScore = 1;
		  String iconUrl = "";
		  switch (iconScore) {
          case 5:
        	  iconUrl = "resources/images/icons _ emoji/Star Struck.png";
              break;
          case 4:
        	  iconUrl = "resources/images/icons _ emoji/Winking Face.png";
              break;
          case 3:
        	  iconUrl = "resources/images/icons _ emoji/Slightly Smiling Face.png";
              break;
          case 2:
        	  iconUrl = "resources/images/icons _ emoji/Confused Face.png";
              break;
          case 1:
        	  iconUrl = "resources/images/icons _ emoji/Pensive Face.png";
              break;
          default:
              System.out.println("iconSocre에 문제 발생. 5점으로 출력");
		  }
		  
		  System.out.println(iconUrl);
		  System.out.println(reviewCount);
		  System.out.println(reviewScoreResult);
		  
		  model.addAttribute("reviews", reviews);
		  model.addAttribute("reviewCount", reviewCount);
		  model.addAttribute("reviewScoreResult", reviewScoreResult);
		  model.addAttribute("reviewOneScore", reviewOneScore);
		  model.addAttribute("reviewTwoScore", reviewTwoScore);
		  model.addAttribute("reviewThreeScore", reviewThreeScore);
		  model.addAttribute("reviewFourScore", reviewFourScore);
		  model.addAttribute("reviewFiveScore", reviewFiveScore);
		  model.addAttribute("iconUrl", iconUrl);
		  model.addAttribute("restaurant_id", restaurant_id);
		  
		  return "reviewScoreSelcetList.tiles";
	  }
	  
	  //search 페이지
	  @PostMapping("/reviewSearch")
	  public String reviewSearch(@RequestParam("search") String search, 
			  					Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		  System.out.println("reviewSearch 접속");
		  
		  reviewDto.setSearch("%"+search+"%");
		  
		  List<ReviewDto> reviews = serviceR.reviewSelectSearchList(reviewDto);
		  for(ReviewDto review : reviews) {
			  if(review.getRating() == 0 || review.getHits() == 0) {
				  review.setResult(0);
			  }else {
			  double result = (review.getRating() * 100) / (double) review.getHits();
			  review.setResult(result);
			  }
		  }
		  
		  reviewDto.setRestaurant_id(61); //리뷰 가게 아이디 임시로 받음. 추후 변경
		  
		  int restaurant_id = reviewDto.getRestaurant_id();
		  int reviewSearchCount = serviceR.reviewSearchCount(reviewDto); // 검색에 해당되는 리뷰를 작성한 고객의 수
		  System.out.println(reviewSearchCount);
		  double reviewScoreResult;
		  reviewScoreResult = serviceR.reviewResultScore(restaurant_id); // 리뷰의 평균점
		  System.out.println(reviewScoreResult);
		  
		  // 1~5점 점수 출력
		  reviewDto.setScore(1);
		  int reviewOneScore = serviceR.reviewOneScore(reviewDto);
		  reviewDto.setScore(2);
		  int reviewTwoScore = serviceR.reviewOneScore(reviewDto);
		  reviewDto.setScore(3);
		  int reviewThreeScore = serviceR.reviewOneScore(reviewDto);
		  reviewDto.setScore(4);
		  int reviewFourScore = serviceR.reviewOneScore(reviewDto);
		  reviewDto.setScore(5);
		  int reviewFiveScore = serviceR.reviewOneScore(reviewDto);
		  
		  
		  
		  model.addAttribute("reviews", reviews);
		  model.addAttribute("reviewSearchCount", reviewSearchCount);
		  model.addAttribute("reviewScoreResult", reviewScoreResult);
		  model.addAttribute("reviewOneScore", reviewOneScore);
		  model.addAttribute("reviewTwoScore", reviewTwoScore);
		  model.addAttribute("reviewThreeScore", reviewThreeScore);
		  model.addAttribute("reviewFourScore", reviewFourScore);
		  model.addAttribute("reviewFiveScore", reviewFiveScore);
		  
		  return "reviewSearch.tiles";
	  }
	  
	  // 좋아요
	  @PostMapping("/rating")
	    public ResponseEntity<String> ratingReview(@RequestParam("reviewId") int reviewId) throws Exception {
	        System.out.println("ratingReview() 시작");

	        // ReviewDto에 userId 설정
	        ReviewDto reviewDto = new ReviewDto();
	        reviewDto.setId(reviewId);

	        System.out.println("ratingReview() set 완료");

	        // 서비스 호출
	        serviceR.ratingReview(reviewDto);

	        System.out.println("service 실행");

	        return ResponseEntity.ok("Success");
	    }
	  
	  // 사진과 member의 id값을 미리 저장
	  @RequestMapping(value= "/reviewEdit", method = RequestMethod.GET)
	  public String reviewEdit(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		  System.out.println("reviewEdit 접속");
		  
		  String restaurantId = "61"; // 추후 레스토랑 id값을 받아서 사용
		  
		  String memberId = memberDto.getUserid();
		  System.out.println(memberId);
		  		  
		  String imnum = UUID.randomUUID().toString(); // UUID를 사용하여 고유한 imnum 생성
		  reviewDto.setImnum(imnum);
	      model.addAttribute("imnum", imnum);
	      model.addAttribute("memberId", memberId);
	      model.addAttribute("restaurantId", restaurantId);
		  
		  return "reviewEdit.tiles";
	  }
	  
	  @PostMapping("/reviewupload")
		@ResponseBody
		public ResponseEntity<?> handleImageUpload(
				@RequestParam("file") MultipartFile uploadFile,
				@RequestParam("imnum") String imnum,
				Model model){
			System.out.println("reviewupload() 실행됨");
			if(!uploadFile.isEmpty()) {
				try {
					//파일정보 추출
					String oFilename = uploadFile.getOriginalFilename();
					
					//확장자 추출
					String ext = oFilename.substring(oFilename.lastIndexOf(".") + 1).toLowerCase();
					
					//새파일 
					String nFilename = Long.toString(System.currentTimeMillis() / 1000L) + "." + ext;
					
					//파일크기
					long filesize = uploadFile.getSize();
					
					//경로설정
					String uploadDir = servletContext.getRealPath("/resources/reviewupload/");
					System.out.println(uploadDir);
					//업로드
					File serverFile = new File(uploadDir + nFilename);
					uploadFile.transferTo(serverFile);
					
					//데이터베이스 저장
					uploadDto.setExt(ext);
					uploadDto.setFilesize(filesize);
					uploadDto.setImnum(imnum);
					uploadDto.setNfilename(nFilename);
					uploadDto.setOfilename(oFilename);
					uploadDto.setReviewId(4); //임시 업로드 4번(홍길동)
					
					System.out.println(uploadDto);
					
					serviceR.rInsertFile(uploadDto);
					
					String json = "{\"url\":\"" + "/roadproject/resources/reviewupload/" + nFilename + "\"}";
					return ResponseEntity.ok().body(json);
					
				}catch(Exception e) {
					e.printStackTrace();
					return ResponseEntity.badRequest().body("upload Error");
				}
				
			}else {
			   return ResponseEntity.badRequest().body("noFile");
			}   
		}
	  
	  @PostMapping("reviewEditok")
	  public String reviewEditok(@RequestParam("imnum") String imnum,
			  					 @RequestParam("restaurantId") int restaurantId,
			  					 @RequestParam("memberId") String memberId,
			  					 Locale locale, HttpServletRequest request, 
			  					 HttpServletResponse response, Model model) throws Exception {
		  
		  System.out.println("reviewEditok 접속");
		  
		  reviewDto.setImnum(imnum);
		  reviewDto.setUsername(memberId);
		  reviewDto.setScore(Integer.parseInt(request.getParameter("score")));
		  reviewDto.setDetail(request.getParameter("detail"));
		  reviewDto.setRestaurant_id(restaurantId);
		  reviewDto.setHits(1);
		  System.out.println(memberId);
		  System.out.println(restaurantId);
		  System.out.println(reviewDto + " set 완료");
		  
		  // 새로 등록된 review Id 서치
		  System.out.println("insertReviewAndGetId() 실행");
		  int reviewId = serviceR.insertReviewAndGetId(reviewDto);
		  System.out.println("Inserted Review ID: " + reviewId);
		  uploadDto.setReviewId(reviewId);
		  
		  uploadDto.setImnum(imnum);
		  
		  serviceR.rUpdateId(uploadDto);
		  
		  uploadDto.setImnum(imnum);
		  uploadDto.setReviewId(0); // reviewDto에서 select하고 id를 찾아서 등록해야 함.
		  
		  serviceR.rUpdateId(uploadDto);
		  
		  model.addAttribute("reviews", reviewDto);
		  
		  return "redirect:review?restaurant_id=61";
	  }
	  
	    @GetMapping("/getReviewDetail")
	    @ResponseBody
	    public List<ReviewDto> getReviewDetail(@RequestParam("reviewId") int reviewId, Model model) throws Exception {
	    	System.out.println("getReviewDetail 접속");
	    	System.out.println(reviewId);
	    	
	    	List<ReviewDto> reviews = serviceR.getReviewById(reviewId);
	    	
	    	 for(ReviewDto review : reviews) {
				  // 스코어 확인 후 icon 출력
				  int detailScore = review.getScore();
				  switch (detailScore) {
		          case 5:
		        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Star Struck.png");
		        	  review.setScoremessage("정말 최고예요!");
		              break;
		          case 4:
		        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Winking Face.png");
		        	  review.setScoremessage("아주 좋아요!");
		              break;
		          case 3:
		        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Slightly Smiling Face.png");
		        	  review.setScoremessage("나쁘지 않아요.");
		              break;
		          case 2:
		        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Confused Face.png");
		        	  review.setScoremessage("조금 별로예요.");
		              break;
		          case 1:
		        	  review.setDetailScoreUrl("resources/images/icons _ emoji/Pensive Face.png");
		        	  review.setScoremessage("실망이에요.");
		              break;
		          default:
		              System.out.println("detailScoreUrl에 문제 발생. 5점으로 출력");
		              review.setDetailScoreUrl("resources/images/icons _ emoji/Star Struck.png");
		              review.setScoremessage("정말 최고예요!");
				  }
				  
				  List<ReviewUploadFileDto> reviewFileDtos = serviceR.rSelectFileByReviewId(reviewId);
				  List<String> photoUrls = new ArrayList<>();
				  for (ReviewUploadFileDto fileDto : reviewFileDtos) {
					  photoUrls.add("/roadproject/resources/reviewupload/" + fileDto.getNfilename());
				  }
				  review.setPhotoUrls(photoUrls);
				  
				  
				  
			  }
	    	
	    	//점수에 따라 나오는 아이콘과 텍스트
	    	//사진 출력
	    	
	        return reviews;
	    }
	  
	  @PostMapping("/follows")
	  public ResponseEntity<String> insertFollow(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
	        System.out.println("review 접속");

	        System.out.println("follow() set 시작");
	        
	        followDto.setA_uid(2);	
	        followDto.setP_uid(3);

	        System.out.println("follow() set 완료");

	        try {
	            if (serviceF.isFollow(followDto) > 0) {
	                String er = "이미 팔로우한 친구입니다.";
	                System.out.println(er);
	                return ResponseEntity.ok().body("{\"message\": \"" + er + "\"}");
	            } else {
	                String ok = "팔로우 성공!";
	                System.out.println(ok);
	                serviceF.insertFollow(followDto);
	                return ResponseEntity.ok().body("{\"message\": \"" + ok + "\"}");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body("{\"message\": \"에러 발생: " + e.getMessage() + "\"}");
	        }
	    }
	  
	  @PostMapping("/unfollow")
	  public ResponseEntity<String> unFollow(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
	        System.out.println("review 접속");

	        System.out.println("unfollow() set 시작");

	        followDto.setP_uid(3);
	        followDto.setA_uid(2);

	        System.out.println("unfollow() set 완료");

	        try {
	            if (serviceF.isFollow(followDto) > 0) {
	            	String ok = "팔로우를 취소했습니다!";
	                System.out.println(ok);
	                serviceF.unFollow(followDto);
	                return ResponseEntity.ok().body("{\"message\": \"" + ok + "\"}");
	            } else {
	            	String er = "팔로우하지 않은 상대입니다.";
	                System.out.println(er);
	                return ResponseEntity.ok().body("{\"message\": \"" + er + "\"}");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body("{\"message\": \"에러 발생: " + e.getMessage() + "\"}");
	        }
	    }
	  
	}