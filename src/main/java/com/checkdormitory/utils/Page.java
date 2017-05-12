package com.checkdormitory.utils;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Page implements Serializable {
	private static final long serialVersionUID = -8401612699604635480L;

	@SuppressWarnings("unchecked")
	public static final Page EMPTY_PAGE = new Page(Collections.EMPTY_LIST,0, 0,0);
	
	public static final String BIND_NAME="tony_page_1234";

	//~ Instance fields --------------------------------------------------------

	private List<Object> list;
	private int start;
	private int total;
	private int count;
	private boolean hasNext;
	private String dispatchUrl;
	
	//~ Constructors -----------------------------------------------------------

	public Page(List<Object> col,int start,int count, int total) {
	    if (col == null)
	        return;
		this.list = new ArrayList<Object>(col);
		this.start = start;
		this.count=count==0?list.size():count;
		this.total=total==0?list.size():total;
		this.hasNext = start + count < total;
		this.total=total;
		this.count=count;
	}
	
	//~ Methods ----------------------------------------------------------------

	public List<Object> getList() {
		return list;
	}

	public boolean isNextPageAvailable() {
		return hasNext;
	}

	public boolean isPreviousPageAvailable() {
		return start > 0;
	}

	public int getStartOfNextPage() {
		return start + count;
	}

	public int getStartOfPreviousPage() {
		return Math.max(start - count, 0);
	}

	public int getSize() {
		return count;
	}
	public int getTotal() {
		return total;
	}
	public int getStartOfCurrentPage(){
		return start;
	}
	public int getPages(){
		int pages=0;
		if(0==count)
			return 0;
		pages=total/count;
		pages=total%count==0?pages:pages+1;
		return pages;
	}
	public int getCurrentPageNumber(){
		int page=0;
		if(0==count)
			return 0;
		if(0==start && total>0)
			return 1;
		page=start/count+1;
		page=start%count==0?page:page+1;
		return page;
	}
	public int getNextPageNumber(){
		int page=0;
		int nextPageCount=getStartOfNextPage();
		if(0==count)
			return 0;
		if(0==nextPageCount && total>0)
			return 1;
		page=nextPageCount/count+1;
		page=nextPageCount%count==0?page:page+1;
		return page;
	}
	public int getPreviousPageNumber(){
		int page=0;
		int previousPageCount=getStartOfPreviousPage();
		if(0==count)
			return 0;
		if(0==previousPageCount && total>0)
			return 1;
		page=previousPageCount/count+1;
		page=previousPageCount%count==0?page:page+1;
		return page;
	}
	/**
	 * @return
	 */
	public String getDispatchUrl() {
		return dispatchUrl;
	}

	/**
	 * @param string
	 */
	public void setDispatchUrl(String string) {
		dispatchUrl = string;
	}

    /**
     * @return 返回 totalPage。
     */
    public int getTotalPage() {
        if(total % count == 0)
            return total / count;
		else
		    return total / count + 1;
    }
}
