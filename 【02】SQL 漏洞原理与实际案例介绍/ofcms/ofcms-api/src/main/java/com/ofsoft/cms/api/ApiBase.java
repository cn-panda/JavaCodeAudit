package com.ofsoft.cms.api;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.render.JsonRender;
import com.jfinal.weixin.sdk.utils.JsonUtils;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.api.ApiErrorCode;
import com.ofsoft.cms.core.api.ApiInterceptor;
import com.ofsoft.cms.core.api.ApiUtil;
import com.ofsoft.cms.core.spring.IocInterceptor;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 对外提供接口
 *
 * @author OF
 * @date 2017年12月14日
 */
@Action(path = "/api")
//@Before(IocInterceptor.class)
@Before({ ApiInterceptor.class,IocInterceptor.class})
public abstract class ApiBase extends Controller {
    protected void rendSuccessJson(Object data) {
        rendJson(ApiUtil.genSuccessResult(data));
    }

    protected void rendSuccessJson(Object data, Integer TotalPage,
                                   Integer PageNumber) {
        Map<String, Object> map = ApiUtil.genSuccessResult();
        map.put("data", data);
        map.put("total_page", TotalPage);
        map.put("page_size", PageNumber);
        rendJson(map);
    }

    protected void rendSuccessJson() {
        rendJson(ApiUtil.genSuccessResult());
    }

    protected void rendFailedJson() {
        rendJson(ApiUtil.genFailedResult(ApiErrorCode.getErrCode(ApiUtil.ERROR_CODE)));
    }

    protected void rendFailedJson(final String msg) {
        rendJson(ApiUtil.genFailedResult(msg));
    }

    protected void rendFailedJson(final int code, final String msg) {
        rendJson(ApiUtil.genFailedResult(code, msg));
    }

    protected void rendFailedJson(final String code, final String msg) {
        rendJson(ApiUtil.genFailedResult(code, msg));
    }

    protected void rendJson(Object json) {
        String agent = getRequest().getHeader("User-Agent");
        if (agent.contains("MSIE"))
            this.render(new JsonRender(json).forIE());
        else {
            this.render(new JsonRender(json));
        }
    }
     private  String jsonStr = null;
    /**
     * 获取json参数
     *
     * @return json
     */
    public String getParaJson() {
        if(jsonStr == null){
            jsonStr =   HttpKit.readData(getRequest());
        }
        return jsonStr;
    }

    /**
     * 获取json参数
     *
     * @param name 参数名
     * @return 参数值
     */
    public String getParaJson(String name) {
        return (String) getParaJsonMap().get(name);
    }


    public String getPara() {
        return HttpKit.readData(getRequest());
    }

    /**
     * 获取k/vMap 参数
     * <pre>
     *     <b>getParaMap </b>
     *     <code><@{@link com.jfinal.core.Controller getParaMap }</code>
     * </pre>
     *
     * @return Map
     */
    public Map<String, Object> getParamsMap() {
        Map<String, String[]> params = getParaMap();
        Map<String, Object> result = new ConcurrentHashMap<String, Object>();
        for (String value : params.keySet()) {
            result.put(value, params.get(value)[0]);
        }
        return result;
    }

    /**
     * 获取json参数
     *
     * @param name 参数名
     * @return 参数值
     */
    public Integer getParaJsonInt(String name) {
        return (Integer) getParaJsonMap().get(name);
    }

    /**
     * 获取json Map
     * <p>
     * 参数名
     *
     * @return 参数值
     */
    public Map<String, Object> getParaJsonMap() {
        Map result = JsonUtils.parse(getParaJson(), Map.class);
        return result;
    }

    /**
     * 获取xml参数
     *
     * @return xml
     */
    public String getParaXml() {
        return HttpKit.readData(getRequest());
    }
}
