package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MypageDao {

	// 팔로워 수 조회
    int getFollowerCount(int userId) throws Exception;
    
    // 팔로잉 수 조회
    int getFollowingCount(int userId) throws Exception;
    
    // 로그인한 사용자가 작성한 리뷰 수 조회
    int getReviewCount(int userId) throws Exception;
    
    // 추천순 리뷰 리스트 조회
    List<Map<String, Object>> getTopRatedReviews(int userId) throws Exception;
    
    // 시간 역순 리뷰 리스트 조회
    List<Map<String, Object>> getRecentReviews(int userId) throws Exception;
    
    // 가게 카테고리 별 리뷰 리스트 조회
    List<Map<String, Object>> getCategoryReviews(int userId, int categoryCode) throws Exception;
	
	
	
	
}
