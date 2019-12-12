package com.lxinet.jeesns.core.dto;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.lxinet.jeesns.core.enums.Messages;
import com.lxinet.jeesns.core.model.Page;

import java.io.Serializable;

/**
 * Created by zchuanzhao on 2016/10/16.
 */
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class ResultModel<T> implements Serializable{
    public static final Integer SUCCESS = 0;
    public static final Integer ERROR = -1;

    /**
     * -2参数错误，-1操作失败，0操作成功，1成功刷新当前页，2成功并跳转到url，3成功并刷新iframe的父界面
     */
    private int code;

    private String message;

    private String url;

    private T data;

    private Page page;

    public ResultModel() {

    }

    public ResultModel(int code) {
        this.code = code;
        if(code == -2){
            setMessage("参数错误");
        }else if(code == ERROR){
            setMessage(Messages.ERROR);
        }else if(code == SUCCESS){
            setMessage(Messages.SUCCESS);
        }
    }


    public ResultModel(T data) {
        if (data instanceof Boolean){
            Boolean flag = (Boolean) data;
            if (flag == true){
                setMessage(Messages.SUCCESS);
            }else {
                setMessage(Messages.ERROR);
            }
        }else {
            this.code = SUCCESS;
            this.data = data;
        }
    }

    public ResultModel(int code, Page page) {
        this.code = code;
        this.page = page;
    }

    public ResultModel(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public ResultModel(int code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public ResultModel(int code, String message, String url) {
        this.code = code;
        this.message = message;
        this.url = url;
    }

    public ResultModel(Messages message) {
        this.code = message.getCode();
        this.message = message.getMessage();
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }


    public void setMessage(Messages message) {
        this.code = message.getCode();
        this.message = message.getMessage();
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
