package com.lxinet.jeesns.web.common;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import com.lxinet.jeesns.core.utils.Const;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


/**
 * ckeditor上传文件
 * Created by zchuanzhao on 2017/09/06.
 */
@Controller
@RequestMapping("/ckeditorUpload")
public class CkeditorUploadController extends BaseController {

    /**
     * 上传图片
     * @param upload
     */
    @RequestMapping(value = "/uploadImage")
    public void uploadImage(@RequestParam MultipartFile[] upload) {
        String callback = request.getParameter("CKEditorFuncNum");
        PrintWriter out = null;
        try {
            response.setCharacterEncoding("utf-8");
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (!ServletFileUpload.isMultipartContent(request)) {
            out.print("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'请选择文件');</script>");
            out.flush();
            out.close();
        }

        String fileName;//上传的图片文件名
        String suffix;//上传图片的文件扩展名
        for (MultipartFile file : upload) {
            if (file.getSize() > 1 * 1024 * 1024) {
                out.print("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'文件大小不得大于10M');</script>");
                out.flush();
                out.close();
            }

            fileName = file.getOriginalFilename();
            suffix = fileName.substring(fileName.lastIndexOf("."), fileName.length()).toLowerCase();
            String[] imageExtensionNameArray = {".jpg", ".jpeg", ".png", ".gif", ".bmp"};
            String allImageExtensionName = "";
            boolean isContain = false;//默认不包含上传图片文件扩展名
            for (int i = 0; i < imageExtensionNameArray.length; i++) {
                if (suffix.equals(imageExtensionNameArray[i])) {
                    isContain = true;
                }
                if (i == 0) {
                    allImageExtensionName += imageExtensionNameArray[i];
                } else {
                    allImageExtensionName += " , " + imageExtensionNameArray[i];
                }

            }

            String newFileName = UUID.randomUUID() + suffix;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            String ymd = sdf.format(new Date());
            String path = Const.UPLOAD_PATH + "/images/" + ymd + "/";
            String savePath = request.getServletContext().getRealPath(path);
            if (isContain) {//包含
                File baseFile = new File(savePath);
                if (!baseFile.exists()) { // 如果路径不存在，创建
                    baseFile.mkdirs();
                }
                File targetFile = new File(baseFile, newFileName);
                try {
                    file.transferTo(targetFile);
                } catch (IOException e) {
                    out.print("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'"+e+"');</script>");
                    out.flush();
                    out.close();
                }
                String imageUrl = request.getContextPath() + path + newFileName;
                out.print("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'"+imageUrl+"'," + "'');</script>");
                out.flush();
                out.close();

            } else {
                out.print("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'文件格式不正确（必须为" + allImageExtensionName + "文件）');</script>");
                out.flush();
                out.close();
            }
        }
    }
}