package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImp implements MypageDao {

	private final SqlSession sqlSession;

    @Autowired
    public MypageDaoImp(SqlSession sqlSession) throws Exception {
        this.sqlSession = sqlSession;
    }

    // 팔로워 수
    @Override
    public int getFollowerCount(int userId) throws Exception {
        return sqlSession.selectOne("com.pk.dao.MypageDao.getFollowerCount", userId);
    }

    // 팔로잉 수
    @Override
    public int getFollowingCount(int userId) throws Exception {
        return sqlSession.selectOne("com.pk.dao.MypageDao.getFollowingCount", userId);
    }

    // 마이리뷰 수
    @Override
    public int getReviewCount(int userId) throws Exception {
        return sqlSession.selectOne("com.pk.dao.MypageDao.getReviewCount", userId);
    }

    // 가장 인기 있는 마이 리뷰
    @Override
    public List<Map<String, Object>> getTopRatedReviews(int userId) throws Exception {
        return sqlSession.selectList("com.pk.dao.MypageDao.getTopRatedReviews", userId);
    }

    // 마이리뷰 리스트
    @Override
    public List<Map<String, Object>> getRecentReviews(int userId) throws Exception {
        return sqlSession.selectList("com.pk.dao.MypageDao.getRecentReviews", userId);
    }

    // 카테고리별 마이리뷰 리스트
    @Override
    public List<Map<String, Object>> getCategoryReviews(int userId, int categoryCode) throws Exception {
        // 매개변수가 여러 개일 때는 Map을 사용하여 전달
        Map<String, Object> params = Map.of("userId", userId, "categoryCode", categoryCode);
        return sqlSession.selectList("com.pk.dao.MypageDao.getCategoryReviews", params);
    }

}
