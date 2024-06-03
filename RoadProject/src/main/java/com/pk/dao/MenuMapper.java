package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.pk.dto.MenuDto;

@Mapper
public interface MenuMapper {
	   //insert
			public int menuInsert(MenuDto dto);
		    
			//update
			public int menuUpdate(MenuDto dto);
			
			//delete
			public int menuDelete(int selectId);
			
			//전체 메뉴 수
			public int selectMenuCount(Map<String, Object> params);
						
			//상세보기
			public MenuDto mSelectDetail(int selectId);
			
			//목록보기
			public List<MenuDto> menuList(Map<String, Object> params);
			
			//팔로우 증가
			public void increaseHit(int selectId);
			
			//전체 메뉴 보기
			public List<MenuDto> AllMenuList(Map<String, Object> params);
			
			//사업자번호 검증
			public int mValidateBusiness(Map<String, Object> params);
			
}
