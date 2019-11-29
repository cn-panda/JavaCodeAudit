package com.ofsoft.cms.core.plugin.shiro.freemarker;

import freemarker.core.Environment;
import freemarker.log.Logger;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import java.io.IOException;
import java.util.Map;

/**
 * <p>Tag used to print out the String value of a user's default principal,
 * or a specific principal as specified by the tag's attributes.</p>
 * <p/>
 * <p> If no attributes are specified, the tag prints out the <tt>toString()</tt>
 * value of the user's default principal.  If the <tt>type</tt> attribute
 * is specified, the tag looks for a principal with the given type.  If the
 * <tt>property</tt> attribute is specified, the tag prints the string value of
 * the specified property of the principal.  If no principal is found or the user
 * is not authenticated, the tag displays nothing unless a <tt>defaultValue</tt>
 * is specified.</p>
 * <p/>
 * <p>Equivalent to {@link org.apache.shiro.web.tags.PrincipalTag}</p>
 *
 * @since 0.2
 */
public class LoginExceptionTag extends SecureTag {
  static final Logger log = Logger.getLogger("LoginExceptionTag");

  /**
   * The property name to retrieve of the principal, or null if the <tt>toString()</tt> value should be used.
   */
  String getAttr(Map params) {
    return getParam(params, "name");
  }

  @Override
  public void render(Environment env, Map params, TemplateDirectiveBody body) throws IOException, TemplateException {
    String result = null;
    Subject subject = getSubject();
    Session session = getSubject().getSession();
    String attr = getAttr(params);
    String value = null;
    if (subject != null && session != null && attr != null) {
      if (log.isDebugEnabled()) {
        log.debug("Attr is exsit.");
      }
      if (session.getAttribute(attr) != null) {
        value = String.valueOf(session.getAttribute(attr));
        if (value.equalsIgnoreCase("UnknownUserException")) {
          result = "账户验证失败或已被禁用!";
        } else if (value.equalsIgnoreCase("IncorrectCredentialsException")) {
          result = "账户验证失败或已被禁用!";
        } else if (value.equalsIgnoreCase("IncorrectCaptchaException")) {
          result = "验证码验证失败!";
        } else {
          result = "账户验证失败或已被禁用!";
        }
      }
    } else {
      if (log.isDebugEnabled()) {
        log.debug("Attr is not exsit.");
      }
    }


    if (result != null) {
      try {
        env.getOut().write(result);
      } catch (IOException ex) {
        throw new TemplateException("Error writing [" + result + "] to Freemarker.", ex, env);
      }
    } else {
      renderBody(env, body);
    }
  }
}