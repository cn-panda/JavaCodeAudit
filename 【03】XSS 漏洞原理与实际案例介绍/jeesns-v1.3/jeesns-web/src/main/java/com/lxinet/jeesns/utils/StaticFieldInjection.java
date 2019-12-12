package com.lxinet.jeesns.utils;

import com.lxinet.jeesns.core.utils.LocaleUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import javax.annotation.PostConstruct;

/**
 * @author zchuanzhao
 */
@Component
public class StaticFieldInjection {

    @Autowired
    private MessageSource messageSource;

    @PostConstruct
    private void init(){
        LocaleUtil.setMessageSource(messageSource);
    }
}
