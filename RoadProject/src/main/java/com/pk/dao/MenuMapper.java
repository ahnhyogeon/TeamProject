package com.pk.dao;

import java.util.List;
import java.util.Map;

import com.pk.dto.MenuDto;

public interface MenuMapper {
	   //insert
			public int menuInsert(MenuDto dto);
		    
			//update
			public int menuUpdate(MenuDto dto);
			
			//delete
			public int menuDelete(int selectId);
			
			//전체 게시글 수
			public int selectTotalCount();
			
			//상세보기
			public MenuDto selectDetail(int selectId);
			
			//목록보기
			public List<MenuDto> restList(Map<String, Object> params);
			
			//팔로우 증가
			public void increaseHit(int selectId);
}
