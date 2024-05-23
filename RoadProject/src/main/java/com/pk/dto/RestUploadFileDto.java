package com.pk.dto;

import org.springframework.stereotype.Repository;

import lombok.Data;



@Repository
@Data
public class RestUploadFileDto {
		
	private int id;
	private int rest_id;
	private String ofilename;
	private String nfilename;
	private String ext;
	private long filesize;
	private String imnum;
	
}
