package com.pk.roadproject;

import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pk.dao.MenuDao;
import com.pk.service.MenuGetListService;
import com.pk.service.SetMenuService;

@Controller
public class MenuController {
	
	@Autowired
	MenuGetListService getList;
	
	@Autowired
	MenuDao dao;
	
	@Autowired
	ServletContext servletContext;
	
	//insert
	@Autowired
	SetMenuService setMenu;
	
	@RequestMapping("/menu")
	public String list(
			@RequestParam(value="business") String business,
			@RequestParam(value="cpg", defaultValue="1") int cpg, 
			@RequestParam(value="searchname", defaultValue="") String searchname,
			@RequestParam(value="searchvalue", defaultValue="") String searchvalue,
			Model model) {
		System.out.println("menu() 실행됨");
		model.addAttribute("business", business);
        model.addAttribute("cpg" , cpg);
        model.addAttribute("searchname", searchname);
        model.addAttribute("searchvalue", searchvalue);
        getList.excute(model);
        
		return "menu";
	}
	
	@GetMapping("/mRegister")
	public String mRegister(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("mRegister() 실행됨");
		/*
		String upDir = servletContext.getRealPath("/resources/");
		System.out.println(upDir);
		String imnum = UUID.randomUUID().toString();		
		model.addAttribute("imnum", imnum);
		*/
		System.out.println(request.getHeader(("Referer")));

		return "mRegister";
		
	}
	
	@PostMapping("/mRegister")
	public String mRegisterOk(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		System.out.println("mRegisterok() 실행됨");
		model.addAttribute("request", request);
		setMenu.excute(model);
		
		 if (request.getHeader("Referer") != null) {
			 System.out.println(request.getHeader(("Referer")));
			    return "redirect:/";
			  } else {
			    return "redirect:/";
			  }
		
	}
	
}
