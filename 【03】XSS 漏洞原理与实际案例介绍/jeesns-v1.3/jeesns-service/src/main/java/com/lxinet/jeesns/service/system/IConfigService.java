package com.lxinet.jeesns.service.system;

import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.model.system.Config;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by zchuanzhao on 16/9/29.
 */
public interface IConfigService {
    List<Config> allList();

    Map<String,String> getConfigToMap();

    String getValue(String key);

    boolean update(Map<String,String> params, HttpServletRequest request);
}
