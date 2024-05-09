package com.pk.service;

import java.util.List;

import com.pk.dto.MemberDto;

public interface MemberService {
	
	public List<MemberDto> selectMember() throws Exception;
	
	public MemberDto searchName(MemberDto search) throws Exception;	
	
	public int insertDB(MemberDto dto) throws Exception;
	
	public boolean searchId(MemberDto dto) throws Exception;
	
	public MemberDto searchNick(MemberDto dto) throws Exception;
	
}