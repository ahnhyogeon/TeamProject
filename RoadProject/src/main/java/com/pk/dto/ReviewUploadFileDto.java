package com.pk.dto;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
@Data
public class ReviewUploadFileDto {
	private int id;
	private int reviewId;
	private String ofilename;
	private String nfilename;
	private String ext;
	private long filesize;
	private String imnum;
	
	public ReviewUploadFileDto() {}
}
