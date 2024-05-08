package com.pk.dao;

import java.util.List;

import com.pk.dto.MemberDto;

public interface MemberDao {
	
	public List<MemberDto> selectMember() throws Exception;
	
	public MemberDto searchName(MemberDto search) throws Exception;	
	
	public int insertDB(MemberDto dto) throws Exception;
	
	public boolean searchId(MemberDto dto) throws Exception;
	
	public MemberDto searchNick(MemberDto dto) throws Exception;	

}
