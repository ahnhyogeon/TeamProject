package com.pk.dao;

import java.util.List;
import java.util.Map;

import com.pk.dto.RestaurantDto;

public interface RestaurantMapper {
	
	   //insert
		public int restInsert(RestaurantDto dto);
	    
		//update
		public int restUpdate(RestaurantDto dto);
		
		//delete
		public int restDelete(int selectId);
		
		//전체 게시글 수
		public int selectTotalCount();
		
		//상세보기
		public RestaurantDto selectDetail(int selectId);
		
		//목록보기
		public List<RestaurantDto> restList(Map<String, Object> params);
		
		//팔로우 증가
		public void increaseHit(int selectId);
		
}
