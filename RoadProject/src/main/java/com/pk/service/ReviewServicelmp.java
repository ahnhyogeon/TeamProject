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

}
