package com.pk.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dto.FollowDto;

@Repository
public class FollowDaoImp implements FollowDao {
	
	private SqlSession sqlSession;
	
	private static final String Namespace = "followMapper";
	
	@Autowired
    public FollowDaoImp(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

	@Override
	public void insertFollow(FollowDto follow) {
		
		System.out.println("follow() 시작");
		
		sqlSession.insert(Namespace+".insertFollow", follow);
		
		System.out.println("follow() 정상 종료");
	}

	@Override
	public void unFollow(FollowDto follow) {
		System.out.println("follow() 시작");
		
		sqlSession.insert(Namespace+".unFollow", follow);
		
		System.out.println("follow() 정상 종료");
		
	}

	@Override
	public int isFollow(FollowDto follow) {
		System.out.println("inFollow() 시작");
		return sqlSession.selectOne(Namespace+".isFollow", follow);
	}

}
