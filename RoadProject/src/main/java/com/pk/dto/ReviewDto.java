package com.pk.dto;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
@Data
public class ReviewDto {
	private int id;
	private int userid;
	private String username;
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
	private Timestamp wdate;
	private String detailScoreUrl;
	private String Scoremessage;
	private String photoUrl;
	private List<String> photoUrls;
	private String followcheck;
	
	public ReviewDto() {}

	public void setPhotoUrls(List<String> photoUrls) {
        this.photoUrls = photoUrls;
    }
	
}
