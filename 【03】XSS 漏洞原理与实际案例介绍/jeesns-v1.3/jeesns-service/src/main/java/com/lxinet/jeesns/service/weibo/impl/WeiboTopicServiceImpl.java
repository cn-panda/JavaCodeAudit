package com.lxinet.jeesns.service.weibo.impl;

import com.lxinet.jeesns.dao.weibo.IWeiboTopicDao;
import com.lxinet.jeesns.model.weibo.WeiboTopic;
import com.lxinet.jeesns.service.weibo.IWeiboTopicService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

/**
 * Created by zchuanzhao on 2018/11/14.
 */
@Service("weiboTopicService")
public class WeiboTopicServiceImpl implements IWeiboTopicService {
    @Resource
    private IWeiboTopicDao weiboTopicDao;

    @Override
    public WeiboTopic findByName(String name) {
        return weiboTopicDao.findByName(name);
    }

    @Override
    public Integer save(WeiboTopic weiboTopic){
        weiboTopicDao.save(weiboTopic);
        return weiboTopic.getId();
    }
}
