package com.kh.yoonsart.common.template;

import com.kh.yoonsart.common.model.vo.PageInfo;

public class Pagination {

	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount/ boardLimit);
		int startPage = (currentPage - 1)/pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		endPage = endPage> maxPage ? maxPage:endPage;
		return new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
	}
	
}
