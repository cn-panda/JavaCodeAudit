package com.ofsoft.cms.core.plugin.shiro.freemarker;

import freemarker.core.Environment;
import freemarker.log.Logger;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;

import java.io.IOException;
import java.util.Map;


/**
 * JSP tag that renders the tag body only if the current user has executed a <b>successful</b> authentication attempt
 * <em>during their current session</em>.
 * <p/>
 * <p>This is more restrictive than the {@link cn.dreampie.common.plugin.shiro.freemarker.UserTag}, which only
 * ensures the current user is known to the system, either via a current login or from Remember Me services,
 * which only makes the assumption that the current user is who they say they are, and does not guarantee it like
 * this tag does.
 * <p/>
 * <p>The logically opposite tag of this one is the {@link cn.dreampie.common.plugin.shiro.freemarker.NotAuthenticatedTag}
 * <p/>
 * <p>Equivalent to {@link org.apache.shiro.web.tags.AuthenticatedTag}</p>
 *
 * @since 0.2
 */
public class AuthenticatedTag extends SecureTag {
  private static final Logger log = Logger.getLogger("AuthenticatedTag");

  @Override
  public void render(Environment env, Map params, TemplateDirectiveBody body) throws IOException, TemplateException {
    if (getSubject() != null && (getSubject().isAuthenticated() || getSubject().isRemembered())) {
      if (log.isDebugEnabled()) {
        log.debug("Subject exists and is authenticated.  Tag body will be evaluated.");
      }

      renderBody(env, body);
    } else {
      if (log.isDebugEnabled()) {
        log.debug("Subject does not exist or is not authenticated.  Tag body will not be evaluated.");
      }
    }
  }
}