package com.ofsoft.cms.core.plugin.freemarker.function;


public class OptionValue extends BaseFunction {

	@Override
	public Object onExec() {
		String key = getToString(0);
//		return OptionQuery.me().findValue(key);
		return key;
	}

}
