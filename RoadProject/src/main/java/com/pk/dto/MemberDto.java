package com.pk.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
@Data
public class MemberDto {
	
	private int id;
	private String name;
	private String nickname;
	private String userid;
	private String password;
	private String tel;
	private int zipcode;
	private String addr1;
	private String addr2;
	private String birth;
	private String email;
	private Timestamp date;
	private String buisness;
	private int role;

	public MemberDto() {
    }
}
