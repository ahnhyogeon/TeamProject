package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dto.RestUploadFileDto;

@Repository
public class RestUploadDao implements RestUploadMapper {
	
	@Autowired
	private SqlSession session;  
	
	@Override
	public int rInsertFile(RestUploadFileDto ruDto) {
		
		return session.insert("rInsertFile", ruDto);
	}

	@Override
	public int rDeleteFile(int uploadId) {
		
		return session.delete("rDeleteFileById", uploadId);
	}

	@Override
	public int rDeleteFileByRestId(int restId) {
		
		return session.delete("rDeleteFileByRestId", restId);
	}

	@Override
	public int rDeleteTrashFile() {
		
		return session.delete("rDeleteTrashFile");
	}

	@Override
	public RestUploadFileDto rSelectFileById(int uploadId) {
	
		return session.selectOne("rSelectFileById", uploadId);
	}

	@Override
	public List<RestUploadFileDto> rSelectFileByRestId(int restId) {
	
		return session.selectList("rSelectFileByRestId", restId);
	}

	@Override
	public void rUpdateFile(Map<String, Object> params) {
		
		 session.update("rUpdateFile", params);
	}
	
}
