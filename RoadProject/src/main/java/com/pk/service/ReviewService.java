package com.pk.service;

import java.util.List;

import com.pk.dto.ReviewDto;
import com.pk.dto.ReviewUploadFileDto;

public interface ReviewService {

	//리뷰 조회
	public List<ReviewDto> reviewSelectList(ReviewDto reviews) throws Exception;
	
	//리뷰 검색
	public List<ReviewDto> reviewSelectSearchList(ReviewDto reviews) throws Exception;
	
	//리뷰 만들기
	public void insertReview(ReviewDto reviews) throws Exception;
	
	//리뷰 삭제
	public void unReview(ReviewDto reviews) throws Exception;
	
	//리뷰 좋아요
	public void ratingReview(ReviewDto reviews) throws Exception;
	
	//리뷰 디테일
	public List<ReviewDto> reviewDetail(ReviewDto reviews) throws Exception;
	
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
	
	public int rInsertFile(ReviewUploadFileDto ReviewUploadFileDto) throws Exception;
	
	public int rDeleteFile(int uploadId) throws Exception;
	
	public int rDeleteFileByReviewId(int reviewId) throws Exception;
	
	public int rDeleteTrashFile() throws Exception;
	
	public ReviewUploadFileDto rSelectFileById(int uploadId) throws Exception;
	
	public List<ReviewUploadFileDto> rSelectFileByReviewId(int reviewId) throws Exception;
								   
	// 리뷰 작성시 review_img에 review_id 갱신
	public int rUpdateId(ReviewUploadFileDto ReviewUploadFileDto) throws Exception;
}
