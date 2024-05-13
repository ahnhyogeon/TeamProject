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
import org.springframework.web.bind.annotation.PostMapping; 
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

	  @RequestMapping(value = "/detail", method = RequestMethod.GET)
	  public String detail(Locale locale, Model model) {
		  System.out.println("content2 접속");
		  model.addAttribute("url", "content2" );
		  return "detail.tiles";
	  }
	  
	  //회원유형선택
	  @RequestMapping(value = "/SelectJoin", method = RequestMethod.GET)
	  public String SelectJoin(Locale locale, Model model) {
		  System.out.println("content4 접속");
		  model.addAttribute("url", "content4" );
		  return "SelectJoin.tiles";
	  }
	  
	  @RequestMapping(value = "/join", method = {RequestMethod.GET, RequestMethod.POST})
	    public String join(@RequestParam(required = false) String role, Locale locale, Model model) {
	        logger.info("content3 접속");
	        
	        model.addAttribute("role", role);
	        
	        return "join.tiles";
	    }
	  
	  @RequestMapping(value = "/map", method = RequestMethod.GET)
	  public String map(Locale locale, Model model) {
		  System.out.println("map 접속");
		  
		  return "map.tiles";
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
			  role2 = 1;
		  }
		  else {
			  role2 = Integer.parseInt(role);
		  }
	        
		  if(role2 == 1) {
	        memberDto.setName(name);
	        memberDto.setNickname(nickname);
	        memberDto.setUserid(userid);
	        memberDto.setPassword(password);
	        memberDto.setTel(tel);
	        memberDto.setZipcode(zipcode);
	        memberDto.setAddr1(addr1);
	        memberDto.setAddr2(addr2);
	        memberDto.setBirth(birth);
	        memberDto.setRole(role2);
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
	  
	  //로그인
	  @RequestMapping(value = "/searchMember", method = RequestMethod.POST)
	  public ModelAndView searchMember(
			    @RequestParam(required = false) String userid,
			    @RequestParam(required = false) String password,
			    HttpSession session) throws Exception {
		  
		  
			      
		  		System.out.println(userid);
			    memberDto.setUserid(userid);
			    memberDto.setPassword(password);
			  
			    if (service.searchId(memberDto)) { // 로그인 확인
			        System.out.println("로그인 되었습니다.");
			        MemberDto search = new MemberDto();
		    
			
			        search.setUserid(userid);
			        search = service.searchNick(search);
			        
			        System.out.println(search); // 회원 정보 가져오기
			        String nick = search.getNickname();
			        int role = search.getRole();
			        System.out.println(nick);
			        
			        session.setAttribute("nickname", nick);
			        session.setAttribute("userid", userid);
			        session.setAttribute("role", role);
			        
			        System.out.println("id : "+session.getAttribute("userid")+", nick : "+session.getAttribute("nickname")+", role : "+session.getAttribute("role"));
			 
			    } else {
			        System.out.println("로그인에 실패했습니다.");
			    }

			    ModelAndView modelAndView = new ModelAndView("redirect:/detail");
			    return modelAndView;
			}
	  
	  @RequestMapping(value = "/logout", method = RequestMethod.GET)
	  public ModelAndView logout(HttpSession session) {
		  
		  session.invalidate();
		  System.out.println("로그아웃 완료");
		  
		  ModelAndView modelAndView = new ModelAndView("redirect:/detail");
		  return modelAndView;
	  }
	  
	  @RequestMapping(value = "/recommend", method = RequestMethod.GET)
	  public String recommend(Locale locale, Model model) {
		  System.out.println("recommend 접속");
		  
		  return "recommend.tiles";
	  }

	
}
