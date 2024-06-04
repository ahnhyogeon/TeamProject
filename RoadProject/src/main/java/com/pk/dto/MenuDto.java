package com.pk.dto;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
@Data
public class MenuDto {
	
	private int id;
	private int business;
	private String m_name;
	private String m_cost;
	private String m_intro;
	private String m_code;
	private String imnum;
	
	public MenuDto() {
		
	}
}
