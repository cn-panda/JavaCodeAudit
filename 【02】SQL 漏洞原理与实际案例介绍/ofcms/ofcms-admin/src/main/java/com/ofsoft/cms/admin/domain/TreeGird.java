package com.ofsoft.cms.admin.domain;

import java.util.List;

/**
 * Created by OF on 2018/5/22.
 */
public class TreeGird {
    private String id;
    private String name;
    private String columnEnglish;
    private String templatePath;
    private String contentUrl;
    private String columnImage;
    private List children;

    public TreeGird(String id ,  String name,List children) {
        this.id = id;
        this.name = name;
        this.children = children;
    }

    public TreeGird(String id ,  String name,String columnEnglish,String templatePath,String contentUrl,List children) {
        this.id = id;
        this.name = name;
        this.columnEnglish = columnEnglish;
        this.templatePath = templatePath;
        this.contentUrl = contentUrl;
        this.columnImage = columnImage;
        this.children = children;
    }

    public String getTemplatePath() {
        return templatePath;
    }

    public void setTemplatePath(String templatePath) {
        this.templatePath = templatePath;
    }

    public String getContentUrl() {
        return contentUrl;
    }

    public void setContentUrl(String contentUrl) {
        this.contentUrl = contentUrl;
    }

    public String getColumnImage() {
        return columnImage;
    }

    public void setColumnImage(String columnImage) {
        this.columnImage = columnImage;
    }

    public void setColumnEnglish(String columnEnglish) {
        this.columnEnglish = columnEnglish;
    }

    public String getColumnEnglish() {
        return columnEnglish;
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
    public List getChildren() {
        return children;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {

        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setChildren(List children) {
        this.children = children;
    }
}
