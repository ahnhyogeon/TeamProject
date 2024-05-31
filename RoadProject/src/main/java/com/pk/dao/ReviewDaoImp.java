package com.pk.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dto.ReviewDto;

@Repository
public class ReviewDaoImp implements ReviewDao {
	
	private SqlSession sqlSession;
	
	private static final String Namespace = "reviewMapper";
	
	@Autowired
    public ReviewDaoImp(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

	@Override
	public List<ReviewDto> reviewSelectList(ReviewDto reviews) {
		
		System.out.println("reviewSelectList() 시작");
		return sqlSession.selectList(Namespace+".reviewSelectList", reviews);
	}
	
	@Override
	public void insertReview(ReviewDto reviews) {
		
		System.out.println("insertReview() 시작");
		sqlSession.insert(Namespace+".insertReview", reviews);
	}

	
	@Override
	public void unReview(ReviewDto reviews) {
		
		System.out.println("unReview() 시작");
	}
	
	// 리뷰 좋아요 증가
	@Override
	public void ratingReview(ReviewDto reviews) {
		
		System.out.println("ratingReview 시작");
		sqlSession.update(Namespace+".ratingReview", reviews);
	}
	
	// 리뷰 디테일 select
	@Override
	public List<ReviewDto> reviewDetail(ReviewDto reviews) {
		
		System.out.println("reviewDetail() 시작");
		return sqlSession.selectList(Namespace+".reviewDetail", reviews);
	}
	
}
