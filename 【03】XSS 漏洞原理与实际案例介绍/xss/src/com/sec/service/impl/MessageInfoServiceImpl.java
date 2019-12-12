package com.sec.service.impl;

import java.util.List;

import com.sec.dao.MessageInfoDao;
import com.sec.dao.impl.MessageInfoDaoImpl;
import com.sec.pojo.MessageInfo;
import com.sec.service.MessageInfoService;

public class MessageInfoServiceImpl implements MessageInfoService {
	
	MessageInfoDao msginfo = new MessageInfoDaoImpl();
	
	public List<MessageInfo> MessageInfoShowService(){
		
		List<MessageInfo> msg = msginfo.MessageInfoShowDao();
		return msg;
	}

	public boolean MessageInfoStoreService(String name, String mail, String message){
		
		return 	msginfo.MessageInfoStoreDao(name, mail, message);

	}
	
}
