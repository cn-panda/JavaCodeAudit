package com.sec.dao;

import java.util.List;

import com.sec.pojo.MessageInfo;

public interface MessageInfoDao {

	boolean MessageInfoStoreDao(String name, String mail, String message);
	List<MessageInfo> MessageInfoShowDao();
}
