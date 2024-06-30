package com.pk.service;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.pk.dao.ReviewDao;
import com.pk.dao.ReviewUploadDao;
import com.pk.dto.ReviewDto;
import com.pk.dto.ReviewUploadFileDto;

@Service
public class ReviewServicelmp implements ReviewService {
	
	@Inject
	private ReviewDao dao;
	
	@Inject
	private ReviewUploadDao udao;

	@Override
	public List<ReviewDto> reviewSelectList(ReviewDto reviews) throws Exception {
		return dao.reviewSelectList(reviews);
	}
	
	//리뷰 레스토랑 아이디 조회
	@Override
	public List<ReviewDto> reviewRestaurantIdSelectList(ReviewDto reviews, int restaurant_id) throws Exception {
		return dao.reviewRestaurantIdSelectList(reviews, restaurant_id);
	}
	
	//리뷰 hit순 조회
	@Override
	public List<ReviewDto> reviewScoreSelcetList(ReviewDto reviews) throws Exception {
		return dao.reviewScoreSelcetList(reviews);
	}
	
	//리뷰 레스토랑 아이디 hit순 조회
	@Override
	public List<ReviewDto> reviewRestaurantIdScoreSelcetList(ReviewDto reviews, int restaurant_id) throws Exception {
		return dao.reviewRestaurantIdScoreSelcetList(reviews, restaurant_id);
	}
	
	//리뷰 검색
	@Override
	public List<ReviewDto> reviewSelectSearchList(ReviewDto reviews) throws Exception {
		return dao.reviewSelectSearchList(reviews);
	}

	//리뷰 생성
	@Override
	@Transactional
    public int insertReviewAndGetId(ReviewDto review) throws Exception {
		try {
	        dao.insertReview(review); // 리뷰 추가
	        int reviewId = dao.reviewSelectByIdSearch(); // 새로 추가된 리뷰의 ID 조회
	        return reviewId;
	    } catch (Exception e) {
	        throw new Exception("리뷰 추가 중 오류 발생", e); // 예외 처리 및 롤백
	    }
    }

	@Override
	public void unReview(ReviewDto reviews) throws Exception {
		dao.unReview(reviews);

	}
	
	@Override
	public void ratingReview(ReviewDto reviews) throws Exception {
		dao.ratingReview(reviews);
	}
	
	@Override
	//리뷰 디테일
	public List<ReviewDto> getReviewById(int reviewId) throws Exception {
		return dao.getReviewById(reviewId);
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
	
	@Override
	public int rDeleteFile(int uploadId) throws Exception {
		return udao.rDeleteFile(uploadId);
	}

	@Override
	public int rDeleteFileByReviewId(int reviewId) throws Exception {
		return udao.rDeleteFileByReviewId(reviewId);
	}

	@Override
	public int rDeleteTrashFile() throws Exception {
		return udao.rDeleteTrashFile();
	}

	@Override
	public ReviewUploadFileDto rSelectFileByImnum(String imnum) throws Exception {
		return udao.rSelectFileByImnum(imnum);
	}

	@Override
	public List<ReviewUploadFileDto> rSelectFileByReviewId(int reviewId) throws Exception {
		return udao.rSelectFileByReviewId(reviewId);
	}

	@Override
	public int rInsertFile(ReviewUploadFileDto ReviewUploadFileDto) throws Exception {
		return udao.rInsertFile(ReviewUploadFileDto);
	}
	
	@Override
	public int rUpdateId(ReviewUploadFileDto ReviewUploadFileDto) throws Exception {
		return udao.rUpdateId(ReviewUploadFileDto);
	}
}
