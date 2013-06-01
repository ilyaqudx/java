package cn.cid.cd.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class GameInfo {

	private Long id;
	private String name;
	private String version;
	private GameStyle style;
	private Long download_Times;
	private SDKVersion minSDK;
	private int isFree = 1;//1就是代表是.0为否.
	private Devloper dev;
	private String discription;
	private GameLogo logo;
	private Forum forum;
	public Forum getForum() {
		return forum;
	}
	public void setForum(Forum forum) {
		this.forum = forum;
	}
	private int top;
	private int foot;
	private Date addTime;
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}
	public int getFoot() {
		return foot;
	}
	public void setFoot(int foot) {
		this.foot = foot;
	}
	public GameLogo getLogo() {
		return logo;
	}
	public void setLogo(GameLogo logo) {
		this.logo = logo;
	}
	private List<GameImage> images = new ArrayList<GameImage>();
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
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public GameStyle getStyle() {
		return style;
	}
	public void setStyle(GameStyle style) {
		this.style = style;
	}
	public Long getDownload_Times() {
		return download_Times;
	}
	public void setDownload_Times(Long download_Times) {
		this.download_Times = download_Times;
	}
	public SDKVersion getMinSDK() {
		return minSDK;
	}
	public void setMinSDK(SDKVersion minSDK) {
		this.minSDK = minSDK;
	}
	public int getIsFree() {
		return isFree;
	}
	public void setIsFree(int isFree) {
		this.isFree = isFree;
	}
	public Devloper getDev() {
		return dev;
	}
	public void setDev(Devloper dev) {
		this.dev = dev;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public List<GameImage> getImages() {
		return images;
	}
	public void setImages(List<GameImage> images) {
		this.images = images;
	}
	@Override
	public String toString() {
		return "GameInfo [id=" + id + ", name=" + name + ", version=" + version
				+ ", style=" + style + ", download_Times=" + download_Times
				+ ", minSDK=" + minSDK + ", isFree=" + isFree + ", dev=" + dev
				+ ", discription=" + discription + ", logo=" + logo + ", top="
				+ top + ", foot=" + foot + ", images=" + images + "]";
	}
	
	
	 
	
}
