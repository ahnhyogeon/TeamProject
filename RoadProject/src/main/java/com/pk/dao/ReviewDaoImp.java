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
	
	//리뷰 레스토랑 아이디 조회
	@Override
	public List<ReviewDto> reviewRestaurantIdSelectList(ReviewDto reviews, int restaurant_id) {
		
		System.out.println("reviewRestaurantIdSelectList() 시작");
		return sqlSession.selectList(Namespace+".reviewRestaurantIdSelectList", reviews);
	}
	
	//리뷰 hit순 조회
	public List<ReviewDto> reviewScoreSelcetList(ReviewDto reviews){
		
		System.out.println("reviewScoreSelcetList() 시작");
		return sqlSession.selectList(Namespace+".reviewScoreSelcetList", reviews);
	}
	
	//리뷰 레스토랑 아이디 조회
	@Override
	public List<ReviewDto> reviewRestaurantIdScoreSelcetList(ReviewDto reviews, int restaurant_id) {
		
		System.out.println("reviewRestaurantIdScoreSelcetList() 시작");
		return sqlSession.selectList(Namespace+".reviewRestaurantIdScoreSelcetList", reviews);
	}
	
	//리뷰 검색
	@Override
	public List<ReviewDto> reviewSelectSearchList(ReviewDto reviews) {
		
		System.out.println("reviewSelectSearchList() 시작");
		return sqlSession.selectList(Namespace+".reviewSelectSearchList", reviews);
	}
	
	@Override
	public void insertReview(ReviewDto reviews) {
		
		System.out.println("insertReview() 시작");
		sqlSession.insert(Namespace+".insertReview", reviews);
	}
	
	@Override
	//리뷰 생성 후 id 조회
	public int reviewSelectByIdSearch() {
		
		System.out.println("reviewSelectByIdSearch() 시작");
		return sqlSession.selectOne(Namespace+".reviewSelectByIdSearch");
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
	public List<ReviewDto> getReviewById(int reviewId) {
		
		System.out.println("reviewDetail() 시작");
		return sqlSession.selectList(Namespace+".getReviewById", reviewId);
	}
	
	// 리뷰 조회수 증가
	@Override
	public void reviewHitUp(int id) {
		
		System.out.println("reviewHitUp() 시작");
		sqlSession.update(Namespace+".reviewHitUp", id);
	}
	
	//리뷰 작성 인원수 확인
	@Override
	public int reviewCount(int restaurant_id) {
		
		System.out.println("reviewCount() 시작");
		return sqlSession.selectOne(Namespace+".reviewCount", restaurant_id);
	}
	
	//리뷰 검색 시 해당하는 인원수 확인
	@Override
	public int reviewSearchCount(ReviewDto reviews) {
		
		System.out.println("reviewSearchCount() 시작");
		return sqlSession.selectOne(Namespace+".reviewSearchCount", reviews);
	}
	
	//리뷰 가게 점수 확인
	@Override
	public double reviewResultScore(int restaurant_id) {
		
		System.out.println("reviewResultScore() 시작");
		return sqlSession.selectOne(Namespace+".reviewResultScore", restaurant_id);
	}
	
	//리뷰 가게 개별(1~5) 점수 확인
	@Override
	public int reviewOneScore(ReviewDto reviews) {
		
		System.out.println("reviewOneScore() 시작");
		return sqlSession.selectOne(Namespace+".reviewOneScore", reviews);
	}

}
