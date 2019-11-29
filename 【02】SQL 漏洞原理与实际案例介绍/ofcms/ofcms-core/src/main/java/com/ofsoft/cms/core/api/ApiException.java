package com.ofsoft.cms.core.api;

import java.util.Map;

/**
 * @author OF
 * @version v1.0
 * @className ApiException
 * @date 2018/8/24
 */
public class ApiException extends Exception {

    private static final long serialVersionUID = 1L;
    private String erroCode;
    private Map returndata;
    public ApiException(String msg)
    {
        super(msg);
        erroCode = null;
    }

    public ApiException(String message, Map returndata)
    {
        super(message);
        erroCode = null;
        this.returndata = returndata;
    }

    public ApiException(String erroCode, String msg)
    {
        super(msg);
        this.erroCode = null;
        this.erroCode = erroCode;
    }

    public String getErroCode()
    {
        return erroCode;
    }

    public Map getReturndata()
    {
        return returndata;
    }

}
