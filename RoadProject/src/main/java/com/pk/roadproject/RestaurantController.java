package com.pk.roadproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pk.dao.RestarauntDao;
import com.pk.service.RestGetListService;


@Controller
public class RestaurantController {

		@Autowired
		RestGetListService getList;
		
		@Autowired
		RestarauntDao dao;


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
}
