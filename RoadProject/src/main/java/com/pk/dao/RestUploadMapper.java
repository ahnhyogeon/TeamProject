package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.pk.dto.RestUploadFileDto;

@Mapper
public interface RestUploadMapper {
	
	public int rInsertFile(RestUploadFileDto uDto);
	
	public int rDeleteFile(int uploadId);
	
	public int rDeleteFileByRestId(int restId);
	
	public int rDeleteTrashFile();
	
	public RestUploadFileDto rSelectFileById(int uploadId);
	
	public List<RestUploadFileDto> rSelectFileByRestId(int restId);
								   
	public void rUpdateFile(Map<String, Object> params);
	
}
