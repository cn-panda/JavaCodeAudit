package com.lxinet.jeesns.interceptor;

import com.lxinet.jeesns.core.model.Page;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.DefaultReflectorFactory;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.Properties;

/**
 * 分页拦截器
 * Created by zchuanzhao on 2016/10/14.
 */
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class, Integer.class})})
public class PageInterceptor implements Interceptor {
    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
        MetaObject metaObject = MetaObject.forObject(statementHandler, SystemMetaObject.DEFAULT_OBJECT_FACTORY, SystemMetaObject.DEFAULT_OBJECT_WRAPPER_FACTORY, new DefaultReflectorFactory());

        // 分离代理对象链(由于目标类可能被多个拦截器拦截，从而形成多次代理，通过下面的两次循环
        // 可以分离出最原始的的目标类)
        while (metaObject.hasGetter("h")) {
            Object object = metaObject.getValue("h");
            metaObject = SystemMetaObject.forObject(object);
        }
        // 分离最后一个代理对象的目标类
        while (metaObject.hasGetter("target")) {
            Object object = metaObject.getValue("target");
            metaObject = SystemMetaObject.forObject(object);
        }

        BoundSql boundSql = (BoundSql) metaObject.getValue("delegate.boundSql");
        //获取分页信息
        Page page = this.getPage(boundSql);
        if(page == null){
            return invocation.proceed();
        }
        //原始的SQL语句
        String sql = boundSql.getSql();
        //获取数据总条数
        this.setTotalCount(page,sql,invocation,metaObject);
        //分页查询SQL
        String pageSql = this.getPageSql(page,sql);
        metaObject.setValue("delegate.boundSql.sql", pageSql);
        return invocation.proceed();
    }

    /**
     * 获取分页信息
     * @return
     */
    private Page getPage(BoundSql boundSql){
        //分析是否含有分页参数page，如果没有则不是分页查询
        Object params = boundSql.getParameterObject();
        if(params == null){
            return null;
        }
        Page page = null;
        //分析是否含有分页参数，如果没有则不是分页查询
        if (params instanceof Page){
            //只有一个参数的情况
            page = (Page)params;
        } else if (params instanceof Map){
            //找到page参数
            Map paramsMap = (Map) params;
            if(paramsMap.containsKey("page")){
                if(paramsMap.get("page") instanceof Page){
                    page = (Page) paramsMap.get("page");
                }
            }
        }
        return page;
    }

    /**
     * 获取数据总条数并且获取原始sql
     * @param page
     * @param invocation
     * @param metaObject
     * @throws SQLException
     */
    private void setTotalCount(Page page, String sql,Invocation invocation,MetaObject metaObject) throws SQLException {
        String countSql = "select count(*) from (" + sql + ") a";
        Connection connection = (Connection) invocation.getArgs()[0];
        PreparedStatement countPrepareStatement = connection.prepareStatement(countSql);
        ParameterHandler parameterHandler = (ParameterHandler) metaObject.getValue("delegate.parameterHandler");
        parameterHandler.setParameters(countPrepareStatement);
        ResultSet resultSet = countPrepareStatement.executeQuery();
        if (resultSet.next()) {
            page.setTotalCount(resultSet.getInt(1));
        }
    }

    /**
     * 获取分页sql
     * @param page 分页信息
     * @param sql 原始SQL
     * @return 分页sql
     */
    private String getPageSql(Page page, String sql) {
        return sql + " limit " + page.getStartRow() + "," + page.getPageSize();
    }

    @Override
    public Object plugin(Object target) {
        if (target instanceof StatementHandler) {
            return Plugin.wrap(target, this);
        }
        return target;
    }

    @Override
    public void setProperties(Properties properties) {

    }
}
