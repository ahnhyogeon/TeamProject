package com.pk.dto;

import lombok.Data;

@Data
public class WaitingDto {
	private String userid;
	private String nickname;
	private int rtCode;
	private int waitNum;
	private int waitCnt;
	private int waitTime;
	
	public WaitingDto() {}
}
