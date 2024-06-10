package com.pk.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pk.dao.ReviewDao;
import com.pk.dto.ReviewDto;

@Service
public class ReviewServicelmp implements ReviewService {
	
	@Inject
	private ReviewDao dao;

	@Override
	public List<ReviewDto> reviewSelectList(ReviewDto reviews) throws Exception {
		return dao.reviewSelectList(reviews);
	}
	
	//리뷰 검색
	@Override
	public List<ReviewDto> reviewSelectSearchList(ReviewDto reviews) throws Exception {
		return dao.reviewSelectSearchList(reviews);
	}

	@Override
	public void insertReview(ReviewDto reviews) throws Exception {
		dao.insertReview(reviews);
	}

	@Override
	public void unReview(ReviewDto reviews) throws Exception {
		// TODO Auto-generated method stub

	}
	
	@Override
	public void ratingReview(ReviewDto reviews) throws Exception {
		dao.ratingReview(reviews);
	}
	
	@Override
	public List<ReviewDto> reviewDetail(ReviewDto reviews) throws Exception {
		return dao.reviewDetail(reviews);
	}
	
	//리뷰 조회수 증가
	@Override
	public void reviewHitUp(int id) throws Exception {
		dao.reviewHitUp(id);
	}
	
	//리뷰 작성 인원수 확인
	@Override
	public int reviewCount(int restaurant_id) throws Exception {
		return dao.reviewCount(restaurant_id);
	}
	
	//리뷰 검색 시 해당하는 인원수 확인
	@Override
	public int reviewSearchCount(ReviewDto reviews) throws Exception {
		return dao.reviewSearchCount(reviews);
	}
	
	//리뷰 가게 점수 확인
	@Override
	public double reviewResultScore(int restaurant_id) throws Exception {
		return dao.reviewResultScore(restaurant_id);
	}

	//리뷰 가게 개별(1~5) 점수 확인
	@Override
	public int reviewOneScore(ReviewDto reviews) throws Exception {
		return dao.reviewOneScore(reviews);
	}
}
