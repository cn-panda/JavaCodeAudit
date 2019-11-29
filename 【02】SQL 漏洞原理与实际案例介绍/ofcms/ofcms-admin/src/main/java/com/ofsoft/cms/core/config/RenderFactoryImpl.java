package com.ofsoft.cms.core.config;

import com.jfinal.render.IRenderFactory;
import com.jfinal.render.Render;
import com.ofsoft.cms.core.render.SykJsonRender;
import com.ofsoft.cms.core.render.SykQrcodeRender;

public class RenderFactoryImpl extends com.jfinal.render.RenderFactory implements
		IRenderFactory, RenderFactory {

	@Override
	public Render getSykJsonRender(String key, Object value) {
		return new SykJsonRender(value);
	}

	@Override
	public Render getSykJsonRender(String[] attrs) {
		return new SykJsonRender(attrs);
	}

	@Override
	public Render getSykJsonRender(String jsonText) {
		return new SykJsonRender(jsonText);
	}

	@Override
	public Render getSykJsonRender(Object object) {
		return new SykJsonRender(object);
	}

	@Override
	public Render getSykQrcodeRender(String url) {
		return new SykQrcodeRender(url);
	}
}
