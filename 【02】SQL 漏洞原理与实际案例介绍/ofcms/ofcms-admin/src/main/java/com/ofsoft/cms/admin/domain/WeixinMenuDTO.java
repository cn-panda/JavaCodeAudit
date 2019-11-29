package com.ofsoft.cms.admin.domain;

import java.util.ArrayList;

/**
 * 微信菜单DTO
 * 
 * @author OF
 * @date 2018年3月16日
 */
public class WeixinMenuDTO {

	private ArrayList<WeixinMenuDTO> sub_button;
	private String name;
	private String url;
	private String type;

	public WeixinMenuDTO(ArrayList<WeixinMenuDTO> sub_button, String name,
			String url, String type) {
		super();
		this.sub_button = sub_button;
		this.name = name;
		this.url = url;
		this.type = type;
	}

	public WeixinMenuDTO(String name, String url, String type) {
		super();
		this.name = name;
		this.url = url;
		this.type = type;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrl() {
		return url;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public void setSub_button(ArrayList<WeixinMenuDTO> sub_button) {
		this.sub_button = sub_button;
	}

	public ArrayList<WeixinMenuDTO> getSub_button() {
		return sub_button;
	}
}
