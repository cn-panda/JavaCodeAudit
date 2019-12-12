package com.lxinet.jeesns.common.utils;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

public class EmailSendUtil {

	private EmailSendUtil(){

	}

	private static boolean sendMail(HttpServletRequest request, String email, String content,String title) {
		final String account = (String) request.getServletContext().getAttribute(ConfigUtil.SITE_SEND_EMAIL_ACCOUNT.toUpperCase());
		final String passWord = (String) request.getServletContext().getAttribute(ConfigUtil.SITE_SEND_EMAIL_PASSWORD.toUpperCase());
		final String smtp = (String) request.getServletContext().getAttribute(ConfigUtil.SITE_SEND_EMAIL_SMTP.toUpperCase());
		Properties props = new Properties();
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.host", smtp);// 用户主机
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(account, passWord);// 获取用户名和密码
			}
		});

		Message msg = new MimeMessage(session);
		session.setDebug(false);// 查看调试信息:true,不查看：false;
		try {
			msg.setFrom(new InternetAddress(account));
			msg.setSubject(title);
			msg.setRecipients(RecipientType.TO, InternetAddress.parse(email));// 多个收件人
			msg.setContent(content, "text/html;charset=utf-8");// 文本/指定文本类型，字符集
			Transport.send(msg);
		} catch (javax.mail.MessagingException e) {
			e.printStackTrace();
			//发送失败
			return false;
		}// 发送端
		return true;
	}

	/**
	 * 会员激活
	 * @param email
	 * @param randomCode
	 * @return
	 */
	public static boolean activeMember(HttpServletRequest request, String email, String randomCode){
		String siteName = (String) request.getServletContext().getAttribute(ConfigUtil.SITE_NAME.toUpperCase());
		String title = siteName + "会员账号激活";
		String content = "欢迎加入"+siteName+"，您的账号激活验证码为：【"+randomCode+"】，30分钟内有效，请马上进行验证。若非本人操作，请忽略此邮件。";
		return sendMail(request, email, content, title);
	}

	/**
	 * 忘记密码
	 * @param email
	 * @param randomCode
	 * @return
	 */
	public static boolean forgetpwd(HttpServletRequest request, String email, String randomCode){
		String siteName = (String) request.getServletContext().getAttribute(ConfigUtil.SITE_NAME.toUpperCase());
		String siteDomain = (String) request.getServletContext().getAttribute(ConfigUtil.SITE_DOMAIN.toUpperCase());
		String title = siteName + "找回密码";
		String content = "<h4>您好，" + email + "：</h4><p>请点击下面的链接来重置您的密码<br  />" +
				"<a href='" + siteDomain+"member/resetpwd?email=" + email + "&token=" + randomCode + "' target='_blank'>" +
				siteDomain + "member/resetPwd?email=" + email + "&token=" + randomCode + "</a><br  />" +
				"本链接30分钟内有效。<br />" +
				"(如果点击链接无反应，请复制链接到浏览器里直接打开)<p>" ;
		return sendMail(request, email, content, title);
	}

}
