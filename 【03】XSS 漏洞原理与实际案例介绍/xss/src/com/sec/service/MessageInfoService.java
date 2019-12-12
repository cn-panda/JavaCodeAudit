package com.sec.service;

import java.util.List;

import com.sec.pojo.MessageInfo;

public interface MessageInfoService {

	boolean MessageInfoStoreService(String name, String mail, String message);
	
	List<MessageInfo> MessageInfoShowService();

}
