package com.pk.dto;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
@Data
public class MenuUploadFileDto {
	
	private int id;
	private String business;
	private String ofilename;
	private String nfilename;
	private String ext;
	private long filesize;
	private String imnum;
}
