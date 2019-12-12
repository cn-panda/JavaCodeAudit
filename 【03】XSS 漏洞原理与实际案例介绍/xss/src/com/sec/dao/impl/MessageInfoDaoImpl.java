package com.sec.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sec.dao.MessageInfoDao;
import com.sec.pojo.MessageInfo;

public class MessageInfoDaoImpl implements MessageInfoDao {

	public boolean  MessageInfoStoreDao(String name, String mail, String message){
		
		Connection conn = null;
		PreparedStatement ps = null;
		boolean result = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sec_xss","root","admin888");
			
			String sql = "INSERT INTO message (name,mail,message) VALUES (?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, name);
			ps.setString(2, mail);
			ps.setString(3, message);
			ps.execute();
			
			result = true;
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		
		return result;
	}
	
	public List<MessageInfo> MessageInfoShowDao(){
		
		Connection conns = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MessageInfo> messageinfo = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conns = DriverManager.getConnection("jdbc:mysql://localhost:3306/sec_xss","root","admin888");
			String sql = "select * from message";
			ps = conns.prepareStatement(sql);
			rs = ps.executeQuery();
			
			
			messageinfo = new ArrayList<MessageInfo>();
					
			
			while(rs.next()){
				MessageInfo msg = new MessageInfo();
				
				msg.setName(rs.getString("name"));
				msg.setMail(rs.getString("mail"));
				msg.setMessage(rs.getString("message"));
				
				messageinfo.add(msg);
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
				conns.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return messageinfo;
	}
}
