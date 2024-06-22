package com.pk.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pk.dao.MenupanUploadDao;
import com.pk.dto.MenupanFileDto;

@Service
public class MenupanGetListService implements MenupanService {
	
	@Autowired
	MenupanUploadDao mpdao;
	
	@Autowired
	HttpSession session;
	
	@Override
	public void excute(Model model) {
		
		int rest_id = (int) session.getAttribute("rest_id");
	    
		List<MenupanFileDto> mp_list = mpdao.menupanSrcList(rest_id);	
		
		System.out.println(mp_list);
		
		model.addAttribute("mp_list", mp_list);

	}

}
