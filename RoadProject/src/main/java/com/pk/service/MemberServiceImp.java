package com.pk.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pk.dao.MemberDao;
import com.pk.dto.MemberDto;

@Service
public class MemberServiceImp implements MemberService {

	@Inject
	private MemberDao dao;
	
	@Override
	public List<MemberDto> selectMember() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectMember();
	}
	
	public MemberServiceImp(MemberDao dao) {
		this.dao = dao;
	}
	 
	@Override
	public MemberDto searchName(MemberDto search) throws Exception {
		// 이름을 기준으로 학생을 검색하는 DAO 메서드 호출
	 	return dao.searchName(search);
	}
	
	@Override
	public int insertDB(MemberDto dto) throws Exception {
			
		return dao.insertDB(dto);
	}

	@Override
	public boolean searchId(MemberDto dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchId(dto);
	}

	@Override
	public MemberDto searchNick(MemberDto dto) throws Exception {
	    return dao.searchNick(dto);
	}

}
