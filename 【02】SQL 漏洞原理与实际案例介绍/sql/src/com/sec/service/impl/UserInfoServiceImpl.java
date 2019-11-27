package com.sec.service.impl;

import com.sec.dao.UserInfoDao;
import com.sec.dao.impl.UserInfoDaoImpl;
import com.sec.pojo.UserInfo;
import com.sec.service.UserInfoService;

public class UserInfoServiceImpl implements UserInfoService {

		UserInfoDao  ui = new UserInfoDaoImpl();
		public UserInfo UserInfoFoundService(String id){
			
			return ui.UserInfoFoundDao(id);
		}
}
