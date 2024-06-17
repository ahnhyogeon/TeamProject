package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dto.MenupanFileDto;

@Repository
public class MenupanUploadDao implements MenupanUploadMapper {
	
	@Autowired
	private SqlSession session;  
	
	@Override
	public int mpInsertFile(MenupanFileDto mpuDto) {
		// TODO Auto-generated method stub
		return  session.insert("mpInsertFile", mpuDto);
	}

	@Override
	public int mpDeleteFile(int uploadId) {
		// TODO Auto-generated method stub
		return session.delete("mpDeleteFileById", uploadId);
	}

	@Override
	public int mpDeleteFileByRestId(int restId) {
		// TODO Auto-generated method stub
		return session.delete("mpDeleteFileByRestId", restId);
	}

	@Override
	public int mpDeleteTrashFile() {
		// TODO Auto-generated method stub
		return session.delete("mpDeleteTrashFile");
	}

	@Override
	public MenupanFileDto mpSelectFileById(int uploadId) {
		// TODO Auto-generated method stub
		return session.selectOne("mpSelectFileById", uploadId);
	}

	@Override
	public List<MenupanFileDto> mpSelectFileByRestId(int restId) {
		// TODO Auto-generated method stub
		return session.selectList("mpSelectFileByRestId", restId);
	}

	@Override
	public void mpUpdateFile(Map<String, Object> params) {
		
		 session.update("mpUpdateFile", params);

	}

}
