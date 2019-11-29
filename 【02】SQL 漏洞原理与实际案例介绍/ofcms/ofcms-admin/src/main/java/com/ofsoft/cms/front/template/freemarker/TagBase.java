package com.ofsoft.cms.front.template.freemarker;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.render.FreeMarkerRender;
import com.ofsoft.cms.core.config.FrontConst;
import com.ofsoft.cms.core.uitle.SiteUtile;
import freemarker.core.Environment;
import freemarker.template.*;

import java.io.IOException;
import java.io.Writer;
import java.math.BigInteger;
import java.util.Map;

public abstract class TagBase implements TemplateDirectiveModel {
    private static final Log log = Log.getLog(TagBase.class);

    protected Environment env;
    private Map<?, ?> params;

    private TemplateModel[] mTemplateModels;
    private TemplateDirectiveBody body;


    @SuppressWarnings("rawtypes")
    @Override
    public void execute(Environment env, Map params, TemplateModel[] templateModels, TemplateDirectiveBody body)
            throws TemplateException, IOException {

        this.env = env;
        this.params = params;
        this.mTemplateModels = templateModels;
        this.body = body;
        onRender();

    }

    public abstract void onRender();

    protected void setVariable(String key, Object value) {
        try {
            env.setVariable(key, FreeMarkerRender.getConfiguration().getObjectWrapper().wrap(value));
        } catch (TemplateModelException e) {
            log.error("setVariable(String key,Object value) is error!", e);
        }
    }

    protected void renderText(String text) {
        try {
            env.getOut().write(text == null ? "null" : text);
        } catch (IOException e) {
            log.error("JTag renderText error", e);
        }
    }

    protected void renderBody() {
        try {
            body.render(env.getOut());
        } catch (TemplateException e) {
            log.error("JTag renderBody is error!", e);
        } catch (IOException e) {
            log.error("JTag renderBody is error!", e);
        }
    }

    protected void renderBody(Writer writer) {
        try {
            body.render(writer);
        } catch (TemplateException e) {
            log.error("JTag renderBody(Writer writer) is error!", e);
        } catch (IOException e) {
            log.error("JTag renderBody(Writer writer) is error!", e);
        }
    }

    public TemplateModel[] getTemplateModels() {
        return mTemplateModels;
    }

    public TemplateDirectiveBody getBody() {
        return body;
    }

    public Writer getWriter() {
        return env.getOut();
    }

    public String getParam(String key, String defaultValue) {
        String value = getParam(key);
        if (value != null)
            return value;

        return defaultValue;
    }

    public Map getParamMap() {
        return params;
    }

    public String getParam(String key) {
        TemplateModel model = (TemplateModel) params.get(key);
        if (model == null) {
            return null;
        }
        try {
            if (model instanceof TemplateScalarModel) {
                return ((TemplateScalarModel) model).getAsString();
            }
            if ((model instanceof TemplateNumberModel)) {
                return ((TemplateNumberModel) model).getAsNumber().toString();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    public Long getParamToLong(String key, long defaultValue) {
        Long value = getParamToLong(key);
        if (value != null)
            return value;

        return defaultValue;
    }

    public Long getParamToLong(String key) {
        TemplateModel model = (TemplateModel) params.get(key);

        if (model == null) {
            return null;
        }

        try {
            if (model instanceof TemplateNumberModel) {
                return ((TemplateNumberModel) model).getAsNumber().longValue();
            }

            if (model instanceof TemplateScalarModel) {
                String string = ((TemplateScalarModel) model).getAsString();
                if (null == string || "".equals(string.trim())) {
                    return null;
                }
                return Long.parseLong(string);
            }
        } catch (Exception e) {
            throw new RuntimeException("must number!", e);
        }

        return null;
    }

    public BigInteger getParamToBigInteger(String key, BigInteger defaultValue) {
        BigInteger value = getParamToBigInteger(key);
        if (value != null)
            return value;

        return defaultValue;
    }

    public BigInteger getParamToBigInteger(String key) {
        TemplateModel model = (TemplateModel) params.get(key);

        if (model == null) {
            return null;
        }

        try {
            if (model instanceof TemplateNumberModel) {
                long number = ((TemplateNumberModel) model).getAsNumber().longValue();
                return BigInteger.valueOf(number);
            }

            if (model instanceof TemplateScalarModel) {
                String string = ((TemplateScalarModel) model).getAsString();
                if (null == string || "".equals(string.trim())) {
                    return null;
                }
                return new BigInteger(string);
            }
        } catch (Exception e) {
            throw new RuntimeException("must number!", e);
        }

        return null;
    }

    public Integer getParamToInt(String key, Integer defaultValue) {

        Integer value = getParamToInt(key);
        if (null != value)
            return value;

        return defaultValue;
    }

    public Integer getParamToInt(String key) {
        TemplateModel model = (TemplateModel) params.get(key);
        if (model == null) {
            return null;
        }

        try {
            if (model instanceof TemplateNumberModel) {
                return ((TemplateNumberModel) model).getAsNumber().intValue();
            }

            if (model instanceof TemplateScalarModel) {
                String string = ((TemplateScalarModel) model).getAsString();
                if (null == string || "".equals(string.trim())) {
                    return null;
                }

                return Integer.parseInt(string);

            }
        } catch (Exception e) {
            throw new RuntimeException("must number!", e);
        }

        return null;

    }

    public Integer[] getParamToIntArray(String key) {
        String string = getParam(key);
        if (null == string || "".equals(string.trim())) {
            return null;
        }

        if (!string.contains(",")) {
            return new Integer[]{Integer.valueOf(string.trim())};
        }

        String[] array = string.split(",");
        Integer[] ids = new Integer[array.length];
        int i = 0;
        try {
            for (String str : array) {
                ids[i++] = Integer.valueOf(str.trim());
            }
            return ids;
        } catch (NumberFormatException e) {
            throw e;
        }
    }

    public Long[] getParamToLongArray(String key) {
        String string = getParam(key);
        if (null == string || "".equals(string.trim())) {
            return null;
        }

        if (!string.contains(",")) {
            return new Long[]{Long.valueOf(string.trim())};
        }

        String[] array = string.split(",");
        Long[] ids = new Long[array.length];
        int i = 0;
        try {
            for (String str : array) {
                ids[i++] = Long.valueOf(str.trim());
            }
            return ids;
        } catch (NumberFormatException e) {
            throw e;
        }
    }

    public BigInteger[] getParamToBigIntegerArray(String key) {
        String string = getParam(key);
        if (null == string || "".equals(string.trim())) {
            return null;
        }

        if (!string.contains(",")) {
            return new BigInteger[]{new BigInteger(string.trim())};
        }

        String[] array = string.split(",");
        BigInteger[] ids = new BigInteger[array.length];
        int i = 0;
        try {
            for (String str : array) {
                ids[i++] = new BigInteger(str.trim());
            }
            return ids;
        } catch (NumberFormatException e) {
            throw e;
        }
    }

    public String[] getParamToStringArray(String key) {
        String string = getParam(key);
        if (null == string || "".equals(string.trim())) {
            return null;
        }

        if (!string.contains(",")) {
            return new String[]{string};
        }

        return string.split(",");
    }

    public Boolean getParamToBool(String key, Boolean defaultValue) {
        Boolean value = getParamToBool(key);
        if (value != null)
            return value;

        return defaultValue;
    }

    public Boolean getParamToBool(String key) {
        TemplateModel model = (TemplateModel) params.get(key);
        if (model == null) {
            return null;
        }

        try {
            if (model instanceof TemplateBooleanModel) {
                return ((TemplateBooleanModel) model).getAsBoolean();
            }

            if (model instanceof TemplateNumberModel) {
                return !(((TemplateNumberModel) model).getAsNumber().intValue() == 0);
            }

            if (model instanceof TemplateScalarModel) {
                String string = ((TemplateScalarModel) model).getAsString();
                if (null != string && !"".equals(string.trim())) {
                    return !(string.equals("0") || string.equalsIgnoreCase("false"));
                } else {
                    return null;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("param must is \"0\",\"1\"  or \"true\",\"false\"", e);
        }

        return null;
    }

    /**
     * 获得全局站点
     *
     * @return Site
     */
    public Record getSite()
            throws TemplateModelException {
        TemplateModel model = env.getGlobalVariable("site");
        if (model instanceof AdapterTemplateModel) {
            return (Record) ((AdapterTemplateModel) model)
                    .getAdaptedObject(Record.class);
        } else {
            throw new TemplateModelException("' site"
                    + "' not found in DataModel");
        }
    }

    /**
     * 获取当前页面页码
     *
     * @return
     */
    public int getPageNum() {
        return getGlobalVarInt("pageNum", 1);
    }

    /**
     * 获取全局参数
     *
     * @param key          键值
     * @param defaultValue 默认值
     * @return String
     */
    public String getGlobalVar(String key, String defaultValue) {
        try {
            TemplateModel model = env.getGlobalVariable(key);
            if (model instanceof TemplateScalarModel) {
                return ((TemplateScalarModel) model).getAsString();
            }
            if ((model instanceof TemplateNumberModel)) {
                return ((TemplateNumberModel) model).getAsNumber().toString();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return defaultValue;
    }

    /**
     * 获取全局参数int类型
     *
     * @param key          键值
     * @param defaultValue 默认值
     * @return String
     */
    public int getGlobalVarInt(String key, int defaultValue) {
        try {
            TemplateModel model = env.getGlobalVariable(key);
            if (model instanceof TemplateNumberModel) {
                return ((TemplateNumberModel) model).getAsNumber().intValue();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return defaultValue;
    }

    /**
     * 返回html页面
     *
     * @param htmlPath 路径
     */
    protected void renderHtml(String htmlPath) {
        try {
            env.include(htmlPath, "utf-8", true);
        } catch (TemplateException e) {
            log.error("JTag renderBody(Writer writer) is error!", e);
        } catch (IOException e) {
            log.error("JTag renderBody(Writer writer) is error!", e);
        }
    }

    /**
     * 错误页面
     */
    protected void renderError() {
        renderHtml(FrontConst.TEMPLATE_PATE +SiteUtile.getTemplatePath() + FrontConst.pageError);
    }
}