package com.pk.dto;

import lombok.Data;

@Data
public class ReviewDto {
	private int id;
	private String userid;
	private String nickname;
	private String title;
	private String detail;
	private int hits;
	private int rating;
	private int rtCode;
	private String imnum;
	private double result;
	private String search;
	private int restaurant_id;
	private int score;
	
	public ReviewDto() {}
	
}
