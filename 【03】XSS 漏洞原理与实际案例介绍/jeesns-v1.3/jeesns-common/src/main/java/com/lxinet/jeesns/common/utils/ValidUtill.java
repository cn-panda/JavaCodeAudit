package com.lxinet.jeesns.common.utils;

import com.lxinet.jeesns.core.enums.Messages;
import com.lxinet.jeesns.core.exception.NotFountException;
import com.lxinet.jeesns.core.exception.NotLoginException;
import com.lxinet.jeesns.core.exception.ParamException;
import com.lxinet.jeesns.core.utils.StringUtils;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.model.member.Message;

/**
 * @author zchuanzhao@linewell.com
 * 2018/8/2
 */
public class ValidUtill {

    public static void checkLogin(Member member){
        if (null == member){
            throw new NotLoginException();
        }
    }

    public static void checkParam(Boolean... boos){
        for (boolean boo :boos){
            if (!boo){
                throw new ParamException();
            }
        }
    }

    public static void checkIsNull(Object obj){
        if (null == obj){
            throw new ParamException();
        }
    }

    public static void checkIsNull(Object obj, Messages messages){
        if (null == obj){
            throw new ParamException(messages);
        }
    }
    public static void checkIsBlank(String val, Messages messages){
        if (StringUtils.isBlank(val)){
            throw new ParamException(messages);
        }
    }
}
