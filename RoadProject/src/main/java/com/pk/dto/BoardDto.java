package com.pk.dto;

import lombok.Data;

@Data
public class BoardDto {
	private String userid;
	private String username;
	private String context;
	private int great;
	
	public BoardDto() {}
}
