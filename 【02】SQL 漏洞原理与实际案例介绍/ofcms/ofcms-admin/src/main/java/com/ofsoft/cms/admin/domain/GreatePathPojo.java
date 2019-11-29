package com.ofsoft.cms.admin.domain;

/**
 * 
 * @author OF
 * @date 2018年1月22日
 */
public class GreatePathPojo {
	String templatePath;
	String targetPath;
	public String getTemplatePath() {
		return templatePath;
	}
	public GreatePathPojo(String templatePath, String targetPath) {
		super();
		this.templatePath = templatePath;
		this.targetPath = targetPath;
	}
	public String getTargetPath() {
		return targetPath;
	}
	public void setTemplatePath(String templatePath) {
		this.templatePath = templatePath;
	}
	public void setTargetPath(String targetPath) {
		this.targetPath = targetPath;
	}
}
