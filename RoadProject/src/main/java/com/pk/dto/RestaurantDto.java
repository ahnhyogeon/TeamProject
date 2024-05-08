package com.pk.dto;

import org.springframework.stereotype.Repository;
import lombok.Data;


@Repository
@Data
public class RestaurantDto {
	
	private int id;
	private String buisness;
	private String name;
	private int code;
	private String addr1;
	private String addr2;
	private String tel;
	private String url;
	private String imnum;
	private String intro;
 	
}
