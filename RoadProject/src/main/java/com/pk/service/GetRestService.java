package com.pk.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pk.dao.RestaurantDao;
import com.pk.dto.RestaurantDto;


@Service
public class GetRestService implements RestaurantService {
	
	@Autowired
	RestaurantDao rdao;
	
	@Override
	public void excute(Model model) {
		Map<String, Object> map = model.asMap();
		  HttpServletRequest req = (HttpServletRequest) map.get("req");
		  int rbusiness = Integer.parseInt(req.getParameter("business"));
		  /*
		  boolean increaseHit = (boolean) map.get("increaseHit");
		  if(increaseHit) { //쿠키가 없을 때만 조회수를 증가한다.
		     dao.increaseHit(selectId);
		  }
		  */
		  List<RestaurantDto> rdto = rdao.rSelectDetail(rbusiness);
		  model.addAttribute("rdto", rdto);
		}

	}
