package com.pk.dto;

import lombok.Data;

@Data
public class ReviewDto {
	private String userid;
	private String nickname;
	private String detail;
	private int rating;
	private int rtCode;
	
	public ReviewDto() {}
	
}
