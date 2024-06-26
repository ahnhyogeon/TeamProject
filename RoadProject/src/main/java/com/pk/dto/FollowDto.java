package com.pk.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
@Data
public class FollowDto {
	
	public int id;
	public String a_uname;
	public String p_uname;
	public String r_name;
	public Timestamp wdate;
	public int a_uid;
	public int p_uid;
	public int r_id;
	
	public FollowDto() {}
}
