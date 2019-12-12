package com.lxinet.jeesns.service.common;

import com.lxinet.jeesns.model.common.Archive;
import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.model.member.Member;


/**
 * Created by zchuanzhao on 2016/10/14.
 */
public interface IArchiveService {

    Archive findByArchiveId(int id);

    boolean save(Member member, Archive archive);

    boolean update(Member member, Archive archive);

    boolean delete(int id);

    void updateViewCount(int id);

    ResultModel favor(Member loginMember, int archiveId);
}
