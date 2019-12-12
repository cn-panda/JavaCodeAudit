package com.lxinet.jeesns.web.manage;

import com.lxinet.jeesns.core.annotation.Before;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.interceptor.AdminLoginInterceptor;
import com.lxinet.jeesns.model.system.Action;
import com.lxinet.jeesns.model.system.ActionLog;
import com.lxinet.jeesns.service.system.IActionLogService;
import com.lxinet.jeesns.service.system.IActionService;
import com.lxinet.jeesns.web.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zchuanzhao on 2017/2/14.
 */
@Controller
@RequestMapping("/${managePath}/system/action/")
@Before(AdminLoginInterceptor.class)
public class ActionController extends BaseController {
    private static final String MANAGE_FTL_PATH = "/manage/system/action/";
    @Resource
    private IActionService actionService;
    @Resource
    private IActionLogService actionLogService;

    @RequestMapping("list")
    public String actionList(Model model){
        List<Action> list = actionService.list();
        model.addAttribute("list",list);
        return MANAGE_FTL_PATH + "list";
    }

    @RequestMapping("edit/{id}")
    public String find(@PathVariable("id") Integer id, Model model){
        Action action = actionService.findById(id);
        model.addAttribute("action",action);
        return MANAGE_FTL_PATH + "edit";
    }

    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public ResultModel update(Action action){
        return new ResultModel(actionService.update(action));
    }

    @RequestMapping(value = "isenable/{id}",method = RequestMethod.GET)
    @ResponseBody
    public ResultModel isenable(@PathVariable("id") Integer id){
        return new ResultModel(actionService.isenable(id));
    }

    @RequestMapping("actionLogList")
    public String actionLogList(@RequestParam(value = "memberId",required = false) Integer memberId, Model model){
        Page page = new Page(request);
        if(memberId == null){
            memberId = 0;
        }
        ResultModel<ActionLog> list = actionLogService.listByPage(page,memberId);
        model.addAttribute("model",list);
        return MANAGE_FTL_PATH + "actionLogList";
    }

    @RequestMapping("memberActionLog")
    public String memberActionLog(@RequestParam(value = "memberId",required = false) Integer memberId, Model model){
        Page page = new Page(request);
        if(memberId == null){
            memberId = 0;
        }
        ResultModel<ActionLog> list = actionLogService.memberActionLog(page,memberId);
        model.addAttribute("model",list);
        return MANAGE_FTL_PATH + "memberActionLog";
    }


}
