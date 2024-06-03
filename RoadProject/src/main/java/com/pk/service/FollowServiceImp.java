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
	public void insertFollow(FollowDto follow) throws Exception {
		dao.insertFollow(follow);
	}

	@Override
	public void unFollow(FollowDto follow) throws Exception {
		dao.unFollow(follow);
	}

	@Override
	public int isFollow(FollowDto follow) throws Exception {
		return dao.isFollow(follow);
	}

}
