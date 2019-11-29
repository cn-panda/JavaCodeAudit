package com.ofsoft.cms.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import org.springframework.stereotype.Service;

/**
 * 用户
 *
 * @author OF
 * @date 2018年08月12日
 */
@Service()
public class UserService {
    /**
     * 获取推荐数
     *
     * @param userId 用户编号
     * @return Record 返回 1条记录
     */
    public Record getCountNumber(String userId) {
        return Db
                .findFirst(
                        "select * from of_cms_sys_user t where t.status = '1' and t.user_id = ? ",
                        userId);
    }

    public void updateUserUrlInfo(String userId) {
        Db.update("update of_cms_sys_user  status = '1'  where user_id = ? ",
                userId);
    }

}
