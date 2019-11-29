package com.ofsoft.cms.admin.service.system;

import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.apache.shiro.session.mgt.eis.SessionDAO;

public class SessionDao extends EnterpriseCacheSessionDAO {
	public static SessionDAO sessionDAO;

	public SessionDao() {
		super();
		sessionDAO = this;
	}
}
