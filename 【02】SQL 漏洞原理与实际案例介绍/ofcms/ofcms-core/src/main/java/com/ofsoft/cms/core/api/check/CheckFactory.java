package com.ofsoft.cms.core.api.check;

import com.ofsoft.cms.core.api.ApiErrorCode;
import com.ofsoft.cms.core.api.ApiException;

/**
 * @author OF
 * @version v1.0
 * @className CheckFactory
 * @date 2018/8/24
 */
public class CheckFactory {
    public static AbstractCheck getStrategy(Class  value) throws ApiException {
        AbstractCheck check = null;
        try {
          Object object =   value.newInstance();
            if(object instanceof  AbstractCheck){
                check = (AbstractCheck) object;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ApiException(ApiErrorCode.getErrCode(ApiErrorCode.ERROR_CODE_1003));
        }
        return check;
    }
}
