package com.pk.roadproject;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pk.dto.FollowDto;
import com.pk.dto.MemberDto;
import com.pk.dto.ReviewDto;
import com.pk.service.FollowService;
import com.pk.service.MemberService;
import com.pk.service.ReviewService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FollowController {
	
	private static final Logger logger = LoggerFactory.getLogger(FollowController.class);
	
	@Inject
	private MemberService service;
	
	@Inject
	private FollowService serviceF;
	
	@Inject
	private ReviewService serviceR;
	
	MemberDto memberDto = new MemberDto();
	FollowDto followDto = new FollowDto();
	ReviewDto reviewDto = new ReviewDto();

	  @RequestMapping(value = "/review", method = RequestMethod.GET)
	  public String review(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		  System.out.println("review 접속");
		  		  
		  List<ReviewDto> reviews = serviceR.reviewSelectList(reviewDto);
		  for(ReviewDto review : reviews) {
			  if(review.getRating() == 0 || review.getHits() == 0) {
				  review.setResult(0);
			  }else {
			  double result = (review.getRating() * 100) / (double) review.getHits();
			  review.setResult(result);
			  }
		  }
		  model.addAttribute("reviews", reviews);
		  return "review.tiles";
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
		  
		  String reviewId = request.getParameter("userid");
		  reviewDto.setUserid(reviewId);
		  
		  model.addAttribute("id", reviewId);
		  
		  return "reviewEdit.tiles";
	  }
	  
	  @PostMapping("reviewEditok")
	  public String reviewEditok(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		  
		  System.out.println("reviewEditok 접속");
		  
		  reviewDto.setUserid((request.getParameter("userid")));
		  reviewDto.setNickname(request.getParameter("nickname"));
		  reviewDto.setTitle(request.getParameter("title"));
		  reviewDto.setDetail(request.getParameter("detail"));
		  reviewDto.setHashtag(request.getParameter("hashtag"));
		  System.out.println(reviewDto.getNickname() + " set 완료");
		  
		  serviceR.insertReview(reviewDto);
		  model.addAttribute("reviews", reviewDto);
		  
		  return "redirect:review";
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
	  
	  @PostMapping("/follow")
	  public ResponseEntity<String> insertFollow(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
	        System.out.println("review 접속");

	        System.out.println("follow() set 시작");
	        
	        System.out.println(request.getAttribute("userId"));
	        
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