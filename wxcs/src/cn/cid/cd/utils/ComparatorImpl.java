package cn.cid.cd.utils;

import java.util.Comparator;

import cn.cid.cd.domain.Forum;

public class ComparatorImpl implements Comparator<Forum> {

	
	
	@Override
	public int compare(Forum o1, Forum o2) {
		
		//按时间排序...默认是从小到大,现在是从大到小.
		return -(o1.getAddTime().compareTo(o2.getAddTime()));
	}

	

}
