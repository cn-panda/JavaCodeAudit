package com.ofsoft.cms.core.utils.okhttp;

import java.io.IOException;
import java.security.cert.CertificateException;
import java.util.concurrent.TimeUnit;

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import okhttp3.Headers;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;
import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;


public class OkHttp3 {
	private static Logger log = Logger.getLogger(OkHttp3.class);
	public static final MediaType JSON = MediaType
			.parse("application/json; charset=utf-8");
	public static OkHttpClient client = new OkHttpClient();
	public static long connectTimeout = 10;
	static {
		client = new OkHttpClient.Builder().connectTimeout(connectTimeout,
				TimeUnit.SECONDS).build();
	}

	public static String post(String url, String json) throws IOException {
		RequestBody body = RequestBody.create(JSON, json);
		Request request = new Request.Builder().url(url).post(body).build();
		client.readTimeoutMillis();
		Response response = client.newCall(request).execute();
		return response.body().string();
	}

	/**
	 * https post json 请求方法
	 * 
	 * @param url
	 *            请求地址
	 * @param connectTimeout
	 *            连接超时时间
	 * @return string json
	 */
	public static String okHttpsPostJson(String url, String content,
			long connectTimeout) {
		client = new OkHttpClient.Builder().connectTimeout(connectTimeout,
				TimeUnit.SECONDS).build();
		return okHttpPost(url, content, "application/json; charset=utf-8", null);
	}

	public static String okHttpsPostJson(String url, String content) {
		return okHttpsPostJson(url, content, 10);
	}

	/**
	 * http post json 请求方法
	 * 
	 * @param url
	 *            请求地址
	 * @return string json
	 */
	public static String okHttpPostJson(String url, String content) {
		return okHttpPost(url, content, "application/json; charset=utf-8", null);
	}

	public static ResponseBody okHttpPostJsonResponseBody(String url,
			String content) {
		return okHttpPostResponseBody(url, content,
				"application/json; charset=utf-8", null);
	}

	/**
	 * http post 请求方法
	 * 
	 * @param url
	 *            请求地址
	 * @return string
	 */
	public static String okHttpPost(String url, String content,
			String mediaType, Headers headers) {
		if (url == null || url.length() <= 0) {
			return "请求地址不能为空!";
		}
		String result = null;
		try {
			Request request = null;
			// 是否有请求头信息
			if (headers == null) {
				request = new Request.Builder()
						.url(url)
						.post(RequestBody.create(MediaType.parse(mediaType),
								content)).build();
			} else {
				request = new Request.Builder()
						.url(url)
						.headers(headers)
						.post(RequestBody.create(MediaType.parse(mediaType),
								content)).build();
			}
			log.debug("request : " + request + " body: " + content);
			Response response = client.newCall(request).execute();
			if (!response.isSuccessful()) {
				return "{\"header\":{\"resultcode\": \"" + response.code()
						+ "\",\"resultmsg\": \"处理失败\"},\"body\":[]}";
			}
			result = response.body().string();
			log.debug("response :" + result);
		} catch (IOException e) {
			e.printStackTrace();
			return "{\"header\":{\"resultcode\": \"3333\",\"resultmsg\": \"连接超时:"+e.getMessage()+" \"},\"body\":[]}";
		}
		return result;
	}

	/**
	 * http post 请求方法
	 * 
	 * @param url
	 *            请求地址
	 * @return string
	 */
	public static ResponseBody okHttpPostResponseBody(String url,
			String content, String mediaType, Headers headers) {
		if (url == null || url.length() <= 0) {
			return null;
		}
		ResponseBody result = null;
		try {
			Request request = null;
			// 是否有请求头信息
			if (headers == null) {
				request = new Request.Builder()
						.url(url)
						.post(RequestBody.create(MediaType.parse(mediaType),
								content)).build();
			} else {
				request = new Request.Builder()
						.url(url)
						.headers(headers)
						.post(RequestBody.create(MediaType.parse(mediaType),
								content)).build();
			}
			log.debug("request : " + request + " body: " + content);
			Response response = client.newCall(request).execute();
			if (!response.isSuccessful()) {
				return null;
			}
			result = response.body();
			log.debug("response :" + result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * http get 请求方法
	 * 
	 * @param url
	 *            请求地址
	 * @param headers
	 *            请求头
	 * @return string
	 */
	public static String okHttpGet(String url, Headers headers) {
		if (url == null || url.length() <= 0) {
			return "";
		}
		String result = null;
		try {
			Request request = null;
			// 是否有请求头信息
			if (headers == null) {
				request = new Request.Builder().url(url).get().build();
			} else {
				request = new Request.Builder().url(url).headers(headers).get()
						.build();
			}
			log.debug("request : " + request + " body: " + request);
			Response response = client.newCall(request).execute();
			if (!response.isSuccessful()) {
				return "";
			}
			result = response.body().string();
			log.debug("response :" + result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static X509TrustManager getTrustManager() {
		return new X509TrustManager() {
			@Override
			public void checkClientTrusted(
					java.security.cert.X509Certificate[] chain, String authType)
					throws CertificateException {
			}

			@Override
			public void checkServerTrusted(
					java.security.cert.X509Certificate[] chain, String authType)
					throws CertificateException {
			}

			@Override
			public java.security.cert.X509Certificate[] getAcceptedIssuers() {
				return null;
			}
		};
	}

	public static SSLSocketFactory getUnsafeOkHttpClient() {
		try {
			final TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
				@Override
				public void checkClientTrusted(
						java.security.cert.X509Certificate[] chain,
						String authType) throws CertificateException {
				}

				@Override
				public void checkServerTrusted(
						java.security.cert.X509Certificate[] chain,
						String authType) throws CertificateException {
				}

				@Override
				public java.security.cert.X509Certificate[] getAcceptedIssuers() {
					return null;
				}
			} };

			final SSLContext sslContext = SSLContext.getInstance("SSL");
			sslContext.init(null, trustAllCerts,
					new java.security.SecureRandom());
			final SSLSocketFactory sslSocketFactory = sslContext
					.getSocketFactory();
			return sslSocketFactory;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static void main(String[] args) {

		okHttpGet(
				"http://apis.baidu.com/datatiny/cardinfo/cardinfo?cardnum=5187102112341234",
				new Headers.Builder().add("apikey",
						"953eb9b1f583df6d427ec16e280f2550").build());
	}

}
