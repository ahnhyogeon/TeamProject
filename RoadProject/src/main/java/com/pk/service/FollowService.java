package com.pk.service;

import com.pk.dto.FollowDto;

public interface FollowService {

	//팔로우 하기
	public void follow(FollowDto follow) throws Exception;
	
	//언팔로우 하기
	public void unfollow(FollowDto follow) throws Exception;
	
	//팔로우 유무
	public int isFollow(FollowDto follow) throws Exception;
	
}
