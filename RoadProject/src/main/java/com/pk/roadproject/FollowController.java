package com.pk.roadproject;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pk.dto.FollowDto;
import com.pk.dto.MemberDto;
import com.pk.service.FollowService;
import com.pk.service.MemberService;

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
	
	MemberDto memberDto = new MemberDto();
	FollowDto followDto = new FollowDto();

	  @RequestMapping(value = "/review", method = RequestMethod.GET)
	  public String review(Locale locale, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		  System.out.println("review 접속");
		  
		  memberDto.set
		  
		  
		  return "review.tiles";
	  }
	  
	  @PostMapping("/follow")
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