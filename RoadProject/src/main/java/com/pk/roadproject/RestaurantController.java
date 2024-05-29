package com.pk.roadproject;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.pk.dao.RestUploadDao;
import com.pk.dao.RestaurantDao;
import com.pk.dto.RestUploadFileDto;
import com.pk.dto.RestaurantDto;
import com.pk.service.RestGetListService;
import com.pk.service.RestTrashFileDel;
import com.pk.service.SetRestService;



@Controller
public class RestaurantController {

		@Autowired
		RestGetListService getList;
		
		@Autowired
		RestaurantDao rdao;
        
		@Autowired
		RestaurantDto rdto;
		
		@Autowired
		ServletContext servletContext;
		
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
	
	@GetMapping("/register")
	public String register(Model model) {
		System.out.println("register() 실행됨");
		String upDir = servletContext.getRealPath("/resources/");
		System.out.println(upDir);
		String imnum = UUID.randomUUID().toString();
		
		model.addAttribute("imnum", imnum);
		return "register";
	}
	
	@PostMapping("/register")
	public String registerOk(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		System.out.println("registerok() 실행됨");
		model.addAttribute("request", request);
		setRest.excute(model);
		
		return "redirect:rest";
	}
	
	@PostMapping("/upload")
	@ResponseBody
	public ResponseEntity<?> handleImageUpload(
			@RequestParam("file") MultipartFile uploadFile,
			@RequestParam("imnum") String imnum){
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
