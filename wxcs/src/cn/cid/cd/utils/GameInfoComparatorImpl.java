package cn.cid.cd.utils;

import java.util.Comparator;

import cn.cid.cd.domain.Forum;
import cn.cid.cd.domain.GameInfo;

public class GameInfoComparatorImpl implements Comparator<GameInfo> {

	@Override
	public int compare(GameInfo o1, GameInfo o2) {
		//按时间排序...默认是从小到大,现在是从大到小.
		return -(o1.getAddTime().compareTo(o2.getAddTime()));
	}

	

	

}
