package com.pk.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pk.dao.MenuDao;
import com.pk.dao.MenuUploadDao;
import com.pk.dto.MenuDto;


@Service
public class SetMenuEditService implements MenuService {

	@Autowired
	MenuDao mdao;
	
	@Autowired
	MenuUploadDao mudao;
	
	@Override
	public void excute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("request");
		
		MenuDto mdto = new MenuDto();
		
		mdto.setM_name(req.getParameter("m_name"));
		mdto.setM_cost(req.getParameter("m_cost"));
		//mdto.setM_code(req.getParameter("m_code"));
		mdto.setM_intro(req.getParameter("m_intro"));
		mdto.setImnum(req.getParameter("imnum"));
		mdto.setId(Integer.parseInt(req.getParameter("menu_id")));
		mdto.setThumbnail(req.getParameter("thumbnail"));
		
		mdao.menuUpdate(mdto);
		
		Map<String, Object> paramsFile = new HashMap<>();
		paramsFile.put("businesss", mdto.getBusiness());
		paramsFile.put("imnum", mdto.getImnum());
		paramsFile.put("menu_id", mdto.getId());
		
		mudao.mUpdateFile(paramsFile);

	}

}
