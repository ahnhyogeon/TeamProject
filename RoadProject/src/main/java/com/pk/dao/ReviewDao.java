package com.pk.dao;

import java.util.List;

import com.pk.dto.ReviewDto;

public interface ReviewDao {
	
	//리뷰 조회
	public List<ReviewDto> reviewSelectList(ReviewDto reviews) throws Exception;
	
	//리뷰 레스토랑 아이디 조회
	public List<ReviewDto> reviewRestaurantIdSelectList(ReviewDto reviews, int restaurant_id) throws Exception;
	
	//리뷰 hit순 조회
	public List<ReviewDto> reviewScoreSelcetList(ReviewDto reviews) throws Exception;
	
	//리뷰 레스토랑 아이디 hit순 조회
	public List<ReviewDto> reviewRestaurantIdScoreSelcetList(ReviewDto reviews, int restaurant_id) throws Exception;
	
	//리뷰 검색
	public List<ReviewDto> reviewSelectSearchList(ReviewDto reviews) throws Exception;
	
	//리뷰 만들기
	public void insertReview(ReviewDto reviews) throws Exception;
	
	//리뷰 생성 후 id 조회
	public int reviewSelectByIdSearch() throws Exception;
	
	//리뷰 삭제
	public void unReview(ReviewDto reviews) throws Exception;
	
	//리뷰 좋아요
	public void ratingReview(ReviewDto reviews) throws Exception;
	
	//리뷰 디테일
	public List<ReviewDto> getReviewById(int reviewId) throws Exception;
	
	//리뷰 조회수 증가
	public void reviewHitUp(int id) throws Exception;
	
	//리뷰 작성 인원수 확인
	public int reviewCount(int restaurant_id) throws Exception;
	
	//리뷰 검색 시 해당하는 인원수 확인
	public int reviewSearchCount(ReviewDto reviews) throws Exception;
	
	//리뷰 가게 점수 확인
	public double reviewResultScore(int restaurant_id) throws Exception;
	
	//리뷰 가게 개별(1~5) 점수 확인
	public int reviewOneScore(ReviewDto reviews) throws Exception;

}
	