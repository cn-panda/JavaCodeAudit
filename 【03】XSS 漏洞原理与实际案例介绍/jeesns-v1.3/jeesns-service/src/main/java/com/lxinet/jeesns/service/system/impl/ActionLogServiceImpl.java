package com.lxinet.jeesns.service.system.impl;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.dao.system.IActionLogDao;
import com.lxinet.jeesns.model.system.Action;
import com.lxinet.jeesns.model.system.ActionLog;
import com.lxinet.jeesns.service.system.IActionLogService;
import com.lxinet.jeesns.service.system.IActionService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zchuanzhao on 2017/2/14.
 */
@Service("actionLogService")
public class ActionLogServiceImpl implements IActionLogService {
    @Resource
    private IActionService actionService;
    @Resource
    private IActionLogDao actionLogDao;

    @Override
    public ResultModel<ActionLog> listByPage(Page page, Integer memberId) {
        List<ActionLog> list = actionLogDao.listByPage(page, memberId);
        ResultModel model = new ResultModel(0, page);
        model.setData(list);
        return model;
    }

    @Override
    public ResultModel<ActionLog> memberActionLog(Page page, Integer memberId) {
        List<ActionLog> list = actionLogDao.memberActionLog(page, memberId);
        ResultModel model = new ResultModel(0, page);
        model.setData(list);
        return model;
    }

    @Override
    public ActionLog findById(Integer id) {
        return actionLogDao.findById(id);
    }

    @Override
    public void save(String actionIp, Integer memberId, Integer actionId) {
        this.save(actionIp,memberId,actionId,"",0,0);
    }

    @Override
    public void save(String actionIp, Integer memberId, Integer actionId, String remark) {
        this.save(actionIp,memberId,actionId,remark,0,0);
    }

    @Override
    public void save(String actionIp, Integer memberId, Integer actionId, String remark, Integer type, Integer foreignId) {
        Action action = actionService.findById(actionId);
        if(action != null){
            if(action.getStatus() == 0){
                ActionLog actionLog = new ActionLog(memberId,actionId,remark,actionIp,type,foreignId);
                actionLogDao.save(actionLog);
            }
        }
    }

}
