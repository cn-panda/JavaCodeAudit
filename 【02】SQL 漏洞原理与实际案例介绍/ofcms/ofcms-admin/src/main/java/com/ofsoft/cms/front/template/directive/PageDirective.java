package com.ofsoft.cms.front.template.directive;

import com.ofsoft.cms.front.template.freemarker.TagBase;
import freemarker.template.TemplateException;

import java.io.IOException;

/**
 * 分页标签
 * Created by OF on 2018/5/12.
 */
public class PageDirective extends TagBase {
    private static String templatePath = "comn/page.html";
    @Override
    public void onRender() {
        try {
            env.include(templatePath,"utf-8",true);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}
