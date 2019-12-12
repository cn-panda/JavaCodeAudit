package com.lxinet.jeesns.core.handler;

import freemarker.core.Environment;
import freemarker.template.*;
import org.apache.commons.lang.StringUtils;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by zchuanzhao on 2017/5/18.
 */
public class DirectiveHandler {
    public static final SimpleDateFormat FULL_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    public static final int FULL_DATE_LENGTH = 19;

    public static final SimpleDateFormat SHORT_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    public static final int SHORT_DATE_LENGTH = 10;
    private Environment environment;
    private Map<String, TemplateModel> parameters;
    private TemplateModel[] loopVars;
    private TemplateDirectiveBody templateDirectiveBody;
    private Map<String, Object> map = new HashMap<String, Object>();

    /**
     * @param environment
     * @param parameters
     * @param templateDirectiveBody
     */
    public DirectiveHandler(Environment environment, Map<String, TemplateModel> parameters, TemplateModel[] loopVars,
                            TemplateDirectiveBody templateDirectiveBody) {
        this.environment = environment;
        this.loopVars = loopVars;
        this.parameters = parameters;
        this.templateDirectiveBody = templateDirectiveBody;
    }

    /**
     * 渲染
     */
    public void render() throws IOException, TemplateException {
        Map<String, TemplateModel> reduceMap = reduce();
        if (null != templateDirectiveBody) {
            templateDirectiveBody.render(environment.getOut());
        }
        reduce(reduceMap);
    }

    /**
     * 控制变量不为空时，导出所有变量
     *
     * @param notEmptyObject
     * @throws IOException
     * @throws TemplateException
     */
    public void renderIfNotNull(Object notEmptyObject) throws IOException, TemplateException {
        if (null != notEmptyObject) {
            render();
        }
    }

    /**
     * 打印变量
     *
     * @param str
     * @throws IOException
     * @throws TemplateException
     */
    public void print(String str) throws IOException, TemplateException {
        environment.getOut().append(str);
    }

    /**
     * @param key
     * @param value
     * @return
     */
    public DirectiveHandler put(String key, Object value) {
        map.put(key, value);
        return this;
    }

    /**
     * @return
     */
    private Map<String, TemplateModel> reduce() throws TemplateModelException {
        Map<String, TemplateModel> reduceMap = new HashMap<String, TemplateModel>();
        for (String key : map.keySet()) {
            TemplateModel value = environment.getVariable(key);
            if (null != value)
                reduceMap.put(key, environment.getVariable(key));
            environment.setVariable(key, environment.getObjectWrapper().wrap(map.get(key)));
        }
        return reduceMap;
    }

    /**
     * @param map
     */
    private void reduce(Map<String, TemplateModel> map) throws TemplateModelException {
        for (String key : map.keySet()) {
            environment.setVariable(key, map.get(key));
        }
    }

    /**
     * @param name
     * @return
     * @throws TemplateModelException
     */
    public TemplateHashModel getMap(String name) throws TemplateModelException {
        TemplateModel model = parameters.get(name);
        if (null == model) {
            return null;
        }
        if (model instanceof TemplateHashModelEx) {
            return (TemplateHashModelEx) model;
        } else if (model instanceof TemplateHashModel) {
            return (TemplateHashModel) model;
        } else {
            return null;
        }
    }

    /**
     * @param name
     * @param defaultValue
     * @return
     * @throws TemplateException
     */
    public String getString(String name, String defaultValue) throws TemplateException {
        String result = getString(name);
        if (null == result)
            return defaultValue;
        else
            return result;
    }

    /**
     * @param name
     *
     * @return
     * @throws TemplateException
     */
    public String getString(String name) throws TemplateException {
        TemplateModel model = parameters.get(name);
        if (null == model) {
            return null;
        }
        if (model instanceof TemplateScalarModel) {
            return ((TemplateScalarModel) model).getAsString();
        } else if ((model instanceof TemplateNumberModel)) {
            return ((TemplateNumberModel) model).getAsNumber().toString();
        } else {
            return null;
        }
    }

    /**
     * @param name
     * @param defaultValue
     * @return
     * @throws TemplateException
     */
    public Integer getInteger(String name, int defaultValue) throws TemplateException {
        Integer result = getInteger(name);
        if (null == result)
            return defaultValue;
        else
            return result;
    }

    /**
     * @param name
     *
     * @return
     * @throws TemplateException
     */
    public Integer getInteger(String name) throws TemplateException {
        TemplateModel model = parameters.get(name);
        if (null == model) {
            return null;
        }
        if (model instanceof TemplateNumberModel) {
            return ((TemplateNumberModel) model).getAsNumber().intValue();
        } else if (model instanceof TemplateScalarModel) {
            String s = ((TemplateScalarModel) model).getAsString();
            if (StringUtils.isBlank(s)) {
                return null;
            }
            try {
                return Integer.parseInt(s);
            } catch (NumberFormatException e) {
                return null;
            }
        } else {
            return null;
        }
    }

    /**
     * @param name
     *
     * @return
     * @throws TemplateException
     */
    public Short getShort(String name) throws TemplateException {
        TemplateModel model = parameters.get(name);
        if (null == model) {
            return null;
        }
        if (model instanceof TemplateNumberModel) {
            return ((TemplateNumberModel) model).getAsNumber().shortValue();
        } else if (model instanceof TemplateScalarModel) {
            String s = ((TemplateScalarModel) model).getAsString();
            if (StringUtils.isBlank(s)) {
                return null;
            }
            try {
                return Short.parseShort(s);
            } catch (NumberFormatException e) {
                return null;
            }
        } else {
            return null;
        }
    }

    /**
     * @param name
     *
     * @return
     * @throws TemplateException
     */
    public Long getLong(String name) throws TemplateException {
        TemplateModel model = parameters.get(name);
        if (null == model) {
            return null;
        }
        if (model instanceof TemplateNumberModel) {
            return ((TemplateNumberModel) model).getAsNumber().longValue();
        } else if (model instanceof TemplateScalarModel) {
            String s = ((TemplateScalarModel) model).getAsString();
            if (StringUtils.isBlank(s)) {
                return null;
            }
            try {
                return Long.parseLong(s);
            } catch (NumberFormatException e) {
                return null;
            }
        } else {
            return null;
        }
    }

    /**
     * @param name
     *
     * @return
     * @throws TemplateException
     */
    public Double getDouble(String name) throws TemplateException {
        TemplateModel model = parameters.get(name);
        if (null == model) {
            return null;
        }
        if (model instanceof TemplateNumberModel) {
            return ((TemplateNumberModel) model).getAsNumber().doubleValue();
        } else if (model instanceof TemplateScalarModel) {
            String s = ((TemplateScalarModel) model).getAsString();
            if (StringUtils.isBlank(s)) {
                return null;
            }
            try {
                return Double.parseDouble(s);
            } catch (NumberFormatException e) {
                return null;
            }
        } else {
            return null;
        }
    }

    /**
     * @param name
     *
     * @return
     * @throws TemplateException
     */
    public Integer[] getIntegerArray(String name) throws TemplateException {
        String[] arr = getStringArray(name);
        if (null != arr) {
            Integer[] ids = new Integer[arr.length];
            int i = 0;
            try {
                for (String s : arr) {
                    ids[i++] = Integer.valueOf(s);
                }
                return ids;
            } catch (NumberFormatException e) {
                return null;
            }
        } else
            return null;

    }

    /**
     * @param name
     *
     * @return
     * @throws TemplateException
     */
    public Long[] getLongArray(String name) throws TemplateException {
        String[] arr = getStringArray(name);
        if (null != arr) {
            Long[] ids = new Long[arr.length];
            int i = 0;
            try {
                for (String s : arr) {
                    ids[i++] = Long.valueOf(s);
                }
                return ids;
            } catch (NumberFormatException e) {
                return null;
            }
        } else
            return null;

    }

    /**
     * @param name
     *
     * @return
     * @throws TemplateException
     */
    public String[] getStringArray(String name) throws TemplateException {
        String str = getString(name);
        if (StringUtils.isBlank(str)) {
            return null;
        }
        return StringUtils.split(str, ',');
    }

    /**
     * @param name
     * @param defaultValue
     * @return
     * @throws TemplateException
     */
    public Boolean getBoolean(String name, Boolean defaultValue) throws TemplateException {
        Boolean result = getBoolean(name);
        if (null == result)
            return defaultValue;
        else
            return result;
    }

    /**
     * @param name
     *
     * @return
     * @throws TemplateException
     */
    public Boolean getBoolean(String name) throws TemplateException {
        TemplateModel model = parameters.get(name);
        if (null == model) {
            return null;
        }
        if (model instanceof TemplateBooleanModel) {
            return ((TemplateBooleanModel) model).getAsBoolean();
        } else if (model instanceof TemplateNumberModel) {
            return !(0 == ((TemplateNumberModel) model).getAsNumber().intValue());
        } else if (model instanceof TemplateScalarModel) {
            String s = ((TemplateScalarModel) model).getAsString();
            if (StringUtils.isNotBlank(s)) {
                return !("0".equals(s) || "false".equalsIgnoreCase(s));
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    /**
     * @param name
     *
     * @return
     * @throws TemplateException
     */
    public Date getDate(String name) throws TemplateException {
        TemplateModel model = parameters.get(name);
        if (null == model) {
            return null;
        }
        if (model instanceof TemplateDateModel) {
            return ((TemplateDateModel) model).getAsDate();
        } else if (model instanceof TemplateScalarModel) {
            String temp = StringUtils.trimToEmpty(((TemplateScalarModel) model).getAsString());
            try {
                if (FULL_DATE_LENGTH == temp.length()) {
                    return FULL_DATE_FORMAT.parse(temp);
                } else if (SHORT_DATE_LENGTH == temp.length()) {
                    return SHORT_DATE_FORMAT.parse(temp);
                } else {
                    return null;
                }
            } catch (ParseException e) {
                return null;
            }
        } else {
            return null;
        }
    }

    /**
     * @return the parameters
     */
    public Map<String, TemplateModel> getParameters() {
        return parameters;
    }

    /**
     * @return the environment
     */
    public Environment getEnvironment() {
        return environment;
    }

    /**
     * @return the templateDirectiveBody
     */
    public TemplateDirectiveBody getTemplateDirectiveBody() {
        return templateDirectiveBody;
    }

    public TemplateModel[] getLoopVars() {
        return loopVars;
    }

    public void setLoopVars(TemplateModel[] loopVars) {
        this.loopVars = loopVars;
    }
}