package com.pk.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dto.MemberDto;

@Repository
public class MemberDaoImp implements MemberDao {
	
	private SqlSession sqlSession;
	
	private static final String Namespace = "mapper";
	
	@Autowired
    public MemberDaoImp(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

	@Override
	public List<MemberDto> selectMember() throws Exception {


		return sqlSession.selectList(Namespace+".select");
	}

    public MemberDto searchName(MemberDto search) {
        return sqlSession.selectOne("mapper.search", search);
    }

	@Override
	public int insertDB(MemberDto dto) throws Exception {
		
		return sqlSession.insert(Namespace+".insert", dto);
	}
	
	@Override
	public boolean searchId(MemberDto dto) throws Exception {
		
		return sqlSession.selectOne(Namespace+".search2", dto) != null;
	}

	@Override
	public MemberDto searchNick(MemberDto dto) throws Exception {
	    return sqlSession.selectOne(Namespace+".selectOne", dto);
	}
}
