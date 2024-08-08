package com.pk.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pk.dao.MypageDao;

@Service
public class MypageServiceImp implements MypageService {

	@Autowired
	private MypageDao dao;



    // 팔로워 수
	@Override
	public int getFollowerCount(int userId) throws Exception {
		
		return dao.getFollowerCount(userId);
	}


    // 팔로잉 수
	@Override
	public int getFollowingCount(int userId) throws Exception {

		return dao.getFollowingCount(userId);
	}
	


    // 마이리뷰 수
	@Override
	public int getReviewCount(int userId) throws Exception {

		return dao.getReviewCount(userId);
	}
	

    // 마이리뷰 리스트
	@Override
	public List<Map<String, Object>> getRecentReviews(int userId) throws Exception {

		return dao.getRecentReviews(userId);
	}

	

    // 가장 인기 있는 마이 리뷰
	@Override
	public List<Map<String, Object>> getTopRatedReviews(int userId) throws Exception {

		return dao.getTopRatedReviews(userId);
	}

    // 카테고리별 마이리뷰 리스트
	@Override
	public List<Map<String, Object>> getCategoryReviews(int userId, int categoryCode) throws Exception {

		return dao.getCategoryReviews(userId, categoryCode);
	}

	

}
