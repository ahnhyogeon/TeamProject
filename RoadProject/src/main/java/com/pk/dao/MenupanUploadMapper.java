package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.pk.dto.MenupanFileDto;

@Mapper
public interface MenupanUploadMapper {
	
	
	public int mpInsertFile(MenupanFileDto uDto);
	
	public int mpDeleteFile(int uploadId);
	
	public int mpDeleteFileByRestId(int restId);
	
	public int mpDeleteTrashFile();
	
	public MenupanFileDto mpSelectFileById(int uploadId);
	
	public List<MenupanFileDto> mpSelectFileByRestId(int restId);
	
	public List<MenupanFileDto> menupanSrcList(int restId);
								   
	public void mpUpdateFile(Map<String, Object> params);
}
