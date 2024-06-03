package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.pk.dto.MenuUploadFileDto;


@Mapper
public interface MenuUploadMapper {
	
	public int mInsertFile(MenuUploadFileDto muDto);
	
	public int mDeleteFile(int uploadId);
	
	public int mDeleteFileByBusiness(int business);
	
	public int mDeleteTrashFile();
	
	public MenuUploadFileDto mSelectFileById(int uploadId);
	
	public List<MenuUploadFileDto> mSelectFileByBusiness(int business);
								   
	public void mUpdateFile(Map<String, Object> params);
}
