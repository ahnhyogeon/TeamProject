package com.pk.dto;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
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
