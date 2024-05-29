package com.pk.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dao.MenuUploadDao;
import com.pk.dto.MenuUploadFileDto;

@Repository
public class MenuTrashFileDel {
	
	@Autowired
	private MenuUploadDao muDao;
	
	@Autowired
	private ServletContext servletContext;
	
	public void menuDelCom() {
		   
		  List<MenuUploadFileDto> mudaos = muDao.mSelectFileByBusiness(0);
		  
		  for(MenuUploadFileDto mfdao : mudaos) {
			  String delFileName = mfdao.getNfilename();
			  try {
				  //파일삭제
				  String path = servletContext.getRealPath("/resources/menu/");
				  File file = new File(path + delFileName);
				  if(file.exists()) {
					  file.delete();
				  }
				  //db 레코드 삭제
				  muDao.mDeleteFile(Integer.parseInt(mfdao.getBusiness()));
			  }catch(Exception e) {
				  e.printStackTrace();
			  }
		  }
		   
	   }
}
