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

import com.pk.dao.RestarauntDao;
import com.pk.dto.RestaurantDto;
import com.pk.service.RestGetListService;

/*
import com.pk.dao.UploadDao;
import com.pk.dto.UploadFileDto;
import com.pk.service.TrashFileDel;
*/


@Controller
public class RestaurantController {

		@Autowired
		RestGetListService getList;
		
		@Autowired
		RestarauntDao rdao;
        
		@Autowired
		RestaurantDto rdto;
		
		@Autowired
		ServletContext servletContext;
		
		/*
		@Autowired
		UploadFileDto uploadFileDto;
		
		@Autowired
		UploadDao uploadDao;
		
		@Autowired
		TrashFileDel trashFileDel;
		*/
		
	@RequestMapping("/rest")
	public String rest(
			@RequestParam(value="cpg", defaultValue="1") int cpg, 
			@RequestParam(value="searchname", defaultValue="") String searchname,
			@RequestParam(value="searchvalue", defaultValue="") String searchvalue,
			Model model) {
		System.out.println("rest() 실행됨");
        model.addAttribute("cpg" , cpg);
        model.addAttribute("searchname", searchname);
        model.addAttribute("searchvalue", searchvalue);
        getList.excute(model);
        
		return "rest";
	}
	
	@GetMapping("/register")
	public String register(Model model) {
		System.out.println("register() 실행됨");
		String upDir = servletContext.getRealPath("/resources/");
		System.out.println(upDir);
		String imnum = UUID.randomUUID().toString();
		
		model.addAttribute("imnum", imnum);
		return "register";
	}
	
	@PostMapping("/register")
	public String writeok(
			@RequestParam(value="r_name", defaultValue="") String r_name,
			@RequestParam(value="r_addr1", defaultValue="") String r_addr1, 
			@RequestParam(value="r_addr2", defaultValue="") String r_addr2, 
			@RequestParam(value="r_tel", defaultValue="") String r_tel, 
			@RequestParam(value="r_url", defaultValue="") String r_url, 
			@RequestParam(value="r_intro", defaultValue="") String r_intro, 
			HttpServletRequest request, HttpServletResponse response, Model model) {
		
		System.out.println("registerok() 실행됨");
		//model.addAttribute("request", request);
		rdto.setR_name(r_name);
		rdto.setR_addr1(r_addr1);
		rdto.setR_addr2(r_addr2);
		rdto.setR_tel(r_tel);
		rdto.setR_url(r_url);
		rdto.setR_intro(r_intro);
		System.out.println(rdto);
		int result = rdao.restInsert(rdto);
		
		return "redirect:rest";
	}
	
	
}
