package io.hawt.web.filters;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options
 */
public class XFrameOptionsFilter extends HttpHeaderFilter {

    @Override
    protected void addHeaders(HttpServletRequest request, HttpServletResponse response) {
        response.addHeader("X-Frame-Options", "SAMEORIGIN");
    }
}
