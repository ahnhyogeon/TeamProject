package com.pk.roadproject;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pk.dao.MenuDao;
import com.pk.dao.MenuUploadDao;
import com.pk.dto.MenuDto;
import com.pk.dto.MenuUploadFileDto;
import com.pk.service.GetMenuService;
import com.pk.service.MenuGetListService;
import com.pk.service.MenuTrashFileDel;
import com.pk.service.SetMenuEditService;
import com.pk.service.SetMenuService;

@Controller
public class MenuController {
	
	@Autowired
	MenuGetListService getList;
	
	@Autowired
	GetMenuService getMenu;
	
	@Autowired
	SetMenuEditService setMenuEdit;
	
	@Autowired
	MenuDao mdao;
	
	@Autowired
	MenuDto mdto;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	HttpSession session;
	
	//insert
	@Autowired
	SetMenuService setMenu;
	
	@Autowired
	MenuUploadFileDto mUploadFileDto;
	
	@Autowired
	MenuUploadDao mUploadDao;
	
	@Autowired
	MenuTrashFileDel MenuTrashFileDel;
	
	@RequestMapping("/menu")
	public String list(
			@RequestParam(value="cpg", defaultValue="1") int cpg, 
			@RequestParam(value="searchname", defaultValue="") String searchname,
			@RequestParam(value="searchvalue", defaultValue="") String searchvalue,
			Model model) {
		System.out.println("menu() 실행됨");
		String imnum = UUID.randomUUID().toString();		
		model.addAttribute("imnum", imnum);
		int rbusiness = Integer.parseInt( (String) session.getAttribute("buisness"));
		System.out.println(rbusiness);
		//int mbusiness = Integer.parseInt(business);
		model.addAttribute("business", rbusiness);
        model.addAttribute("cpg" , cpg);
        model.addAttribute("searchname", searchname);
        model.addAttribute("searchvalue", searchvalue);
        getList.excute(model);
        MenuTrashFileDel.menuDelCom();
        
		return "menu.tiles";
	}
	
	@RequestMapping("/AllMenu")
	public String alllist(
			@RequestParam(value="cpg", defaultValue="1") int cpg, 
			@RequestParam(value="searchname", defaultValue="") String searchname,
			@RequestParam(value="searchvalue", defaultValue="") String searchvalue,
			Model model) {
		System.out.println("Allmenu() 실행됨");
		//int mbusiness = Integer.parseInt(business);
        model.addAttribute("cpg" , cpg);
        model.addAttribute("searchname", searchname);
        model.addAttribute("searchvalue", searchvalue);
        getList.excute(model);
        MenuTrashFileDel.menuDelCom();
      
		return "AllMenu";
	}
	
	@GetMapping("/mRegister")
	public String mRegister(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("mRegister() 실행됨");
		
		String upDir = servletContext.getRealPath("/resources/");
		System.out.println(upDir);
		String imnum = UUID.randomUUID().toString();		
		model.addAttribute("imnum", imnum);
	
		System.out.println(request.getHeader(("Referer")));

		return "mRegister";
		
	}
	
	@PostMapping("/mRegister")
	public String mRegisterOk(HttpServletRequest request, HttpServletResponse response, Model model,
								@RequestParam String thumbnail) {
		
		System.out.println("mRegisterok() 실행됨");
		
		model.addAttribute("request", request);
		model.addAttribute("thumbnail", thumbnail);
		setMenu.excute(model);
		
		 return "redirect:menu";
		
	}
	
	@PostMapping("/menuedit")
	public String edit(HttpServletRequest request, HttpServletResponse response,Model model,
						@RequestParam("id") int id) {
		System.out.println("menuedit() 실행됨");
		
		//model.addAttribute("increaseHit", false);
		try {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		model.addAttribute("req", request);
		getMenu.excute(model);		
		
		
		}
	    catch(Exception e) {
		 e.printStackTrace();
		
		 }
		return "menu";	
	}
	
	@PostMapping("/menueditok")
	public String editok( HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("menueditok() 실행됨");
		
		String ids = request.getParameter("id");
		System.out.println(ids);
		
		Map<String, Object> params = new HashMap<>();
		try {
			params.put("id", Integer.parseInt(ids));
		
			
		}catch(NumberFormatException e) {
			model.addAttribute("error", "에러가 발생했습니다.");
			return "redirect:partneredit2";
		}
		model.addAttribute("request", request);
		setMenuEdit.excute(model);
		
		return "redirect:menu";
	}
	
	
	@PostMapping("/mupload")
	@ResponseBody
	public ResponseEntity<?> handleImageUpload(
			@RequestParam("file") MultipartFile uploadFile,
			@RequestParam("imnum") String imnum){
		System.out.println("mupload() 실행됨");
		if(!uploadFile.isEmpty()) {
			try {
				//파일정보 추출
				String oFilename = uploadFile.getOriginalFilename();
				
				//확장자 추출
				String ext = oFilename.substring(oFilename.lastIndexOf(".") + 1).toLowerCase();
				
				//새파일 
				String nFilename = Long.toString(System.currentTimeMillis() / 1000L) + "." + ext;
				
				//파일크기
				long filesize = uploadFile.getSize();
				
				/*
				//추후 로그인 연동되면 회원아이디로 등록예정
				String userid = "guest";
				*/
			
				//경로설정
				String uploadDir = servletContext.getRealPath("/resources/menu/");
				System.out.println(uploadDir);
				//업로드
				File serverFile = new File(uploadDir + nFilename);
				uploadFile.transferTo(serverFile);
			    	
				String json = "{\"url\":\"" + "/roadproject/resources/menu/" + nFilename + "\"}";
				String imageUrl = "/roadproject/resources/menu/" + nFilename;
				//데이터베이스 저장
				mUploadFileDto.setExt(ext);
				mUploadFileDto.setFilesize(filesize);
				mUploadFileDto.setImnum(imnum);
				mUploadFileDto.setNfilename(nFilename);
				mUploadFileDto.setOfilename(oFilename);
				mUploadFileDto.setThumbnail(imageUrl);
				
				System.out.println(mUploadFileDto);
				
				mUploadDao.mInsertFile(mUploadFileDto);
			    
			
				
				
				return ResponseEntity.ok().body(json);
				
			}catch(Exception e) {
				e.printStackTrace();
				return ResponseEntity.badRequest().body("upload Error");
			}
			
		}else {
		   return ResponseEntity.badRequest().body("noFile");
		}   
	}
	
	
}
