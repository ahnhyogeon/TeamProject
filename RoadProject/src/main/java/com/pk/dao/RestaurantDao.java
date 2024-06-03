package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dto.RestaurantDto;

@Repository
public class RestaurantDao implements RestaurantMapper {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int restInsert(RestaurantDto dto) {
		
		return session.insert("restInsert", dto);
	}

	@Override
	public int restUpdate(RestaurantDto dto) {
		
		return session.update("restUpdate", dto);
	}

	@Override
	public int restDelete(int selectId) {
		
		return session.delete("restDelete", selectId);
	}

	@Override
	public int selectRestCount(Map<String, Object> params) {
		
		return session.selectOne("selectRestCount", params);
	}

	@Override
	public RestaurantDto rSelectDetail(int selectId) {
		return session.selectOne("rSelectDetail", selectId);
	}

	@Override
	public List<RestaurantDto> restList(Map<String, Object> params) {
		return session.selectList("restList", params);
	}
	
	@Override
	public void increaseHit(int selectId) {
		session.update("increaseHit", selectId);
	}
	
	@Override
	public int validateBusiness(Map<String, Object> params) {
		
		return session.selectOne("validateBusiness", params);
	}

}
