package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dto.MenuUploadFileDto;



@Repository
public class MenuUploadDao implements MenuUploadMapper {
	
	@Autowired
	private SqlSession session;  
	
	@Override
	public int mInsertFile(MenuUploadFileDto muDto) {
	
		return session.insert("mInsertFile", muDto);
	}

	@Override
	public int mDeleteFile(int uploadId) {
	
		return session.delete("mDeleteFileById", uploadId);
	}

	@Override
	public int mDeleteFileByBusiness(int business) {
	
		return session.delete("mDeleteFileByBusiness", business);
	}

	@Override
	public int mDeleteTrashFile() {
	
		return session.delete("mDeleteTrashFile");
	}

	@Override
	public MenuUploadFileDto mSelectFileById(int uploadId) {
	
		return session.selectOne("mSelectFileById", uploadId);
	}

	@Override
	public List<MenuUploadFileDto> mSelectFileByBusiness(int business) {
	
		return session.selectList("mSelectFileByBusiness", business);
	}

	@Override
	public void mUpdateFile(Map<String, Object> params) {
		
		session.update("mUpdateFile", params);

	}

}
