package com.ofsoft.cms.core.api;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.ofsoft.cms.core.api.check.AbstractCheck;
import com.ofsoft.cms.core.api.check.CheckFactory;
import com.ofsoft.cms.core.api.check.ParamsCheck;
import com.ofsoft.cms.core.api.check.ParamsCheckType;
import com.ofsoft.cms.core.utils.ResultUtil;
import com.ofsoft.cms.core.utils.StringUtils;

import java.util.Map;
import java.util.regex.Pattern;

/**
 * @author OF
 * @version v1.0
 * @className AbsApi
 * @date 2018/8/24
 */
public abstract class AbstractsApi implements Interceptor {

    public void intercept(Invocation inv) {
        Controller controller = inv.getController();
        String controllerKey = inv.getControllerKey();
        String urlPara = controller.getPara();
        try {
         //白名单
        if(isOpenIpCheck()){
            checkIp(controller);
        }
        // ip 访问次数
        //获取请求方法
        String method = controller.getRequest().getMethod().toUpperCase();
        //验证请求方法
        checkMethod(controller, method, inv);
        //获取参数
        Map params = ApiUtil.getParamsMap(controller);
        //权限
        //限流、降级
        //参数校验
         checkParam(inv,params);
       // 登记流水(记录用户操作日志以及错误原因)
        inLogInfo(controller);
        inv.invoke();
        // 登记流水(记录用户操作日志以及错误原因)
        outLogInfo(controller);
        }catch (ApiException e){
            controller.renderJson(ResultUtil.genFailedResult(e.getErroCode(), e.getMessage()) );
            return;
        }catch (Exception e){
            e.printStackTrace();
            controller.renderJson(ResultUtil.genFailedResult(ApiErrorCode.getErrCode(ApiUtil.ERROR_CODE)) );
        }
    }

    protected   void outLogInfo(Controller controller){

    }
    protected   void inLogInfo(Controller controller){

    }

    /**
     * 检查ip是否是白名单
     * @param controller
     * @throws ApiException
     */
    protected  void checkIp(Controller controller) throws  ApiException{
     String ip =    ApiUtil.getIPAddress(controller.getRequest());
     if(!ApiUtil.isCheckIP(ip)){
         throw new ApiException(ApiErrorCode.ERROR_CODE_1004,ApiErrorCode.getErrCode(ApiErrorCode.ERROR_CODE_1004));
     }
    }

    /**
     * 检查参数
     * @param inv 实例
     * @param params 参数合
     * @throws ApiException
     */
    public   void checkParam(Invocation inv,Map<String, Object> params) throws ApiException {
        ParamsCheck paramsCheck = inv.getMethod().getAnnotation(ParamsCheck.class);
        if(paramsCheck == null){
            return ;
        }
        ParamsCheckType[] checkTypes = paramsCheck.value();
        for (ParamsCheckType checkType : checkTypes) {
            check(checkType,params);
        }
    }

    /**
     * 检查请求方法
     *
     * @param controller Controller
     * @param method     方法名称
     * @param inv        Invocation
     */
    protected void checkMethod(Controller controller, String method, Invocation inv)  throws ApiException {

        ApiMapping apiMapping = inv.getMethod().getAnnotation(ApiMapping.class);
        if (apiMapping != null && !apiMapping.method().equals(RequestMethod.ALL)) {
            if (!apiMapping.method().toString().equals(method)) {
                  throw new ApiException(ApiErrorCode.ERROR_CODE_1002," no request access  " + method + " method ");
            }
            //是否需要登录验证 TODO
            if(apiMapping.isAuth()){
                isAuth(controller);
            }
        }
        PostApiMapping postApiMapping = inv.getMethod().getAnnotation(PostApiMapping.class);
        if (postApiMapping != null) {
            if (!RequestMethod.POST.toString().equals(method)) {
                throw new ApiException(ApiErrorCode.ERROR_CODE_1002," no request access  " + method + " method ");
            }
        }
        GetApiMapping getApiMapping = inv.getMethod().getAnnotation(GetApiMapping.class);
        if (getApiMapping != null) {
            if (!RequestMethod.GET.toString().equals(method)) {
                throw new ApiException(ApiErrorCode.ERROR_CODE_1002," no request access  " + method + " method ");
            }
        }

    }

    /**
     * 是否开启白名单
     * @return
     */
    public boolean  isOpenIpCheck(){
        return  true;
    }

    /**
     * 用户认证
     * @param controller
     */
    protected abstract void isAuth(Controller controller);

    /**
     * 每个参数分别检查
     * @param checkType 检查类型对象
     * @param params 检查参数
     * @throws ApiException
     */
    public void check(ParamsCheckType checkType, Map<String, Object> params) throws ApiException {
        String field_name;
        String require;
        String isNotNull;
        // 获得传过来的参数
        Object param = params.get(checkType.name());

        // 判断传过来的参数是否存在(参数为必填，但传过来的参数为空)
        if (checkType.isRequire() == true && param == null) {
            throw new ApiException(ApiErrorCode.ERROR_CODE_1001,
                    checkType.name() + " " + ("".equals(checkType.checkErrorMsg()) ? " 字段不能为空" : checkType.checkErrorMsg()));
        }
        // 参数值是否为空(参数为必填，但传过来的参数值为空) true 可以为空，false 不为空
        if (checkType.isRequire() == true && checkType.isNotNull() != true) {
            if (StringUtils.isNull(param)) {
                throw new ApiException(ApiErrorCode.ERROR_CODE_1001,
                        checkType.name() +" "+ ( "".equals(checkType.checkErrorMsg())?" 字段值不能为空":checkType.checkErrorMsg()));
            }
        }
        // 校验参数最小长度
        if (!StringUtils.isNull(param) && checkType.maxLength()  > 0 && param.toString().length() < checkType.minLength()) {
            throw new ApiException(ApiErrorCode.ERROR_CODE_1001,
                    checkType.name() + "规定最小长度：" + checkType.minLength() + ",实际长度：" + param.toString().length());
        }
        // 校验参数最大长度
        if (!StringUtils.isNull(param) && checkType.maxLength() > 0 && param.toString().length() > checkType.maxLength()) {
            throw new ApiException(ApiErrorCode.ERROR_CODE_1001,
                    checkType.name() + "规定最大长度：" + checkType.maxLength() + ",实际长度：" + param.toString().length());
        }

        // 校验参数正则表达式
        if (!StringUtils.isNull(param) && !StringUtils.isNull(checkType.regexp() )) {
            if(!Pattern.matches(checkType.regexp(), param.toString())){
                throw new ApiException(ApiErrorCode.ERROR_CODE_1001,
                        checkType.name() +" "+ ( "".equals(checkType.checkErrorMsg())?"数据校验失败":checkType.checkErrorMsg()));
            }

        }
        // 验证类型
        if (!StringUtils.isNull(param) && !StringUtils.isNull(checkType.checkType() )) {
            //策略加工厂方式实现自定义验证类型
            AbstractCheck checkMain = CheckFactory.getStrategy(checkType.checkType());
            if(checkMain != null &&!checkMain.check(param.toString())){
                throw new ApiException(ApiErrorCode.ERROR_CODE_1001,
                        checkType.name() +" "+ ( "".equals(checkType.checkErrorMsg())?checkMain.errorMsg():checkType.checkErrorMsg()));
            }
        }

    }


}
