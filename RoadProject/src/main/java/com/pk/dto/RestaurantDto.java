package com.pk.dto;


import org.springframework.stereotype.Repository;
import lombok.Data;


@Repository
@Data
public class RestaurantDto {
	
	private int id;
	private int business;
	private String r_name;
	private int r_code;
	private String r_addr1;
	private String r_addr2;
	private String r_tel;
	private String r_url;
	private String imnum;
	private String r_intro;
 	private String notice;
	private String r_time;
 	private String r_category;
 	private String menupan_src;
 	private String info;
	
 	
    public RestaurantDto() {
    	
    }

}
