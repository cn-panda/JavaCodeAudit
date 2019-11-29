package com.ofsoft.cms.admin.domain;

import java.util.Date;

public class UserOnline {
	private String id;
	/**
	 * 用户主机地址
	 */
	private String host;
	private Integer userId;
	private String userName;
	private String loginName;
	private String userMobile;
	private String userEmail;
	private String status;
	private String userSex;
	/**
	 * session创建时间
	 */
	private Date startTimestamp;
	/**
	 * session最后访问时间
	 */
	private Date lastAccessTime;

	/**
	 * 超时时间
	 */
	private Long timeout;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}

	public String getLoginName() {
		return loginName;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public String getStatus() {
		return status;
	}

	public String getUserSex() {
		return userSex;
	}

 

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getStartTimestamp() {
		return startTimestamp;
	}

	public void setStartTimestamp(Date startTimestamp) {
		this.startTimestamp = startTimestamp;
	}

	public Date getLastAccessTime() {
		return lastAccessTime;
	}

	public void setLastAccessTime(Date lastAccessTime) {
		this.lastAccessTime = lastAccessTime;
	}

	public Long getTimeout() {
		return timeout;
	}

	public void setTimeout(Long timeout) {
		this.timeout = timeout;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

}
