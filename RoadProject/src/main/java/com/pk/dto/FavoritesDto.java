package com.pk.dto;

import lombok.Data;

@Data
public class FavoritesDto {
	private String userid;
	private String rtName;
	private int rtCode;
	private String rtAddr1;
	private String rtAddr2;
	
	public FavoritesDto() {}
	
}
