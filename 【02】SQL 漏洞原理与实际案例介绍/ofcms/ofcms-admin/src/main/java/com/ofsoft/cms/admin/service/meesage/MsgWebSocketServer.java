package com.ofsoft.cms.admin.service.meesage;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetSocketAddress;
import java.net.UnknownHostException;
import java.util.Collection;
import java.util.Map;

import org.java_websocket.WebSocket;
import org.java_websocket.WebSocketImpl;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;

import com.alibaba.fastjson.JSONObject;

public class MsgWebSocketServer extends WebSocketServer {

	public MsgWebSocketServer(int port) throws UnknownHostException {
		super(new InetSocketAddress(port));
	}

	public MsgWebSocketServer(InetSocketAddress address) {
		super(address);
	}

	@Override
	public void onOpen(WebSocket conn, ClientHandshake handshake) {
		System.out.println(conn.getRemoteSocketAddress().getAddress()
				.getHostAddress()
				+ " 连接!");
	}

	@Override
	public void onClose(WebSocket conn, int code, String reason, boolean remote) {
		System.out.println(conn + " 关闭");
	}

	@Override
	public void onMessage(WebSocket conn, String message) {
		try {
			Map<?, ?> params = JSONObject.parseObject(message);
			String code = (String) params.get("trans_code");
			String user = (String) params.get("user_id");
			if (null != code && code.equals("1000")) {
				// 用户连接
				userjoin(user, conn);
			} else {
				MsgServerPool.sendMessageToUser(conn, message);// 同时向本人发送消息
			}
			System.out.println("接收 : " + message);
		} catch (Exception e) {
			e.printStackTrace();
			MsgServerPool.sendMessageToUser(conn, "处理失败,请稍后重试!");
		}
	}

	/**
	 * 用户加入处理
	 * 
	 * @param user
	 */
	public void userjoin(String user, WebSocket conn) {
		// 判断用户是否在其它终端登录
		if (null == MsgServerPool.getWebSocketByUser(user)) {
			// 向连接池添加当前的连接对象
			MsgServerPool.addUser(user, conn);
		} else {
			MsgServerPool.removeUser(MsgServerPool.getWebSocketByUser(user));
			MsgServerPool.addUser(user, conn);
		}
	}

	public static void main(String[] args) throws InterruptedException,
			IOException {
		WebSocketImpl.DEBUG = true;
		int port = 8887; // 843 flash policy port
		try {
			port = Integer.parseInt(args[0]);
		} catch (Exception ex) {
		}
		MsgWebSocketServer s = new MsgWebSocketServer(port);
		s.start();
		System.out.println("ChatServer started on port: " + s.getPort());

		BufferedReader sysin = new BufferedReader(new InputStreamReader(
				System.in));
		while (true) {
			String in = sysin.readLine();
			s.sendToAll(in);
			if (in.equals("exit")) {
				s.stop();
				break;
			}
		}
	}

	@Override
	public void onError(WebSocket conn, Exception ex) {
		ex.printStackTrace();
		if (conn != null) {
			// some errors like port binding failed may not be assignable to a
			// specific websocket
		}
	}

	/**
	 * Sends <var>text</var> to all currently connected WebSocket clients.
	 * 
	 * @param text
	 *            The String to send across the network.
	 * @throws InterruptedException
	 *             When socket related I/O errors occur.
	 */
	public void sendToAll(String text) {
		Collection<WebSocket> con = connections();
		synchronized (con) {
			for (WebSocket c : con) {
				c.send(text);
			}
		}
	}

	@Override
	public void onStart() {

	}
}
