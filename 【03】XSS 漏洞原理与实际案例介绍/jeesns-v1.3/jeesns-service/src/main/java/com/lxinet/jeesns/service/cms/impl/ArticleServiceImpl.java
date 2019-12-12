package com.lxinet.jeesns.service.cms.impl;

import com.lxinet.jeesns.common.utils.*;
import com.lxinet.jeesns.core.consts.AppTag;
import com.lxinet.jeesns.core.enums.MessageType;
import com.lxinet.jeesns.core.enums.Messages;
import com.lxinet.jeesns.core.exception.OpeErrorException;
import com.lxinet.jeesns.core.exception.ParamException;
import com.lxinet.jeesns.dao.cms.IArticleDao;
import com.lxinet.jeesns.model.cms.Article;
import com.lxinet.jeesns.model.common.Archive;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.service.cms.IArticleCommentService;
import com.lxinet.jeesns.service.cms.IArticleService;
import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.core.utils.*;
import com.lxinet.jeesns.service.common.IArchiveService;
import com.lxinet.jeesns.service.member.IMemberService;
import com.lxinet.jeesns.service.member.IMessageService;
import com.lxinet.jeesns.service.member.IScoreDetailService;
import com.lxinet.jeesns.service.system.IActionLogService;
import com.lxinet.jeesns.service.system.IConfigService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by zchuanzhao on 2016/10/14.
 */
@Service("articleService")
public class ArticleServiceImpl implements IArticleService {
    @Resource
    private IArticleDao articleDao;
    @Resource
    private IArchiveService archiveService;
    @Resource
    private IConfigService configService;
    @Resource
    private IArticleCommentService articleCommentService;
    @Resource
    private IActionLogService actionLogService;
    @Resource
    private IScoreDetailService scoreDetailService;
    @Resource
    private IMessageService messageService;
    @Resource
    private IMemberService memberService;

    @Override
    public Article findById(int id) {
        return this.findById(id,null);
    }

    @Override
    public Article findById(int id, Member loginMember) {
        int loginMemberId = loginMember == null ? 0 : loginMember.getId();
        Article article = articleDao.findById(id,loginMemberId);
        this.atFormat(article);
        return article;
    }

    @Override
    @Transactional
    public boolean save(Member member, Article article) {
        Map<String,String> config = configService.getConfigToMap();
        if(member.getIsAdmin() == 0 && "0".equals(config.get(ConfigUtil.CMS_POST))){
            throw new OpeErrorException(Messages.CONTRIBUTION_CLOSED);
        }
        if(article.getCateId() == null || article.getCateId() == 0){
            throw new ParamException(Messages.CATE_NOT_EMPTY);
        }
        article.setMemberId(member.getId());
        Archive archive = new Archive();
        try {
            //复制属性值
            archive = archive.copy(article);
        } catch (Exception e) {
            e.printStackTrace();
        }
        archive.setPostType(1);
        if(member.getIsAdmin() == 0 && "0".equals(config.get(ConfigUtil.CMS_POST_REVIEW))){
            article.setStatus(0);
        }else {
            article.setStatus(1);
        }
        //保存文档
        if(!archiveService.save(member,archive)){
            throw new OpeErrorException();
        }

        //保存文章
        article.setArchiveId(archive.getArchiveId());
        int result = articleDao.save(article);
        if(result == 1){
            //@会员处理并发送系统消息
            messageService.atDeal(member.getId(),article.getContent(), AppTag.CMS, MessageType.CMS_ARTICLE_REFER,article.getId());
            if(article.getStatus() == 1){
                //投稿审核通过奖励
                scoreDetailService.scoreBonus(article.getMemberId(), ScoreRuleConsts.ARTICLE_SUBMISSIONS,article.getId());
            }
            actionLogService.save(member.getCurrLoginIp(),member.getId(), ActionUtil.POST_ARTICLE,"", ActionLogType.ARTICLE.getValue(),article.getId());
        }
        return true;
    }

    @Override
    public ResultModel listByPage(Page page, String key, int cateid, int status, int memberId) {
        if (StringUtils.isNotBlank(key)){
            key = "%"+key+"%";
        }
        List<Article> list = articleDao.listByPage(page, key,cateid,status,memberId);
        ResultModel model = new ResultModel(0,page);
        model.setData(list);
        return model;
    }

    @Override
    public void updateViewCount(int id) {
        articleDao.updateViewCount(id);
    }

    @Override
    public boolean audit(int id) {
        if(articleDao.audit(id) == 0){
             throw new OpeErrorException();
        }
        Article article = this.findById(id);
        if(article != null){
            //说明此次操作是审核通过
            if(article.getStatus() == 1){
                //投稿审核通过奖励
                scoreDetailService.scoreBonus(article.getMemberId(), ScoreRuleConsts.ARTICLE_SUBMISSIONS,article.getId());
            }
        }
        return true;
    }

    @Override
    public ResultModel favor(Member loginMember, int articleId) {
        Article article = this.findById(articleId);
        ValidUtill.checkIsNull(article, Messages.ARTICLE_NOT_EXISTS);
        ResultModel resultModel = archiveService.favor(loginMember,article.getArchiveId());
        if(resultModel.getCode() == 0){
            //文章收到喜欢
            scoreDetailService.scoreBonus(loginMember.getId(), ScoreRuleConsts.ARTICLE_RECEIVED_LIKE, articleId);
            //点赞之后发送系统信息
            messageService.diggDeal(loginMember.getId(),article.getMemberId(),AppTag.CMS,MessageType.CMS_ARTICLE_LIKE,article.getId());
        }else if(resultModel.getCode() == 1){
            //取消喜欢，扣除积分
            scoreDetailService.scoreCancelBonus(loginMember.getId(),ScoreRuleConsts.ARTICLE_RECEIVED_LIKE, articleId);
        }
        return resultModel;
    }

    @Override
    public List<Article> listByCustom(int cid, String sort, int num, int day,int thumbnail) {
        return articleDao.listByCustom(cid,sort,num,day,thumbnail);
    }

    @Override
    @Transactional
    public boolean update(Member member, Article article) {
        Article findArticle = this.findById(article.getId(),member);
        ValidUtill.checkIsNull(article, Messages.ARTICLE_NOT_EXISTS);
        article.setArchiveId(findArticle.getArchiveId());
        Archive archive = new Archive();
        try {
            //复制属性值
            archive = archive.copy(article);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(!archiveService.update(member,archive)){
            throw new OpeErrorException();
        }
        Map<String,String> config = configService.getConfigToMap();
        if(member.getIsAdmin() == 0 && "0".equals(config.get(ConfigUtil.CMS_POST_REVIEW))){
            findArticle.setStatus(0);
        }else {
            findArticle.setStatus(1);
        }
        //更新栏目
        findArticle.setCateId(article.getCateId());
        articleDao.update(findArticle);;
        return true;
    }

    @Override
    @Transactional
    public boolean delete(Member member, int id) {
        Article article = this.findById(id);
        ValidUtill.checkIsNull(article, Messages.ARTICLE_NOT_EXISTS);
        int result = articleDao.delete(id);
        if(result == 0){
            throw new OpeErrorException();
        }
        //扣除积分
        scoreDetailService.scoreCancelBonus(member.getId(),ScoreRuleConsts.ARTICLE_SUBMISSIONS,id);
        archiveService.delete(article.getArchiveId());
        articleCommentService.deleteByArticle(id);
        actionLogService.save(member.getCurrLoginIp(),member.getId(), ActionUtil.DELETE_ARTICLE,"ID："+article.getId()+"，标题："+article.getTitle());
        return true;
    }

    public Article atFormat(Article article){
        article.setContent(memberService.atFormat(article.getContent()));
        return article;
    }
}
