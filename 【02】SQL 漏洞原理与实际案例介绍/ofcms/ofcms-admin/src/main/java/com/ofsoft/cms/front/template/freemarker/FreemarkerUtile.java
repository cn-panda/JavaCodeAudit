package com.ofsoft.cms.front.template.freemarker;

import com.ofsoft.cms.front.template.directive.*;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by OF on 2018/5/13.
 */
public class FreemarkerUtile {

    public static Map initTemplate(){
        Map data = new HashMap();
        data.put("like",new likeDirective());
        data.put("column",new ColumnDirective());
        data.put("content",new ContentDirective());
        data.put("content_list",new ContentListDirective());
        data.put("ad",new AdDirective());
        data.put("announce_list",new AnnounceListDirective());
        data.put("announce",new AnnounceDirective());
        data.put("page",new PageDirective());
        data.put("topic",new TopicDirective());
        data.put("system",new SystemDirective());
        data.put("bbs",new BbsListDirective());
        return  data;
    }
}
