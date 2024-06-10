package com.pk.dto;

import lombok.Data;

@Data
public class ReviewImgDto {

		private int id;
		private String imnum;
		private String filename;
		private String filepath;
		private String ext;
		private int review_id;
		
		public ReviewImgDto() {}

	}
