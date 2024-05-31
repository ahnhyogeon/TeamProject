package com.pk.dao;

import java.util.List;
import java.util.Map;

import com.pk.dto.ReviewDto;

public interface ReviewDao {
	
	//리뷰 조회
	public List<ReviewDto> reviewSelectList(ReviewDto reviews) throws Exception;
	
	//리뷰 만들기
	public void insertReview(ReviewDto reviews) throws Exception;
	
	//리뷰 삭제
	public void unReview(ReviewDto reviews) throws Exception;
	
	//리뷰 좋아요
	public void ratingReview(ReviewDto reviews) throws Exception;
	
	//리뷰 디테일
	public List<ReviewDto> reviewDetail(ReviewDto reviews) throws Exception;

}
	