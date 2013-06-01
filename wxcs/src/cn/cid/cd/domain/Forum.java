package cn.cid.cd.domain;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

public class Forum implements Comparator<Forum>{

	private Long id;
	private String name;
	private String discription;
	private Integer clickTimes;
	private Date addTime;
	private GameImage forumLogo = new GameImage();
	@Override
	public String toString() {
		return "Forum [id=" + id + ", name=" + name + ", discription="
				+ discription + ", clickTimes=" + clickTimes + ", forumLogo="
				+ forumLogo + ", addTime=" + addTime + "]";
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public Integer getClickTimes() {
		return clickTimes;
	}
	public void setClickTimes(Integer clickTimes) {
		this.clickTimes = clickTimes;
	}
	
	
	
	public GameImage getForumLogo() {
		return forumLogo;
	}
	public void setForumLogo(GameImage forumLogo) {
		this.forumLogo = forumLogo;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	@Override
	public int compare(Forum o1, Forum o2) {
		
		return o2.getAddTime().compareTo(o1.getAddTime());
	}
}
