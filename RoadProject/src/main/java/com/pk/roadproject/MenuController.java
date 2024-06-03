package com.pk.roadproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pk.dao.MenuDao;
import com.pk.service.MenuGetListService;

@Controller
public class MenuController {
	
	@Autowired
	MenuGetListService getList;
	
	@Autowired
	MenuDao dao;

	
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
}
