package com.pk.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pk.dao.RestUploadDao;
import com.pk.dao.RestaurantDao;
import com.pk.dto.RestaurantDto;

@Service
public class SetRestService implements RestaurantService {
	
	@Autowired
	RestaurantDao rdao;
	
	@Autowired
	RestUploadDao rudao;
	
	@Autowired
	HttpSession session;
	
	@Override
	public void excute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("request");
		
		
		RestaurantDto rdto = new RestaurantDto();
		
		rdto.setR_name(req.getParameter("r_name"));
		rdto.setBusiness(Integer.parseInt( (String) session.getAttribute("buisness")));
		rdto.setR_addr1(req.getParameter("r_addr1"));
		rdto.setR_addr2(req.getParameter("r_addr2"));
		rdto.setR_tel(req.getParameter("r_tel"));
		rdto.setR_url(req.getParameter("r_url"));
		rdto.setImnum(req.getParameter("imnum"));
		rdto.setR_intro(req.getParameter("r_intro"));
		rdto.setNotice(req.getParameter("notice"));
		rdto.setR_time(req.getParameter("r_time"));
			
		rdao.restInsert(rdto);	
		session.setAttribute("rest_id", rdto.getId());
		System.out.println("세션에 저장된 가게id값 : " + session.getAttribute("rest_id"));
		
		Map<String, Object> paramsFile = new HashMap(); //map put 으로 rest_id와 imnum을 넘겨줘서 rest_img와 rest의 db가 이어지게 함.
		paramsFile.put("rest_id", rdto.getId());
		paramsFile.put("imnum", rdto.getImnum());
		
		rudao.rUpdateFile(paramsFile);

	}

}
