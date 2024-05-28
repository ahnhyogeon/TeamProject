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
		// TODO Auto-generated method stub
		return session.insert("mInsertFile", muDto);
	}

	@Override
	public int mDeleteFile(int business) {
		// TODO Auto-generated method stub
		return session.delete("mDeleteFile", business);
	}

	@Override
	public int mDeleteFileByBusiness(int business) {
		// TODO Auto-generated method stub
		return session.delete("mDeleteFileByBusiness", business);
	}

	@Override
	public int mDeleteTrashFile() {
		// TODO Auto-generated method stub
		return session.delete("mDeleteTrashFile");
	}

	@Override
	public MenuUploadFileDto mSelectFileById(int uploadId) {
		// TODO Auto-generated method stub
		return session.selectOne("mSelectFileById", uploadId);
	}

	@Override
	public List<MenuUploadFileDto> mSelectFileByBusiness(int business) {
		// TODO Auto-generated method stub
		return session.selectList("mSelectFileByBusiness", business);
	}

	@Override
	public void mUpdateFile(Map<String, Object> params) {
		
		session.update("mUpdateFile", params);

	}

}
