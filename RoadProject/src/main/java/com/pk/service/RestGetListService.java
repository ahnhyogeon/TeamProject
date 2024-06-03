package com.pk.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pk.dao.RestaurantDao;
import com.pk.dto.RestaurantDto;
import com.pk.util.Paging;

@Service
public class RestGetListService implements RestaurantService {

	@Autowired
	Paging pg;
	
	@Autowired
	RestaurantDao dao;
	
	@Override
	public void excute(Model model) {
		Map<String, Object> map = model.asMap();
		int currentPage = (int) map.get("cpg");
		int postsPerPage = 10; 
		int pagesPerBlock = 5; 
		int totalPosts = dao.selectRestCount(map);
		pg.setCurrentPage(currentPage);
		pg.setPagesPerBlock(pagesPerBlock);
		pg.setPostsPerPage(postsPerPage);
		pg.setTotalPosts(totalPosts);
		int limitCount = (currentPage - 1) * postsPerPage;
		
        map.put("currentPage", limitCount);
        map.put("listCount", postsPerPage);    
        
		List<RestaurantDto> r_list = dao.restList(map);	
		model.addAttribute("pg", pg);
		model.addAttribute("r_list", r_list);
	}

}
