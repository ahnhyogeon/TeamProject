package com.pk.roadproject;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pk.dao.RestUploadDao;
import com.pk.dao.RestaurantDao;
import com.pk.dto.RestUploadFileDto;
import com.pk.dto.RestaurantDto;
import com.pk.service.GetRestService;
import com.pk.service.RestGetListService;
import com.pk.service.RestTrashFileDel;
import com.pk.service.SetNoticeEdit;
import com.pk.service.SetRestEditService;
import com.pk.service.SetRestService;



@Controller
public class RestaurantController {

		@Autowired
		RestGetListService getList;
		
		@Autowired
		SetNoticeEdit noticeEdit;
		
		@Autowired
		GetRestService getRest;
		
		@Autowired
		SetRestEditService setRestEdit;
		
		@Autowired
		RestaurantDao rdao;
        
		@Autowired
		RestaurantDto rdto;
		
		@Autowired
		ServletContext servletContext;
		
		@Autowired
		HttpSession session;
		
		//insert
		@Autowired
		SetRestService setRest;
		
		@Autowired
		RestUploadFileDto rUploadFileDto;
		
		@Autowired
		RestUploadDao rUploadDao;
		
		@Autowired
		RestTrashFileDel RestTrashFileDel;
		
		
	@RequestMapping("/rest")
	public String rest(
			@RequestParam(value="cpg", defaultValue="1") int cpg, 
			@RequestParam(value="searchname", defaultValue="") String searchname,
			@RequestParam(value="searchvalue", defaultValue="") String searchvalue,
			Model model) {
		System.out.println("rest() 실행됨");
        model.addAttribute("cpg" , cpg);
        model.addAttribute("searchname", searchname);
        model.addAttribute("searchvalue", searchvalue);
        getList.excute(model);
        RestTrashFileDel.restDelCom();
        
		return "rest";
	}
	
	@RequestMapping("/restDetail")
	public String restdetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="cpg", defaultValue="1") int cpg,
			/*
			@RequestParam(value="searchname", defaultValue="") String searchname,
			@RequestParam(value="searchvalue", defaultValue="") String searchvalue,*/
			Model model) {
		System.out.println("restDetail() 실행됨");
        model.addAttribute("cpg" , cpg);
        /*
        model.addAttribute("searchname", searchname);
        model.addAttribute("searchvalue", searchvalue);
        */
        model.addAttribute("req", request);
        getRest.excute(model);
   
		return "restDetail";
	}
	
	@RequestMapping("/delrest")  //관리자만 들어갈 수 있는 삭제버튼이 있는 가게 리스트 페이지.
	public String delrest(
			@RequestParam(value="cpg", defaultValue="1") int cpg, 
			@RequestParam(value="searchname", defaultValue="") String searchname,
			@RequestParam(value="searchvalue", defaultValue="") String searchvalue,
			Model model) {
		System.out.println("delrest() 실행됨");
        model.addAttribute("cpg" , cpg);
        model.addAttribute("searchname", searchname);
        model.addAttribute("searchvalue", searchvalue);
        getList.excute(model);
        RestTrashFileDel.restDelCom();
		return "delrest";
	}
	
	/*
	@GetMapping("/register")
	public String register(Model model) {
		System.out.println("register() 실행됨");
		String upDir = servletContext.getRealPath("/resources/");
		System.out.println(upDir);
		String imnum = UUID.randomUUID().toString();
		model.addAttribute("imnum", imnum);
		return "register";
	}
	*/
	
	//등록하기
	@PostMapping("/registerok")
	public String registerOk(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		System.out.println("registerok() 실행됨");
		int rbusiness = Integer.parseInt( (String) session.getAttribute("buisness"));
		model.addAttribute("buisness", rbusiness);
		model.addAttribute("request", request);
		setRest.excute(model);
		
		return "partnerPage.tiles";
	}
	
	/*
	@RequestMapping("/restedit")
	public String edit(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("restedit() 실행됨");
		model.addAttribute("req", request);
		//model.addAttribute("increaseHit", false);
		
		getRest.excute(model);		
		return "";
	}
	*/
	
	//수정하기
	@PostMapping("/resteditok")
	public String resteditok( HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("resteditok() 실행됨");
					
		int rbusiness = Integer.parseInt( (String) session.getAttribute("buisness"));
		String ids = request.getParameter("id");
		session.setAttribute("rest_id", ids);
		System.out.println("현재 저장된 가게 id값 : " + session.getAttribute("rest_id"));
		System.out.println(ids);
		System.out.println(rbusiness);
		Map<String, Object> params = new HashMap<>();
		try {
			params.put("business", rbusiness);
			params.put("id", Integer.parseInt(ids));
			/*
			params.put("r_intro", request.getParameter("r_intro"));
	        params.put("r_time", request.getParameter("r_time"));
	        params.put("r_url", request.getParameter("r_url"));
	        params.put("imnum", request.getParameter("imnum"));
	        */
			//params.put("pass", request.getParameter("pass"));
			
		}catch(NumberFormatException e) {
			model.addAttribute("error", "에러가 발생했습니다.");
			return "redirect:partneredit2";
		}
		model.addAttribute("request", request);
		setRestEdit.excute(model);
		
		return "redirect:partnerPage";

		
	}
    
	//공지사항 수정
	@RequestMapping("/updateNotice")
	public String noticeedit(
							HttpServletRequest request, HttpServletResponse response, 
							Model model) {
		System.out.println("updateNotice() 실행됨");
		String ids = request.getParameter("id");
		System.out.println(ids);
		Map<String, Object> params = new HashMap<>();
		model.addAttribute("request", request);
		noticeEdit.excute(model);
		
		
			
		return "redirect:partnerPage";
	}
	
	@PostMapping("/upload")
	@ResponseBody
	public ResponseEntity<?> handleImageUpload(
			@RequestParam("file") MultipartFile uploadFile,
			@RequestParam("imnum") String imnum,
			Model model){
		System.out.println("upload() 실행됨");
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
				String uploadDir = servletContext.getRealPath("/resources/upload/");
				System.out.println(uploadDir);
				//업로드
				File serverFile = new File(uploadDir + nFilename);
				uploadFile.transferTo(serverFile);
				
				//데이터베이스 저장
				rUploadFileDto.setExt(ext);
				rUploadFileDto.setFilesize(filesize);
				rUploadFileDto.setImnum(imnum);
				rUploadFileDto.setNfilename(nFilename);
				rUploadFileDto.setOfilename(oFilename);
				
				System.out.println(rUploadFileDto);
				
				rUploadDao.rInsertFile(rUploadFileDto);
				
				String json = "{\"url\":\"" + "/roadproject/resources/upload/" + nFilename + "\"}";
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
