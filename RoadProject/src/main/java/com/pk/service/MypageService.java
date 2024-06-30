package com.pk.service;

import java.util.List;
import java.util.Map;

public interface MypageService {
	
	// 전체 팔로워 수
	int getFollowerCount(int userId) throws Exception;

	// 전체 팔로잉 수
	int getFollowingCount(int userId) throws Exception;
	
	// 전체 리뷰 수
	int getReviewCount(int userId) throws Exception;
	
	// 리뷰 - 시간역순
	List<Map<String, Object>> getRecentReviews(int userId) throws Exception;
	
	// 리뷰 - 좋아요순
	List<Map<String, Object>> getTopRatedReviews(int userId) throws Exception;
	
	// 리뷰 - 카테고리별
	List<Map<String, Object>> getCategoryReviews(int userId, int categoryCode) throws Exception;
	
}
