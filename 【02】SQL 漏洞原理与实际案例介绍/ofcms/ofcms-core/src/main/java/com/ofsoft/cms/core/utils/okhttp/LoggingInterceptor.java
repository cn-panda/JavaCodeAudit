package com.ofsoft.cms.core.utils.okhttp;

import java.io.IOException;

import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;

import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;

public class LoggingInterceptor implements Interceptor {
	public Logger log = Logger.getLogger(LoggingInterceptor.class);
	@Override public Response intercept(Chain chain) throws IOException {
	    Request request = chain.request();

	    long t1 = System.nanoTime();
	    log.info(String.format("Sending request %s on %s%n%s%s",
	        request.url(), chain.connection(), request.headers(),request.body().toString()));

	    Response response = chain.proceed(request);

	    long t2 = System.nanoTime();
	    log.info(String.format("Received response for %s in %.1fms%n%s%s",
	        response.request().url(), (t2 - t1) / 1e6d, response.headers(),response.body().string()));

	    return response;
	  }
}
