package com.ofsoft.cms.admin.controller;

import com.jfinal.aop.Clear;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;
import com.ofsoft.cms.admin.controller.system.SystemUtile;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.AdminConst;
import com.ofsoft.cms.core.config.ErrorCode;
import com.ofsoft.cms.core.uitle.FileUtils;
import com.ofsoft.cms.core.utils.JsonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

@Action(path = "/ueditor")
public class UeditorAction extends BaseController {
    protected static Logger log = LoggerFactory.getLogger(UeditorAction.class);

    /**
     * ueditor 处理
     *
     * @return
     * @throws Exception
     */

    public void handler() throws FileNotFoundException {
        if (getPara("action").equals("config")) {
            if (AdminConst.ueditDataConfig == null) {
                File file = new File(PathKit.getRootClassPath() + "/conf/ueditor.json");
                AdminConst.ueditDataConfig = (Map<String, Object>) JsonUtil.jsonToMap(FileUtils.readString(file));
            }
               /* 上传路径配置项 */
            AdminConst.ueditDataConfig.put("imageUrlPrefix", SystemUtile.getParam("http_image_url")); //图片访问路径前缀
            AdminConst.ueditDataConfig.put("fileUrlPrefix", SystemUtile.getParam("http_image_url")); //附件访问路径前缀
            AdminConst.ueditDataConfig.put("videoUrlPrefix", SystemUtile.getParam("http_image_url")); //视频访问路径前缀
            AdminConst.ueditDataConfig.put("scrawlUrlPrefix", SystemUtile.getParam("http_image_url")); //截图访问路径前缀
            rendJson(AdminConst.ueditDataConfig);
        } else if (getPara("action").equals("uploadImage")) {
            uploadImage();
        } else if (getPara("action").equals("uploadVideo")) {
            uploadVideo();
        } else if (getPara("action").equals("uploadFile")) {
            uploadFile();
        } else if (getPara("action").equals("uploadScrawl")) {
            //uploadScrawl();
        } else {
            Map<String, Object> msg = new HashMap<String, Object>();
            msg.put("url", "");
            msg.put("title", "");
            msg.put("state", "FAILED");
            msg.put("original", "");
            rendJson(msg);
        }
    }

    @Clear
    public void uploadImage() {
        try {
            UploadFile file = this.getFile("file", "image");
            file.getFile().createNewFile();
            Map<String, Object> msg = new HashMap<String, Object>();
            Map<String, Object> data = new HashMap<String, Object>();
            msg.put("url", "/upload/image/" + file.getFileName());
            msg.put("title", file.getFileName());
            msg.put("state", "SUCCESS");
            msg.put("original", file.getFileName());
            rendJson(msg);
        } catch (Exception e) {
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    @Clear
    public void uploadFile() {
        try {
            UploadFile file = this.getFile("file", "file");
            file.getFile().createNewFile();
            Map<String, Object> msg = new HashMap<String, Object>();
            Map<String, Object> data = new HashMap<String, Object>();
            msg.put("url", "/upload/file/" + file.getFileName());
            msg.put("title", file.getFileName());
            msg.put("state", "SUCCESS");
            msg.put("original", file.getFileName());
            rendJson(msg);
        } catch (Exception e) {
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    @Clear
    public void uploadVideo() {
        try {
            UploadFile file = this.getFile("file", "video",AdminConst.VOID_MAX_SIZE);
            file.getFile().createNewFile();
            Map<String, Object> msg = new HashMap<String, Object>();
            Map<String, Object> data = new HashMap<String, Object>();
            msg.put("url", "/upload/video/" + file.getFileName());
            msg.put("title", file.getFileName());
            msg.put("state", "SUCCESS");
            msg.put("original", file.getFileName());
            rendJson(msg);
        } catch (Exception e) {
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

    @Clear
    public void uploadScrawl() {
        try {
            UploadFile file = this.getFile("file", "image");
            file.getFile().createNewFile();
            Map<String, Object> msg = new HashMap<String, Object>();
            Map<String, Object> data = new HashMap<String, Object>();
            msg.put("url", "/upload/image/" + file.getFileName());
            msg.put("title", file.getFileName());
            msg.put("state", "SUCCESS");
            msg.put("original", file.getFileName());
            rendJson(msg);
        } catch (Exception e) {
            rendFailedJson(ErrorCode.get("9999"));
        }
    }

}
