package com.pk.roadproject;

import java.io.File;
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
import com.pk.dto.ReviewDto;
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
	


	  @RequestMapping(value = "/review", method = RequestMethod.GET)
	  public String review(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		  System.out.println("review 접속");
		  
		  //리뷰 사진 첨부되면서 게시글은 보이지 않음. count만 표시
		  		  
		  List<ReviewDto> reviews = serviceR.reviewSelectList(reviewDto);
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
		  
		  return "review.tiles";
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
		  
		  System.out.println(reviewSearchCount);
		  System.out.println(reviewScoreResult);
		  
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
	  @GetMapping("/rating")
	  public String ratingReivew(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		 System.out.println("ratingReview() set 시작");

		  // 원래의 요청 URL을 세션에 저장
		  String referer = request.getHeader("Referer");
		  request.getSession().setAttribute("prevPage", referer);

		  int reviewId = Integer.parseInt(request.getParameter("id"));
		  reviewDto.setId(reviewId);

		  System.out.println("ratingReview() set 완료");

		  serviceR.ratingReview(reviewDto);

		  System.out.println("service 실행");

		  // 세션에서 원래 URL 가져오기
		  String prevPage = (String) request.getSession().getAttribute("prevPage");
		  if (prevPage != null) {
		      return "redirect:" + prevPage;
		  } else {
		      return "redirect:review";  // 기본 리디렉션 URL
		  }
	  }
	  
	  // 작업중
	  @RequestMapping(value= "/reviewEdit", method = RequestMethod.GET)
	  public String reviewEdit(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		  System.out.println("reviewEdit 접속");
		  		  
		  String imnum = UUID.randomUUID().toString(); // UUID를 사용하여 고유한 imnum 생성
		  reviewDto.setImnum(imnum);
	      model.addAttribute("imnum", imnum);
		  
		  return "reviewEdit.tiles";
	  }
	  
	 
	  
	  @RequestMapping(value= "/reviewDetail", method = RequestMethod.GET)
	  public String reviewDetail(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		  System.out.println("reviewDetail 접속");
		  	
		  int reviewId = Integer.parseInt(request.getParameter("id"));
		  reviewDto.setId(reviewId);
		  
		  System.out.println("set : " + reviewId);
		  
		  List<ReviewDto> reviews = serviceR.reviewDetail(reviewDto);
		  	  
		  for(ReviewDto review : reviews) {
			  if(review.getRating() == 0 || review.getHits() == 0) {
				  review.setResult(0);
			  }else {
				  double result = (review.getRating() * 100) / (double) review.getHits();
				  review.setResult(result);
			  }
		  }
		  model.addAttribute("reviews", reviews);
		  
		  return "reviewDetail.tiles";
	  }
	  
	  @PostMapping("/follows")
	  public ResponseEntity<String> insertFollow(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
	        System.out.println("review 접속");

	        System.out.println("follow() set 시작");
	        
	        followDto.setA_uname("테스트1");
	        followDto.setP_uname("테스트2");
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

	        followDto.setA_uname("테스트1");
	        followDto.setP_uname("테스트2");
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