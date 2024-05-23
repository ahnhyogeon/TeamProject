package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.pk.dto.RestUploadFileDto;

@Repository
public class RestUploadDao implements RestUploadMapper {

	@Override
	public int rInsertFile(RestUploadFileDto uDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int rDeleteFile(int uploadId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int rDeleteFileByRestId(int restId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int rDeleteTrashFile() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public RestUploadFileDto rSelectFileById(int uploadId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RestUploadFileDto> rSelectFileByRestId(int restId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void rUpdateFile(Map<String, Object> params) {
		// TODO Auto-generated method stub

	}

}
