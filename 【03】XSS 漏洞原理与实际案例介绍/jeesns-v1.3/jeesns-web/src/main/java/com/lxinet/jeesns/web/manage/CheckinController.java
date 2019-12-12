package com.lxinet.jeesns.web.manage;

import com.lxinet.jeesns.core.annotation.Before;
import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.interceptor.AdminLoginInterceptor;
import com.lxinet.jeesns.model.member.Checkin;
import com.lxinet.jeesns.model.system.ScoreRule;
import com.lxinet.jeesns.service.member.ICheckinService;
import com.lxinet.jeesns.service.system.IScoreRuleService;
import com.lxinet.jeesns.web.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 签到
 * Created by zchuanzhao on 2018/8/20.
 */
@Controller("manageCheckinController")
@RequestMapping("/${managePath}/checkin/")
@Before(AdminLoginInterceptor.class)
public class CheckinController extends BaseController {
    private static final String MANAGE_FTL_PATH = "/manage/checkin/";
    @Resource
    private ICheckinService checkinService;

    @RequestMapping("list")
    public String list(Model model){
        Page page = new Page<Checkin>(request);
        List<Checkin> list = checkinService.list(page, 0);
        ResultModel resultModel = new ResultModel(0, page);
        resultModel.setData(list);
        model.addAttribute("model",resultModel);
        return MANAGE_FTL_PATH + "list";
    }
}
