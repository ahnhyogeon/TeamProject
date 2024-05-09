package com.pk.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dto.FollowDto;

@Repository
public class FollowDaoImp implements FollowDao {
	
	private SqlSession sqlSession;
	
	private static final String Namespace = "mapper";
	
	@Autowired
    public FollowDaoImp(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

	@Override
	public void follow(FollowDto follow) {
		
		System.out.println("follow() 시작");
		
		sqlSession.insert(Namespace+".follow", follow);
		
		System.out.println("follow() 정상 종료");
	}

	@Override
	public void unfollow(FollowDto follow) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int isFollow(FollowDto follow) {
		// TODO Auto-generated method stub
		return 0;
	}

}
