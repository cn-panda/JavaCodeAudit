package com.ofsoft.cms.admin.service.meesage;

import com.alibaba.fastjson.JSON;
import org.java_websocket.client.WebSocketClient;
import org.java_websocket.drafts.Draft;
import org.java_websocket.drafts.Draft_6455;
import org.java_websocket.framing.Framedata;
import org.java_websocket.handshake.ServerHandshake;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

public class MsgWebSocket extends WebSocketClient {
	public MsgWebSocket(URI serverUri, Draft draft) {
		super(serverUri, draft);
	}

	public MsgWebSocket(URI serverURI) {
		super(serverURI);
	}

	@Override
	public void onOpen(ServerHandshake handshakedata) {
		System.out.println("打开 connection");

	}

	@Override
	public void onMessage(String message) {
		System.out.println("接收: " + message);
	}

	@Override
	public void onFragment(Framedata fragment) {
		System.out.println("接收 fragment: "
				+ new String(fragment.getPayloadData().array()));
	}

	@Override
	public void onClose(int code, String reason, boolean remote) {
		System.out.println("连接关闭 closed by " + (remote ? "remote peer" : "us"));

	}

	@Override
	public void onError(Exception ex) {
		ex.printStackTrace();
	}

	public static void main(String[] args) throws URISyntaxException,
			IOException {
		MsgWebSocket c = new MsgWebSocket(new URI("ws://localhost:9999/test"),
				new Draft_6455()); // more
									// about
		// drafts
		// here:
		// http://github.com/TooTallNate/Java-WebSocket/wiki/Drafts
		c.connect();
		Map data = new HashMap();
		data.put("trans_code", "10001");
		data.put("user_id", "1");
		c.send(JSON.toJSONString(data));
		BufferedReader sysin = new BufferedReader(new InputStreamReader(
				System.in));
		while (true) {
			String in = sysin.readLine();
			c.send(in);
			if (in.equals("exit")) {
				c.close();
				break;
			}
		}
	}

}
