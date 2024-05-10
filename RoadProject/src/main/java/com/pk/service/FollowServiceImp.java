package com.pk.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pk.dao.FollowDao;
import com.pk.dto.FollowDto;

@Service
public class FollowServiceImp implements FollowService {
	
	@Inject
	private FollowDao dao;
	
	@Override
	public void follow(FollowDto follow) throws Exception {
		dao.follow(follow);
	}

	@Override
	public void unfollow(FollowDto follow) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int isFollow(FollowDto follow) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
