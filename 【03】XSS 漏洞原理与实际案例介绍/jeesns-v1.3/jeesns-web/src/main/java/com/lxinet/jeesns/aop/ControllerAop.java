package com.lxinet.jeesns.aop;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.core.exception.JeeException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * @author zchuanzhao
 */
public class ControllerAop {

    public Object handlerController(ProceedingJoinPoint pjp){
        ResultModel<?> result;
        try {
            result = (ResultModel) pjp.proceed();
        } catch (Throwable e) {
            result = handlerExceotion(pjp, e);
        }
        return result;
    }

    private ResultModel<?> handlerExceotion(ProceedingJoinPoint pjp, Throwable e){
        ResultModel<?> result = new ResultModel();
        if (e instanceof JeeException && null != ((JeeException) e).getJeeMessage()){
            result.setMessage(((JeeException)e).getJeeMessage());
        }else {
            result.setCode(-1);
            if (null == e.getMessage()){
                result.setMessage("系统异常：" + e.toString());
            }else {
                result.setMessage(e.getMessage());
            }
            e.printStackTrace();
        }
        return result;
    }
}
