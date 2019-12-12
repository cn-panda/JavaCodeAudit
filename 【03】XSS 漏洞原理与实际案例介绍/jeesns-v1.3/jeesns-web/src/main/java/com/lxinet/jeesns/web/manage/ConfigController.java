package com.lxinet.jeesns.web.manage;

import com.lxinet.jeesns.core.annotation.Before;
import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.utils.StringUtils;
import com.lxinet.jeesns.interceptor.AdminLoginInterceptor;
import com.lxinet.jeesns.model.system.Config;
import com.lxinet.jeesns.service.member.IMemberService;
import com.lxinet.jeesns.service.system.IConfigService;
import com.lxinet.jeesns.web.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zchuanzhao on 2017/1/3.
 */
@Controller
@RequestMapping("/${managePath}/system/config/")
@Before(AdminLoginInterceptor.class)
public class ConfigController extends BaseController {
    private static final String MANAGE_FTL_PATH = "/manage/system/config/";
    @Resource
    private IConfigService configService;
    @Resource
    private IMemberService memberService;

    @RequestMapping("edit")
    public String edit(Model model){
        List<Config> configList = configService.allList();
        for (Config config:configList) {
            model.addAttribute(config.getJkey(),config.getJvalue());
        }
        return MANAGE_FTL_PATH + "edit";
    }

    @RequestMapping(value = "baseUpdate",method = RequestMethod.POST)
    @ResponseBody
    public ResultModel baseUpdate(String site_name, String site_seo_title, String site_domain, String site_keys, String site_description,
                                  String site_logo, String site_send_email_account, String site_send_email_password,
                                  String site_send_email_smtp, String site_icp, String site_copyright, String site_tongji){
        Map<String,String> params = new HashMap<>();
        params.put("site_name",site_name);
        params.put("site_seo_title",site_seo_title);
        params.put("site_domain",site_domain);
        params.put("site_keys",site_keys);
        params.put("site_description",site_description);
        if(StringUtils.isNotEmpty(site_logo)){
            params.put("site_logo",site_logo);
        }
        params.put("site_send_email_account",site_send_email_account);
        params.put("site_send_email_smtp",site_send_email_smtp);
        params.put("site_icp",site_icp);
        params.put("site_copyright",site_copyright);
        site_tongji = site_tongji.replace("&lt;","<").replace("&gt;",">").replace("&#47;","/");
        params.put("site_tongji",site_tongji);
        if(StringUtils.isNotEmpty(site_send_email_password)){
            params.put("site_send_email_password",site_send_email_password);
        }
        return new ResultModel(configService.update(params,request));
    }

    @RequestMapping(value = "memberUpdate",method = RequestMethod.POST)
    @ResponseBody
    public ResultModel memberUpdate(String member_login_open,String member_register_open,String member_email_valid){
        Map<String,String> params = new HashMap<>();
        params.put("member_login_open",member_login_open);
        params.put("member_register_open",member_register_open);
        params.put("member_email_valid",member_email_valid);
        return new ResultModel(configService.update(params,request));
    }

    @RequestMapping(value = "cmsUpdate",method = RequestMethod.POST)
    @ResponseBody
    public ResultModel cmsUpdate(String cms_post,String cms_post_review){
        Map<String,String> params = new HashMap<>();
        params.put("cms_post",cms_post);
        params.put("cms_post_review",cms_post_review);
        return new ResultModel(configService.update(params,request));
    }

    @RequestMapping(value = "groupUpdate",method = RequestMethod.POST)
    @ResponseBody
    public ResultModel groupUpdate(String group_apply,String group_apply_review,String group_alias){
        Map<String,String> params = new HashMap<>();
        if(StringUtils.isEmpty(group_alias)){
            group_alias = "群组";
        }
        params.put("group_alias",group_alias);
        params.put("group_apply",group_apply);
        params.put("group_apply_review",group_apply_review);
        return new ResultModel(configService.update(params,request));
    }

    @RequestMapping(value = "weiboUpdate",method = RequestMethod.POST)
    @ResponseBody
    public ResultModel weiboUpdate(String weibo_post,String weibo_post_maxcontent,String weibo_alias){
        if(Integer.parseInt(weibo_post_maxcontent) > 500){
            return new ResultModel(-1,"微博最大字数不能超过500");
        }
        Map<String,String> params = new HashMap<>();
        if(StringUtils.isEmpty(weibo_alias)){
            weibo_alias = "微博";
        }
        params.put("weibo_alias",weibo_alias);
        params.put("weibo_post",weibo_post);
        params.put("weibo_post_maxcontent",weibo_post_maxcontent);
        return new ResultModel(configService.update(params,request));
    }


}
