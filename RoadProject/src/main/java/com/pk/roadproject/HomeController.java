package com.pk.roadproject;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pk.dto.FollowDto;
import com.pk.dto.MemberDto;
import com.pk.service.FollowService;
import com.pk.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private MemberService service;
	
	@Inject
	private FollowService serviceF;
	
	MemberDto memberDto = new MemberDto();
	FollowDto followDto = new FollowDto();
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	 @RequestMapping(value = "/content1", method = RequestMethod.GET)
	  public String list(Locale locale, Model model) throws Exception {
		 System.out.println("content1 접속");
		 logger.info("home");
		 
		 MemberDto search = new MemberDto();
		    search.setName("학생1");
			
		    List<MemberDto> memberList = service.selectMember();
			search = service.searchName(search);
			
			model.addAttribute("memberList", memberList);
			model.addAttribute("search", search);
			model.addAttribute("url", "content1" );
		  
			return "list.tiles";
	  }	

	  @RequestMapping(value = "/content2", method = RequestMethod.GET)
	  public String detail(Locale locale, Model model) {
		  System.out.println("content2 접속");
		  model.addAttribute("url", "content2" );
		  return "detail.tiles";
	  }
	  
	  @RequestMapping(value = "/content3", method = RequestMethod.GET)
	    public String join(Locale locale, Model model) {
	        logger.info("content3 접속");
	        return "join.tiles";
	    }
	  
	  @RequestMapping(value = "/review", method = RequestMethod.GET)
	  public String review(Locale locale, Model model) throws Exception {
		  System.out.println("review 접속");
		 
		  FollowDto follow = new FollowDto();
		  
		  	System.out.println("follow() set 시작");
		  
			follow.setA_uname("테스트1");
			follow.setP_uname("테스트2");
			follow.setA_uid(2);
			follow.setP_uid(3);
			
			System.out.println("follow() set 완료");
			
			serviceF.follow(follow);
		  
		  return "review.tiles";
	  }
	  
	  //회원가입
	  @RequestMapping(value = "/addMember", method = RequestMethod.POST)
	    public ModelAndView addMember(
	            @RequestParam String name,
	            @RequestParam String nickname,
	            @RequestParam String userid,
	            @RequestParam String password,
	            @RequestParam String tel,
	            @RequestParam int zipcode,
	            @RequestParam String addr1,
	            @RequestParam String addr2,
	            @RequestParam String birth,
	            @RequestParam String email,
	            @RequestParam(required = false) String role,
	            @RequestParam(required = false) String buisness) throws Exception {
		  
		  int role2 = 0;
		  System.out.println(role);
		  if(role == null) {
			  role2 = 0;
		  }
		  else {
			  role2 = Integer.parseInt(role);
		  }
	        
		  if(role2 == 0) {
	        memberDto.setName(name);
	        memberDto.setNickname(nickname);
	        memberDto.setUserid(userid);
	        memberDto.setPassword(password);
	        memberDto.setTel(tel);
	        memberDto.setZipcode(zipcode);
	        memberDto.setAddr1(addr1);
	        memberDto.setAddr2(addr2);
	        memberDto.setBirth(birth);
	        memberDto.setEmail(email);

	        service.insertDB(memberDto);
		  }
		  else if(role2 == 2) {
		      memberDto.setName(name);
		      memberDto.setNickname(nickname);
		      memberDto.setUserid(userid);
		      memberDto.setPassword(password);
		      memberDto.setTel(tel);
		      memberDto.setZipcode(zipcode);
		      memberDto.setAddr1(addr1);
		      memberDto.setAddr2(addr2);
		      memberDto.setBirth(birth);
		      memberDto.setEmail(email);
		      memberDto.setRole(role2);
		      memberDto.setBuisness(buisness);

		      service.insertDB(memberDto);
		  }

	        ModelAndView modelAndView = new ModelAndView("redirect:/content1");
	        
	        return modelAndView;
	    }
	  
	  @RequestMapping(value = "/searchMember", method = RequestMethod.POST)
	  public ModelAndView seachMember(
		        @RequestParam(required = false) String userid,
		        @RequestParam(required = false) String password,
		        HttpSession session) throws Exception {
		  
		    
		    memberDto.setUserid(userid);
		    memberDto.setPassword(password);
		  
		    if(service.searchId(memberDto)) {
		        System.out.println("로그인 되었습니다.");
		        System.out.println(memberDto.getNickname());
		        
		        List<MemberDto> list = service.selectMemberOne();
		        
		        if (!list.isEmpty()) {
		            MemberDto firstMember = list.get(0);
		            String nickname = firstMember.getNickname();
		            String userid2 = firstMember.getUserid();
		            session.setAttribute("nickname", nickname);
		            session.setAttribute("userid", userid2);
		        }
		        
		        
		        
		        System.out.println(session.getAttribute("nickname"));
		    }
		    else {
		        System.out.println("로그인에 실패했습니다.");
		    }
		    
		    
		    ModelAndView modelAndView = new ModelAndView("redirect:/content2");
		    
		    return modelAndView;
		}
	
}
