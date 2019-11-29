package com.ofsoft.cms.core.uitle;

import com.alibaba.druid.filter.stat.StatFilter;
import com.jfinal.kit.PathKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.druid.DruidPlugin;
import com.ofsoft.cms.core.config.AdminConst;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * 安装工具类
 */
public class InstallUtils {
	private static final Log log = Log.getLog(InstallUtils.class);
	private static String dbHost;
	private static String dbHostPort;
	private static String dbName;
	private static String dbUser;
	private static String dbPassword;

	public static void init(String db_host, String db_host_port, String db_name, String db_user, String db_password) {
		dbHost = db_host;
		dbHostPort = db_host_port;
		dbName = db_name;
		dbUser = db_user;
		dbPassword = db_password;
	}


	/**
	 * 获取全部表
	 * @return List
	 * @throws SQLException
	 */
	public static List<String> getTableList() throws SQLException {
		List<String> tableList = query( "show tables;");
		return tableList;
	}

	/**
	 * 创建数据表
	 * @throws SQLException
	 */
	public static void createDatabaseTables() throws SQLException {
		DruidPlugin dp = createDruidPlugin();
		Connection conn = dp.getDataSource().getConnection();
		executeBatchSql(conn, installSql());
		conn.close();
		dp.stop();

	}

	private static void executeSQL(String sql, Object... params) throws SQLException {
		DruidPlugin dp = createDruidPlugin();
		Connection conn = dp.getDataSource().getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			if (null != params && params.length > 0) {
				int i = 0;
				for (Object param : params) {
					pstmt.setString(++i, param.toString());
				}
			}
			pstmt.executeUpdate();

		} catch (SQLException e) {
			log.warn("InstallUtils executeSQL error", e);
		} finally {
			pstmt.close();
			conn.close();
			dp.stop();
		}
	}

	private static void executeBatchSql(Connection conn, String batchSql) throws SQLException {
		Statement pst = conn.createStatement();
		//增加跨平台换行符
		String newLine = System.getProperty("line.separator");
		if (null == batchSql) {
			throw new SQLException("SQL IS NULL");
		}
		if (batchSql.contains(";")) {
			String sqls[] = batchSql.split(";"+newLine);
			for (String sql : sqls) {
				if (null != sql && !"".equals(sql.trim()))
					pst.addBatch(sql);
			}
		} else {
			pst.addBatch(batchSql);
		}
		pst.executeBatch();
		close(pst);
	}

	/**
	 * 查询操作
	 * @param sql sql语句
	 * @return List
	 * @throws SQLException
	 */
	private static <T> List<T> query( String sql) throws SQLException {
		DruidPlugin dp = createDruidPlugin();
		Connection conn = dp.getDataSource().getConnection();
		 List<T>  list = query(conn,   sql);
		conn.close();
		dp.stop();
		return list;
	}
	/**
	 * 查询操作
	 * @param sql sql语句
	 * @param conn   连接
	 * @return List
	 * @throws SQLException
	 */
	private static <T> List<T> query(Connection conn, String sql) throws SQLException {
		List result = new ArrayList();
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		int colAmount = rs.getMetaData().getColumnCount();
		if (colAmount > 1) {
			while (rs.next()) {
				Object[] temp = new Object[colAmount];
				for (int i = 0; i < colAmount; i++) {
					temp[i] = rs.getObject(i + 1);
				}
				result.add(temp);
			}
		} else if (colAmount == 1) {
			while (rs.next()) {
				result.add(rs.getObject(1));
			}
		}
		close(rs, pst);
		return result;
	}

	private static final void close(ResultSet rs, Statement st) {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
			}
		if (st != null)
			try {
				st.close();
			} catch (SQLException e) {
			}
	}

	private static final void close(Statement st) {
		if (st != null)
			try {
				st.close();
			} catch (SQLException e) {
			}
	}

	/**
	 * 连接池插件
	 * @return
	 */
	private static DruidPlugin createDruidPlugin() {
		DruidPlugin plugin = createDuidPlugin(dbHost, dbHostPort, dbName, dbUser, dbPassword);
		plugin.start();
		return plugin;
	}

	private static DruidPlugin createDuidPlugin(String dbHost, String dbHostPort, String dbName, String dbUser,
										String dbPassword) {
		String jdbc_url = "jdbc:mysql://" + dbHost + ":" + dbHostPort + "/" + dbName + "?" + "useUnicode=true&" + "characterEncoding=UTF-8&" + "zeroDateTimeBehavior=convertToNull";
		DruidPlugin druidPlugin = new DruidPlugin(jdbc_url, dbUser, dbPassword);
		druidPlugin.setRemoveAbandoned(false);
		druidPlugin.setRemoveAbandonedTimeoutMillis(1800);
		druidPlugin.addFilter(new StatFilter());
		return druidPlugin;
	}

	/**
	 * 初始化用户名密码
	 * @param username
	 * @param password
	 * @throws SQLException
	 */
	public static void setWebFirstUser(String username, String password) throws SQLException {
		executeSQL("INSERT INTO of_sys_user (user_id,user_sex,user_email,login_name,user_name,user_password,status)VALUES ('1','1','523648919@qq.com',?,'管理员',?,'1')", username, password );
	}
	public static void setSiteInfo(String name, String domain,String url) throws SQLException {
		executeSQL("update of_cms_site  set site_name =? ,keywords=?,domain_name=?,access_path=? where site_id = '1' ", name, name, domain, url );
	}
	/**
	 * 安装sql文件
	 * @return
	 */
	public static String installSql() {
		String SqlFilePath = PathKit.getRootClassPath()+ AdminConst.ADMIN_INSTALL_SQL;
		String sql = FileUtils.readString(new File(SqlFilePath)) ;
		return sql;
	}
	/**
	 * 创建数据连接配置文件
	 * @return
	 */
	public static boolean createDbProperties() {
		Properties p = new Properties();
		p.put("jdbc.username", dbUser);
		p.put("jdbc.password", dbPassword);
		p.put("jdbc.url", "jdbc:mysql://" + dbHost + ":" + dbHostPort + "/" + dbName + "?" + "useUnicode=true&" + "characterEncoding=UTF-8&" + "zeroDateTimeBehavior=convertToNull");
		File pFile = new File(PathKit.getRootClassPath(), AdminConst.ADMIN_DB_CONFIG);
		return save(p, pFile);
	}
	private static boolean save(Properties p, File pFile) {
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(pFile);
			p.store(fos, "dataSource config");
		} catch (Exception e) {
			log.warn("InstallUtils save error", e);
			return false;
		} finally {
			if (fos != null)
				try {
					fos.close();
				} catch (IOException e) {
				}
		}
		return true;
	}
}
