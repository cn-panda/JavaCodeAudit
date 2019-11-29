package com.ofsoft.cms.admin.controller.cms;

import com.ofsoft.cms.admin.controller.BaseController;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.uitle.FileUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.FileFilter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 模板功能
 *
 * @author OF
 * @date 2018年5月16日
 */
@Action(path = "/cms/template")
public class TemplateController extends BaseController {

    /**
     * 模板文件
     */
    public void getTemplates() {
        //当前目录
        String dirName = getPara("dir","");
        //上级目录
        String upDirName = getPara("up_dir","/");
        //类型区分
            String resPath = getPara("res_path");
        //文件目录
        String dir = null;
        if(!"/".equals(upDirName)){
              dir = upDirName+dirName;
        }else{
              dir = dirName;
        }
        File pathFile = null;
        if("res".equals(resPath)){
            pathFile = new File(SystemUtile.getSiteTemplateResourcePath(),dir);
        }else {
            pathFile = new File(SystemUtile.getSiteTemplatePath(),dir);
        }

        File[] dirs = pathFile.listFiles(new FileFilter() {
            @Override
            public boolean accept(File file) {
                return file.isDirectory();
            }
        });
        if(StringUtils.isBlank (dirName)){
            upDirName = upDirName.substring(upDirName.indexOf("/"),upDirName.lastIndexOf("/"));
        }
        setAttr("up_dir_name",upDirName);
        setAttr("up_dir","".equals(dir)?"/":dir);
        setAttr("dir_name",dirName.equals("")?SystemUtile.getSiteTemplatePathName():dirName);
        setAttr("dirs", dirs);
        /*if (dirName != null) {
            pathFile = new File(pathFile, dirName);
        }*/
        File[] files = pathFile.listFiles(new FileFilter() {
            @Override
            public boolean accept(File file) {
                return !file.isDirectory() && (file.getName().endsWith(".html") || file.getName().endsWith(".xml")
                        || file.getName().endsWith(".css") || file.getName().endsWith(".js"));
            }
        });
        setAttr("files", files);
        String fileName = getPara("file_name", "index.html");
        File editFile = null;
        if (fileName != null && files != null && files.length > 0) {
            for (File f : files) {
                if (fileName.equals(f.getName())) {
                    editFile = f;
                    break;
                }
            }
            if (editFile == null) {
                editFile = files[0];
                fileName = editFile.getName();
            }
        }

        setAttr("file_name", fileName);
        if (editFile != null) {
            String fileContent = FileUtils.readString(editFile);
            if (fileContent != null) {
                fileContent = fileContent.replace("<", "&lt;").replace(">", "&gt;");
                setAttr("file_content", fileContent);
                setAttr("file_path", editFile);
            }
        }
        if("res".equals(resPath)) {
            render("/admin/cms/template/resource.html");
        }else{
        render("/admin/cms/template/index.html");
        }
    }

    /**
     * 保存模板
     */
    public void save() {
        String resPath = getPara("res_path");
        File pathFile = null;
        if("res".equals(resPath)){
            pathFile = new File(SystemUtile.getSiteTemplateResourcePath());
        }else {
            pathFile = new File(SystemUtile.getSiteTemplatePath());
        }
        String dirName = getPara("dirs");
        if (dirName != null) {
            pathFile = new File(pathFile, dirName);
        }
        String fileName = getPara("file_name");
        // 没有用getPara原因是，getPara因为安全问题会过滤某些html元素。
        String fileContent = getRequest().getParameter("file_content");
        fileContent = fileContent.replace("&lt;", "<").replace("&gt;", ">");
        File file = new File(pathFile, fileName);
        FileUtils.writeString(file, fileContent);
        rendSuccessJson();
    }
    /**
     * 模板目录
     */
    public void menu() {
        //id:1, pId:0, name:"根目录", open:true
        List<Map> list = new ArrayList<Map>();
        Map<String, Object> a = new HashMap<String, Object>();
        a.put("pid", "0");
        a.put("name", "测试目录");
        a.put("open", true);
        list.add(a);

        rendSuccessJson(list);
    }
}
