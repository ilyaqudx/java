package com.iori.androiddemos.sms;

import java.util.Date;


public class SMS {

	private Long id;
	
	private long threadId;
	public long getThreadId() {
		return threadId;
	}
	public void setThreadId(long threadId) {
		this.threadId = threadId;
	}
	/**
	 * 短信的内容
	 */
	private String body;
	/**
	 * 对方地址
	 */
	private String address;
	/**
	 * 在手机中储存的名称,没有则为NULL
	 */
	private String person;
	/**
	 * 发送或接收的时间
	 */
	private Date date;
	/**
	 * 短信的类型,2为发送,1为接收.
	 */
	private int type;//2为发送,1为接收
	
	
	//>>以下暂时未使用
	/**
	 * 是否已经阅读,0>>未读,1>>已读
	 */
	private int read;
	/**
	 * 短信协议,0>>短信,1>>彩信
	 */
	private int protocol;
	/**
	 * 短信的发送或接收状态
	 */
	private int status;
	/**
	 * 短信中心号码
	 */
	private String service_center;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	public int getProtocol() {
		return protocol;
	}
	public void setProtocol(int protocol) {
		this.protocol = protocol;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getService_center() {
		return service_center;
	}
	public void setService_center(String service_center) {
		this.service_center = service_center;
	}
	@Override
	public String toString() {
		return "SMS [id=" + id + ", threadId=" + threadId + ", body=" + body
				+ ", address=" + address + ", person=" + person + ", date="
				+ date + ", type=" + type + ", read=" + read + ", protocol="
				+ protocol + ", status=" + status + ", service_center="
				+ service_center + "]";
	}
	
	
}
