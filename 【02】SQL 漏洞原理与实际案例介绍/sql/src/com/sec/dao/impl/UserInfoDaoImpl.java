package com.sec.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sec.dao.UserInfoDao;
import com.sec.pojo.UserInfo;

public class UserInfoDaoImpl implements UserInfoDao{

		public UserInfo UserInfoFoundDao(String id){
			
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			UserInfo userinfo = null;
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sec_sql","root","admin888");
				String sql = "select * from userinfo where id = " + id;
				ps = conn.prepareStatement(sql);
				//传值
				//ps.setInt(1,id);
				
				rs = ps.executeQuery();
				
				while(rs.next()){
					
					userinfo = new UserInfo();
					userinfo.setId(rs.getString("id"));
					userinfo.setName(rs.getString("name"));
					userinfo.setAge(rs.getInt("age"));
					userinfo.setContent(rs.getString("content"));
					userinfo.setAddress(rs.getString("address"));
					
				}
				
				
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
			return userinfo;
		}
}
