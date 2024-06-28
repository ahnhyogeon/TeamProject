package com.pk.dao;

import java.util.List;

import com.pk.dto.ReviewUploadFileDto;

public interface ReviewUploadDao {

	public int rInsertFile(ReviewUploadFileDto ReviewUploadFileDto) throws Exception;
	
	public int rDeleteFile(int uploadId) throws Exception;
	
	public int rDeleteFileByReviewId(int reviewId) throws Exception;
	
	public int rDeleteTrashFile() throws Exception;
	
	public ReviewUploadFileDto rSelectFileById(int uploadId) throws Exception;
	
	public List<ReviewUploadFileDto> rSelectFileByReviewId(int reviewId) throws Exception;
		
	// 리뷰 작성시 review_img에 review_id 갱신
	public int rUpdateId(ReviewUploadFileDto ReviewUploadFileDto) throws Exception;
	
}
