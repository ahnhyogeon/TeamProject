package com.pk.dto;

import lombok.Data;

@Data
public class RestaurantDto {
	private String buisness;
	private String name;
	private int code;
	private String addr1;
	private String addr2;
	private String tel;
	
	public RestaurantDto() {}
}
