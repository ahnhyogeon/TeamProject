package com.pk.dto;

import lombok.Data;

@Data
public class RservationDto {
	private String userid;
	private int rtCode;
	private String rtAddr1;
	private String rtAddr2;
	private String rtTel;
	
	public RservationDto() {}
}
