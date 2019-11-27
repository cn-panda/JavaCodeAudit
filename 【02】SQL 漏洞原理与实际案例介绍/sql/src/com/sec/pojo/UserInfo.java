package com.sec.pojo;

public class UserInfo {

	private String id;
	private String name;
	private int age;
	private String content;
	private String address;
	
	
	
	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public UserInfo(String id, String name, int age, String content, String address) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.content = content;
		this.address = address;
	}



	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", name=" + name + ", age=" + age + ", content=" + content + ", address="
				+ address + "]";
	}
	
	
	
}
