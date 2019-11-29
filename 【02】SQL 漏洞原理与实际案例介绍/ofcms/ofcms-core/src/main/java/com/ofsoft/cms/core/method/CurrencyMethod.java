package com.ofsoft.cms.core.method;

import java.math.BigDecimal;
import java.util.List;


import org.apache.commons.lang3.StringUtils;
import com.jfinal.kit.PropKit;
import freemarker.template.SimpleScalar;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

/**
 * 模板方法 - 货币格式化
 * @author OF
 * @date 2017年11月24日
 */
public class CurrencyMethod implements TemplateMethodModelEx {

	@SuppressWarnings("rawtypes")
	public Object exec(List arguments) throws TemplateModelException {
		if (arguments != null && !arguments.isEmpty() && arguments.get(0) != null && StringUtils.isNotEmpty(arguments.get(0).toString())) {
			boolean showSign = false;
			boolean showUnit = false;
			if (arguments.size() == 2) {
				if (arguments.get(1) != null) {
					showSign = Boolean.valueOf(arguments.get(1).toString());
				}
			} else if (arguments.size() > 2) {
				if (arguments.get(1) != null) {
					showSign = Boolean.valueOf(arguments.get(1).toString());
				}
				if (arguments.get(2) != null) {
					showUnit = Boolean.valueOf(arguments.get(2).toString());
				}
			}
			BigDecimal amount = new BigDecimal(arguments.get(0).toString());
			String price = setScale(amount).toString();
			if (showSign) {
				price = "￥" + price;
			}
			if (showUnit) {
				price += "元";
			}
			return new SimpleScalar(price);
		}
		return null;
	}
	
	public BigDecimal setScale(BigDecimal amount) {
		if (amount == null) {
			return null;
		}
		int roundingMode;
		if ("roundHalfUp".equals(PropKit.get("priceRoundType"))) {
			roundingMode = BigDecimal.ROUND_UP;
		} else if ("roundUp".equals(PropKit.get("priceRoundType"))) {
			roundingMode = BigDecimal.ROUND_DOWN;
		} else {
			roundingMode = BigDecimal.ROUND_HALF_UP;
		}
		return amount.setScale(2, roundingMode);
	}

}