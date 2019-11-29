package com.ofsoft.cms.core.api;

import com.jfinal.core.Controller;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author OF
 * @date 2018年8月5日
 */
public final class ApiUtil {

    public static final String SUCCESS_CODE = "200";
    public static final String ERROR_CODE = "-1";
    private static  List<String>  ip = new ArrayList<String>();
    static{
        ip.add("127.0.0.1");
    }
    public final static Map<String, Object> genSuccessResult() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", SUCCESS_CODE);
        map.put("success", true);//让浏览器认为是请求成功了
        map.put("msg", ApiErrorCode.getErrCode(SUCCESS_CODE));
        return map;
    }

    public final static Map<String, Object> genSuccessResult(Object data) {
        Map<String, Object> map = genSuccessResult();
        map.put("data", data == null ? new Object() : data);
        map.put("code", SUCCESS_CODE);
        map.put("success", true);
        map.put("msg", ApiErrorCode.getErrCode(SUCCESS_CODE));
        return map;
    }

    public final static Map<String, Object> genFailedResultList(Object data) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("success", false);
        map.put("code", ERROR_CODE);
        map.put("data",  data == null ? new Object() : data);
        return map;
    }

    public final static Map<String, Object> genFailedResult(String msg) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("success", false);
        map.put("code", ERROR_CODE);
        map.put("msg", msg);
        return map;
    }

    public final static Map<String, Object> genFailedResult(int code, String msg) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("success", false);//后台抛出异常也认为是浏览器请求成功了。只是code码不为200，而是 -200
        map.put("code", code);
        map.put("msg", msg);
        return map;
    }

    public final static Map<String, Object> genFailedResult(String code, String msg) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("success", false);
        map.put("code", code);
        map.put("msg", msg);
        return map;
    }

    /**
     * 获取所用参数
     *
     * @param controller 控制器
     * @return
     */
    public static Map<String, Object> getParamsMap(Controller controller) {
        Map<String, String[]> params = controller.getParaMap();
        Map<String, Object> result = new ConcurrentHashMap<String, Object>();
        for (String value : params.keySet()) {
            result.put(value, params.get(value)[0]);
        }
        return result;
    }

    public static List<String> getIpList() {
        return ip;
    }
    public static boolean isCheckIP(String value){
        for (String s :ip){
            if(s.equals(value)) {
                return true;
            }
        }
        return false;
    }
    public static void setIpList(List list) {
          ip.addAll(list);
    }
    public static void setIp(String value) {
         ip.add(value);
    }

    public static String getIPAddress(HttpServletRequest request)
    {
        String ip = request.getHeader("x-forwarded-for");
        if(StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip))
            ip = request.getRemoteAddr();
        return ip;
    }
}
