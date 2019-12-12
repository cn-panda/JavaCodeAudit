package com.lxinet.jeesns.web.manage;

import com.lxinet.jeesns.common.utils.MemberUtil;
import com.lxinet.jeesns.core.annotation.Before;
import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.interceptor.AdminLoginInterceptor;
import com.lxinet.jeesns.model.cms.Article;
import com.lxinet.jeesns.model.cms.ArticleCate;
import com.lxinet.jeesns.model.cms.ArticleComment;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.service.cms.IArticleCateService;
import com.lxinet.jeesns.service.cms.IArticleCommentService;
import com.lxinet.jeesns.service.cms.IArticleService;
import com.lxinet.jeesns.web.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * Created by zchuanzhao on 18/8/15.
 */
@Controller("manageArticleCommentController")
@RequestMapping("${managePath}/cms/comment")
@Before(AdminLoginInterceptor.class)
public class ArticleCommentController extends BaseController {
    private static final String MANAGE_FTL_PATH = "/manage/cms/comment/";
    @Resource
    private IArticleCommentService articleCommentService;

    @RequestMapping("/list")
    public String list(String key, @RequestParam(value = "articleId",defaultValue = "0",required = false) Integer articleId, Model model) {
        Page page = new Page(request);
        List<ArticleComment> list = articleCommentService.listByPage(page, articleId, key);
        ResultModel resultModel = new ResultModel(0, page);
        resultModel.setData(list);
        model.addAttribute("model", resultModel);
        model.addAttribute("key",key);
        return MANAGE_FTL_PATH + "list";
    }


    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    @ResponseBody
    public ResultModel delete(@PathVariable("id") Integer id){
        Member loginMember = MemberUtil.getLoginMember(request);
        return new ResultModel(articleCommentService.delete(loginMember,id));
    }

}
