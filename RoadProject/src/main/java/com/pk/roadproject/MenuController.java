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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pk.dao.MenuDao;
import com.pk.dao.MenuUploadDao;
import com.pk.dao.MenupanUploadDao;
import com.pk.dto.MenuDto;
import com.pk.dto.MenuUploadFileDto;
import com.pk.dto.MenupanFileDto;
import com.pk.service.GetMenuService;
import com.pk.service.GetRestService;
import com.pk.service.MenuGetListService;
import com.pk.service.MenuTrashFileDel;
import com.pk.service.SetMenuEditService;
import com.pk.service.SetMenuService;
import com.pk.service.SetOtherRestEditService;

@Controller
public class MenuController {
	
	@Autowired
	MenuGetListService getList;
	
	@Autowired
	GetMenuService getMenu;
	
	@Autowired
	GetRestService getRest;
	
	@Autowired
	SetMenuEditService setMenuEdit;
	
	@Autowired
	SetOtherRestEditService setOtherRestEdit;
	
	@Autowired
	MenuDao mdao;
	
	@Autowired
	MenuDto mdto;
	
	@Autowired
	MenupanFileDto mpUploadFileDto;
	
	@Autowired
	MenupanUploadDao mpUploadDao;
	
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
	
	@RequestMapping(value = "/menu", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(
			@RequestParam(value="cpg", defaultValue="1") int cpg, 
			@RequestParam(value="searchname", defaultValue="") String searchname,
			@RequestParam(value="searchvalue", defaultValue="") String searchvalue,
			Model model) {
		System.out.println("menu() 실행됨");
		
		MenuDto mdto = (MenuDto) session.getAttribute("mdto");
		
        if (mdto != null) {
        	System.out.println("mdto!");
            model.addAttribute("mdto", mdto);
            System.out.println("!!"+mdto);
            
        }
        else {
        	System.out.println("mdto null!");
        }
		
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
        getRest.excute(model);
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

	
	 
	@RequestMapping(value = "menuedit", method = {RequestMethod.GET, RequestMethod.POST})  //responsebody 쓰면 json타입으로 반환해야함
	public String medit(HttpServletRequest request, HttpServletResponse response,Model model,
						@RequestParam("id") int id) {
		System.out.println("menuedit() 실행됨");
	    	
		/*
		if(session.getAttribute("mdto") != null) {
			session.removeAttribute("mdto");
		}
		*/
		
		//model.addAttribute("increaseHit", false);
		try {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		System.out.println(id);
		model.addAttribute("req", request);
		getMenu.excute(model);
		mdto = (MenuDto) model.getAttribute("mdto"); //model에 담겨진 mdto를 가져옴
        System.out.println("MenuDto: " + mdto);
		model.addAttribute("test", "test");

		
		System.out.println("Model: " + model);
		System.out.println("mdto: " + model.getAttribute("mdto"));
		System.out.println("test: " + model.getAttribute("test"));
		
		session.setAttribute("mdto", mdto);
        System.out.println("현재 세션에 담긴 값 : " + session.getAttribute("mdto"));		
		}
	    catch(Exception e) {
		 e.printStackTrace();
		 System.out.println("오류발생");
		 }

	    return "menu.tiles";	

	}
	
	@PostMapping("/menueditok")  //가게 info, 메뉴판 src 업데이트
	public String editok( HttpServletRequest request, HttpServletResponse response, Model model) {
		
		System.out.println("menueditok() 실행됨");
		System.out.println("가게 id값 : " + session.getAttribute("rest_id"));
		int ids =  Integer.parseInt((String) session.getAttribute("rest_id"));
		System.out.println(ids);
		
		Map<String, Object> params = new HashMap<>();
		try {
			params.put("id", ids);
		
			
		}catch(NumberFormatException e) {
			model.addAttribute("error", "에러가 발생했습니다.");
			return "redirect:partneredit2";
		}
		model.addAttribute("request", request);
		setOtherRestEdit.excute(model);
		
		return "redirect:menu";
	}
	
	
	@PostMapping("/mupload")  //메뉴(썸네일)에 대한 업로드
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
	
	
	@PostMapping("/mpupload")  //메뉴판에 대한 업로드
	@ResponseBody
	public ResponseEntity<?> handleImageUpload2(
			@RequestParam("file") MultipartFile uploadFile,
			@RequestParam("imnum") String imnum){
		System.out.println("mpupload() 실행됨");
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
				String uploadDir = servletContext.getRealPath("/resources/menupan/");
				System.out.println(uploadDir);
				//업로드
				File serverFile = new File(uploadDir + nFilename);
				uploadFile.transferTo(serverFile);
			    	
				String json = "{\"url\":\"" + "/roadproject/resources/menupan/" + nFilename + "\"}";
				String imageUrl = "/roadproject/resources/menupan/" + nFilename;
				//데이터베이스 저장
				mpUploadFileDto.setExt(ext);
				mpUploadFileDto.setFilesize(filesize);
				mpUploadFileDto.setImnum(imnum);
				mpUploadFileDto.setNfilename(nFilename);
				mpUploadFileDto.setOfilename(oFilename);
				mpUploadFileDto.setMenupan_src(imageUrl);
				
				System.out.println(mpUploadFileDto);
				
				mpUploadDao.mpInsertFile(mpUploadFileDto);
			    
			
				
				
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
