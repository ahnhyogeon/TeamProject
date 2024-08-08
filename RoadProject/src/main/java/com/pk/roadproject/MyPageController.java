package com.pk.roadproject;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pk.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
    private MypageService service;

    @Autowired
    private ServletContext servletContext;

    
    @GetMapping("/{userId}")
    public String getMypage(@PathVariable int userId, Model model) throws Exception {
        logger.info("Fetching data for user id: {}", userId);

        int followerCount = service.getFollowerCount(userId);
        int followingCount = service.getFollowingCount(userId);
        int reviewCount = service.getReviewCount(userId);
        List<Map<String, Object>> topRatedReviews = service.getTopRatedReviews(userId);
        List<Map<String, Object>> recentReviews = service.getRecentReviews(userId);

        model.addAttribute("followerCount", followerCount);
        model.addAttribute("followingCount", followingCount);
        model.addAttribute("reviewCount", reviewCount);
        model.addAttribute("topRatedReviews", topRatedReviews);
        model.addAttribute("recentReviews", recentReviews);
        
        
        System.out.println("userid:" + userId);

        return "mypage";
    }
}
