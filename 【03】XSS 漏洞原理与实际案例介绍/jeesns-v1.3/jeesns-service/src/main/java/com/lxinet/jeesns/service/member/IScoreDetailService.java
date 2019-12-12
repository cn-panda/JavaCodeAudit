package com.lxinet.jeesns.service.member;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.model.Page;
import com.lxinet.jeesns.model.member.ScoreDetail;


/**
 * Created by zchuanzhao on 17/3/24.
 */
public interface IScoreDetailService {

    ResultModel<ScoreDetail> list(Page page, Integer memberId);

    ResultModel save(ScoreDetail scoreDetail);

    /**
     * 是否能奖励，true表示可以奖励
     * @param memberId
     * @param scoreRuleId
     * @param type
     * @return
     */
    boolean canBonus(int memberId, int scoreRuleId, String type);

    /**
     * 根据会员、获取奖励的外键、奖励规则ID获取奖励激励，不包括foreign_id=0
     * @param memberId
     * @param scoreRuleId
     * @param forgignId
     * @return
     */
    ScoreDetail findByForeignAndRule(int memberId, int scoreRuleId, int forgignId);

    void cancel(int scoreDetailId);

    void scoreBonus(int memberId, int scoreRuleId);

    void scoreBonus(int memberId, int scoreRuleId, int foreignId);

    void scoreCancelBonus(int memberId, int scoreRuleId, int foreignId);
}
