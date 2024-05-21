package com.pk.dao;

import com.pk.dto.FollowDto;

public interface FollowDao {
	
	//팔로우 하기
	public void insertFollow(FollowDto follow) throws Exception;
	
	//언팔로우 하기
	public void unFollow(FollowDto follow) throws Exception;
	
	//팔로우 유무
	public int isFollow(FollowDto follow) throws Exception;

}
