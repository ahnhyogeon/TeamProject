package com.pk.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pk.dao.MenuDao;
import com.pk.dto.MenuDto;




@Service
public class GetMenuService implements MenuService {
	
	@Autowired
	MenuDao mdao;
	
	@Override
	public void excute(Model model) {
		
		Map<String, Object> map = model.asMap();
		  HttpServletRequest req = (HttpServletRequest) map.get("req");
		  int selectId = Integer.parseInt(req.getParameter("id"));
		  /*
		  boolean increaseHit = (boolean) map.get("increaseHit");
		  if(increaseHit) { //쿠키가 없을 때만 조회수를 증가한다.
		     dao.increaseHit(selectId);
		  }
		  */
		  MenuDto mdto = mdao.mSelectDetail(selectId);
		  System.out.println(mdto);
		  model.addAttribute("mdto", mdto);
		}

	}


