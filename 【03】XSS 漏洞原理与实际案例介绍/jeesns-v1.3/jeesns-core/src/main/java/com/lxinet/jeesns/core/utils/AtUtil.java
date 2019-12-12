package com.lxinet.jeesns.core.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AtUtil {

    public static List<String> getAtNameList(String content){
        String regex = "@.*? ";
        Pattern pattern = Pattern.compile(regex);
        Matcher m = pattern.matcher(content);
        List<String> list = new ArrayList<>();
        while(m.find()) {
            String name = m.group();
            name = name.substring(1,name.length() - 1);
            if (!list.contains(name)){
                list.add(name);
            }
        }
        return list;
    }

    public static String replaceAt(String content,String name,int id){
        return content.replaceAll("@" + name + " ","<a href=\""+Const.PROJECT_PATH+"/u/"+id+"\" target=\"_blank\">@" + name + " </a>");
    }
}
