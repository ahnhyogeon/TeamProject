package com.pk.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pk.dao.RestUploadDao;
import com.pk.dao.RestaurantDao;
import com.pk.dto.RestaurantDto;

@Service
public class SetRestEditService implements RestaurantService {
	
	@Autowired
	RestaurantDao rdao;
	RestUploadDao rudao;
	
	@Override
	public void excute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("request");
		
		RestaurantDto rdto = new RestaurantDto();
		
		rdto.setR_name(req.getParameter("r_name"));
		rdto.setR_code(Integer.parseInt(req.getParameter("r_code")));
		rdto.setR_addr1(req.getParameter("r_addr1"));
		rdto.setR_addr2(req.getParameter("r_addr2"));
		rdto.setR_tel(req.getParameter("r_tel"));
		rdto.setR_url(req.getParameter("r_url"));
		rdto.setImnum(req.getParameter("imnum"));
		rdto.setId(Integer.parseInt(req.getParameter("id")));
			
		rdao.restUpdate(rdto);
		
		Map<String, Object> paramsFile = new HashMap<>();
		paramsFile.put("rest_id", rdto.getId());
		paramsFile.put("imnum", rdto.getImnum());
		
		rudao.rUpdateFile(paramsFile);

	}

}
