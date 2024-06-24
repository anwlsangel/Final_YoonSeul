package com.kh.yoonsart.lostfind.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter

public class LostImg {

	@Override
	public String toString() {
		return "{lostImgId:" + lostImgId + ", fileRoot: '" + fileRoot + "', fileName:'" + fileName + "', lostNo:"
				+ lostNo + "}";
	}
	private int lostImgId;
	private String fileRoot;
	private String fileName;
	private int lostNo;
}
