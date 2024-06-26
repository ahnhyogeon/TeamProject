package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.pk.dto.RestaurantDto;

@Mapper
public interface RestaurantMapper {
	
	   //insert
		public int restInsert(RestaurantDto dto);
	    
		//update
		public int restUpdate(RestaurantDto dto);
		
		//원산지정보관리, 메뉴판업데이트
		public int otherRestUpdate(RestaurantDto dto);
		
		//공지사항 업데이트
		public int noticeUpdate(RestaurantDto dto);
		
		//delete
		public int restDelete(int selectId);
		
		//전체 가게 수
		public int selectRestCount(Map<String, Object> params);
		
		//내 가게보기
		public RestaurantDto rSelectDetail(int business); 
	    
		//가게정보보기 (info 나누기위함)
		public RestaurantDto rSelectDetailById(int id);
		
		//목록보기
	 	public List<RestaurantDto> restList(Map<String, Object> params);
		
		//팔로우 증가
		public void increaseHit(int selectId);
		
		//사업자번호 검증
		public int validateBusiness(Map<String, Object> params);
		
		
		//detail
		//public RestaurantDto rSelectDetail(int selectId);
		
}
