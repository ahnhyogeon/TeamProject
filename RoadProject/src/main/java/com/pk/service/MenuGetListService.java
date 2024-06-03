package com.pk.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pk.dao.MenuDao;
import com.pk.dto.MenuDto;
import com.pk.util.Paging;

@Service
public class MenuGetListService implements MenuService {
	
	@Autowired
	Paging pg;
	
	@Autowired
	MenuDao dao;
	
	
	@Override
	public void excute(Model model) {
		Map<String, Object> map = model.asMap();
		int currentPage = (int) map.get("cpg");
		int postsPerPage = 10; 
		int pagesPerBlock = 5; 
		int totalPosts = dao.selectMenuCount(map);
		pg.setCurrentPage(currentPage);
		pg.setPagesPerBlock(pagesPerBlock);
		pg.setPostsPerPage(postsPerPage);
		pg.setTotalPosts(totalPosts);
		int limitCount = (currentPage - 1) * postsPerPage;
		
        map.put("currentPage", limitCount);
        map.put("listCount", postsPerPage);    
  

		List<MenuDto> m_list = dao.menuList(map);
		model.addAttribute("pg", pg);
	    model.addAttribute("m_list", m_list);

	}

}
