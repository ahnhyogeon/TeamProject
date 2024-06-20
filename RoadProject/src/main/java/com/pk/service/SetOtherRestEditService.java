package com.pk.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pk.dao.MenupanUploadDao;
import com.pk.dao.RestaurantDao;
import com.pk.dto.RestaurantDto;

@Service
public class SetOtherRestEditService implements RestaurantService {

	@Autowired
	RestaurantDao rdao;
	
	@Autowired
	MenupanUploadDao mpudao;
	
	@Autowired
	HttpSession session;
	
	@Override
	public void excute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("request"); 
		
		RestaurantDto rdto = new RestaurantDto();
		
		rdto.setId(Integer.parseInt((String) session.getAttribute("rest_id")));
		rdto.setMenupan_src(req.getParameter("menupan_src"));
		rdto.setInfo(req.getParameter("info"));
		rdto.setImnum(req.getParameter("imnum"));
		
		rdao.otherRestUpdate(rdto); 
     		
		Map<String, Object> paramsFile = new HashMap<>();
	    System.out.println("가게id값 : " + rdto.getId());
		paramsFile.put("rest_id", rdto.getId());
		paramsFile.put("imnum", rdto.getImnum());
 		
		mpudao.mpUpdateFile(paramsFile);
        
	}

}
