package com.pk.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pk.dao.RestaurantDao;
import com.pk.dto.RestaurantDto;

@Service
public class SetNoticeEdit implements RestaurantService {
    
	@Autowired
	RestaurantDao rdao;
	
	@Override
	public void excute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("request");
		
		RestaurantDto rdto = new RestaurantDto();
	
		/*
		rdto.setR_name(req.getParameter("r_name"));
		rdto.setR_code(Integer.parseInt(req.getParameter("r_code")));
		rdto.setR_addr1(req.getParameter("r_addr1"));
		rdto.setR_addr2(req.getParameter("r_addr2"));
			rdto.setR_tel(req.getParameter("r_tel"));
		*/
		rdto.setId(Integer.parseInt(req.getParameter("id")));
		rdto.setNotice(req.getParameter("notice"));
		
		rdao.noticeUpdate(rdto);


	}

}
