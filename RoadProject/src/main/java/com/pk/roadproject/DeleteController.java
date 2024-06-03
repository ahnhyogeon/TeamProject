package com.pk.roadproject;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.pk.dao.MenuDao;
import com.pk.dao.MenuUploadDao;
import com.pk.dao.RestUploadDao;
import com.pk.dao.RestaurantDao;
import com.pk.dto.MenuUploadFileDto;
import com.pk.dto.RestUploadFileDto;

@RestController
public class DeleteController {
	
	@Autowired
	RestUploadDao ruDao;
	
	@Autowired
	RestaurantDao rdao;
	
	@Autowired
	MenuUploadDao muDao;
	
	@Autowired
	MenuDao mdao;
	
	@Autowired
	ServletContext servletContext;

    
	@PostMapping("/del")
	@ResponseBody   //xml, json타입을 받을 때는 reponsebody
	public String delok(@RequestParam("id") int id, @RequestParam("business") int business) { //여기 id는 r_list id
	
		 	System.out.println("del() 삭제로직 수행");
		 	
			try {
			Map<String, Object> params = new HashMap<>();
			params.put("id", id);
			params.put("business", business);
					
			int result = rdao.validateBusiness(params);
			System.out.println(result);
			if(result > 0) { //result가 1이면 true --> 파일db를 읽어서 파일삭제, 파일레코드 삭제, 게시판 레코드 삭제
				String path = servletContext.getRealPath("/resources/upload/");
				System.out.println(path);
				//파일 db읽어서
				System.out.println(id); 
				List<RestUploadFileDto> rfDtos = ruDao.rSelectFileByRestId(id);
				System.out.println(rfDtos);
				for(RestUploadFileDto fDto : rfDtos) { //가게업로드파일dto의 fDto를 rfDtos로 받아서 for문을 돌린다.
					String delFileName = fDto.getNfilename();
					File file = new File(path + delFileName);
					//파일을 삭제
					if(file.exists()) {
						file.delete();
					}
					else {
						System.out.println("파일이 없습니다.");
					}
					//파일 레코드 삭제
					ruDao.rDeleteFile(fDto.getId()); //여기 아이디는 restId가 아닌 img 1개에 대한 id (rest id로 삭제하면 여러개가 삭제되니까!)
				}
				//가게 레코드 삭제
				rdao.restDelete(id);
				return "1";	
			}
			else {
				return "0";
			} 
			
		 }
			catch(Exception e) {
				e.printStackTrace();
				return "0";
			}
			
			
	}
	
	@PostMapping("/mDel")
	@ResponseBody   //xml, json타입을 받을 때는 reponsebody
	public String mdelok(@RequestParam("id") int id, @RequestParam("business") int business) { //여기 id는 r_list id
			//int mbusiness = Integer.parseInt(business);
		 	System.out.println("mdel() 삭제로직 수행");
		 	
			try {
			Map<String, Object> params = new HashMap<>();
			params.put("id", id);
			params.put("business", business);
					
			int result = mdao.mValidateBusiness(params);
			System.out.println(result);
			if(result > 0) { //result가 1이면 true --> 파일db를 읽어서 파일삭제, 파일레코드 삭제, 게시판 레코드 삭제
				String path = servletContext.getRealPath("/resources/menu/");
				System.out.println(path);
				//파일 db읽어서
				System.out.println(id); 
				List<MenuUploadFileDto> mfDtos = muDao.mSelectFileByBusiness(business);
				System.out.println(mfDtos);
				for(MenuUploadFileDto mDto : mfDtos) { //가게업로드파일dto의 fDto를 rfDtos로 받아서 for문을 돌린다.
					String delFileName = mDto.getNfilename();
					File file = new File(path + delFileName);
					//파일을 삭제
					if(file.exists()) {
						file.delete();
					}
					else {
						System.out.println("파일이 없습니다.");
					}
					//파일 레코드 삭제
					muDao.mDeleteFile(mDto.getId()); //여기 아이디는 restId가 아닌 img 1개에 대한 id (rest id로 삭제하면 여러개가 삭제되니까!)
				}
				//가게 레코드 삭제
				mdao.menuDelete(id);
				return "1";	
			}
			else {
				return "0";
			} 
			
		 }
			catch(Exception e) {
				e.printStackTrace();
				return "0";
			}
			
			
	}
	
	
}
