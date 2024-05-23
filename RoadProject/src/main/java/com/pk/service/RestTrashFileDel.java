package com.pk.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dao.RestUploadDao;
import com.pk.dto.RestUploadFileDto;

@Repository
public class RestTrashFileDel {
	
	@Autowired
	private RestUploadDao ruDao;
	
	@Autowired
	private ServletContext servletContext;
	
	public void restDelCom() {
		   
		  List<RestUploadFileDto> rudaos = ruDao.rSelectFileByRestId(0);
		  
		  for(RestUploadFileDto rfdao : rudaos) {
			  String delFileName = rfdao.getNfilename();
			  try {
				  //파일삭제
				  String path = servletContext.getRealPath("/resources/upload/");
				  File file = new File(path + delFileName);
				  if(file.exists()) {
					  file.delete();
				  }
				  //db 레코드 삭제
				  ruDao.rDeleteFile(rfdao.getId());
			  }catch(Exception e) {
				  e.printStackTrace();
			  }
		  }
		   
	   }
	
}
