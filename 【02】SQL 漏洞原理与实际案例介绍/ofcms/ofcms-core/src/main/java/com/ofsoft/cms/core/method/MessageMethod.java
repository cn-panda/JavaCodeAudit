package com.ofsoft.cms.core.method;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.i18n.I18n;
import com.jfinal.i18n.Res;

import freemarker.template.SimpleScalar;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

/**
 * 模板方法 - 多语言
 * 
 * @author OF
 * @date 2017年11月24日
 */

public class MessageMethod implements TemplateMethodModelEx {

	@SuppressWarnings("rawtypes")
	public Object exec(List arguments) throws TemplateModelException {
		Res resZh = I18n.use();
		if (arguments != null && !arguments.isEmpty()
				&& arguments.get(0) != null
				&& StringUtils.isNotEmpty(arguments.get(0).toString())) {
			String message = null;
			String code = arguments.get(0).toString();
			if (arguments.size() > 1) {
				Object[] args = arguments.subList(1, arguments.size())
						.toArray();
				message = resZh.format(code, args);
			} else {
				message = resZh.get(code);
			}
			return new SimpleScalar(message);
		}
		return null;
	}

}