package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dto.ReviewUploadFileDto;

@Repository
public class ReviewUploadDaoImp implements ReviewUploadDao {
	
	@Autowired
	private SqlSession session;  
	
	private static final String Namespace = "reviewMapper";

	@Override
	public int rInsertFile(ReviewUploadFileDto ReviewUploadFileDto) {
		
		System.out.println("rinsertFile() 시작");
		return session.insert(Namespace+".rInsertFile", ReviewUploadFileDto);
	}

	@Override
	public int rDeleteFile(int uploadId) {
		
		System.out.println("rDeleteFile() 시작");
		return session.delete(Namespace+".rDeleteFileById", uploadId);
	}

	@Override
	public int rDeleteFileByReviewId(int reviewId) {
		
		System.out.println("rDeleteFileByReviewId() 실행");
		return session.delete(Namespace+".rDeleteFileByReviewId", reviewId);
	}

	@Override
	public int rDeleteTrashFile() {

		System.out.println("rDeleteTrashFile() 실행");
		return session.delete(Namespace+".rDeleteTrashFile");
	}

	@Override
	public ReviewUploadFileDto rSelectFileByImnum(String imnum) {
		
		System.out.println("rSelectFileByImnum() 실행");
		return session.selectOne(Namespace+".rSelectFileByImnum", imnum);
	}

	@Override
	public List<ReviewUploadFileDto> rSelectFileByReviewId(int reviewId) {
		
		System.out.println("rSelectFileByRestId() 실행");
		return session.selectList(Namespace+".rSelectFileByReviewId", reviewId);
	}

	@Override
	public int rUpdateId(ReviewUploadFileDto ReviewUploadFileDto) {
		
		System.out.println("rUpdateId() 실행");
		return session.update(Namespace+".rUpdateId", ReviewUploadFileDto);

	}

}
