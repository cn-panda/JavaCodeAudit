package com.lxinet.jeesns.core.utils;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;

/**
 * Created by zchuanzhao on 2017/3/7.
 */
public class ImageUtil {
    public static final String THUMB_DEFAULT_PREVFIX = "thumb_";
    public static final String SMALL_DEFAULT_PREVFIX = "small_";
    private static final int DEFAULT_WIDTH = 260;
    private static final int DEFAULT_HEIGHT = 160;
    private static final int THUMB_DEFAULT_WIDTH = 160;
    private static final int THUMB_DEFAULT_HEIGHT = 160;
    private File targetFile;

    public String dealImage(File imgFile){
        //先缩小图片
        thumbnailImage(imgFile);
        //再裁剪图片
        return cutImage(targetFile);
    }

    /**
     * 根据图片路径生成缩略图
     * @param imgFile 原图片
     * @param prevfix 生成缩略图的前缀
     */
    private String thumbnailImage(File imgFile, String prevfix) {
        String thumbPath = "";
        String fileName = "";
        int w;
        int h;
        if (imgFile.exists()) {
            try {
                // ImageIO 支持的图片类型 : [BMP, bmp, jpg, JPG, wbmp, jpeg, png, PNG, JPEG, WBMP, GIF, gif]
                String types = Arrays.toString(ImageIO.getReaderFormatNames());
                String suffix = null;
                // 获取图片后缀
                if (imgFile.getName().indexOf(".") > -1) {
                    suffix = imgFile.getName().substring(imgFile.getName().lastIndexOf(".") + 1);
                }
                // 类型和图片后缀全部小写，然后判断后缀是否合法
                if (suffix == null || types.toLowerCase().indexOf(suffix.toLowerCase()) < 0) {
                    return thumbPath;
                }
                Image img = ImageIO.read(imgFile);
                int width = img.getWidth(null);
                int height = img.getHeight(null);
                if (width > height){
                    h = DEFAULT_HEIGHT;
                    w = (int) ((width * h * 1.0) / (height * 1.0));
                }else {
                    w = DEFAULT_WIDTH;
                    h = (int) ((height * w * 1.0) / (width * 1.0));
                }
                BufferedImage bi = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
                Graphics g = bi.getGraphics();
                g.drawImage(img, 0, 0, w, h, Color.LIGHT_GRAY, null);
                g.dispose();
                fileName = prevfix + imgFile.getName();
                String p = imgFile.getPath();
                // 将图片保存在原目录并加上前缀
                thumbPath = p.substring(0, p.lastIndexOf(File.separator)) + File.separator + fileName;
                targetFile = new File(thumbPath);
                ImageIO.write(bi, suffix, targetFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return fileName;
    }

    private String thumbnailImage(File imgFile) {
        return thumbnailImage(imgFile, SMALL_DEFAULT_PREVFIX);
    }


    /**
     * 裁剪图片
     * @param imgFile
     * @return
     */
    private String cutImage(File imgFile) {
        String fileName = "";
        String thumbPath = "";
        int w;
        int h;
        int x;
        int y;
        try {
            // ImageIO 支持的图片类型 : [BMP, bmp, jpg, JPG, wbmp, jpeg, png, PNG, JPEG, WBMP, GIF, gif]
            String types = Arrays.toString(ImageIO.getReaderFormatNames());
            String suffix = null;
            // 获取图片后缀
            if (imgFile.getName().indexOf(".") > -1) {
                suffix = imgFile.getName().substring(imgFile.getName().lastIndexOf(".") + 1);
            }
            // 类型和图片后缀全部小写，然后判断后缀是否合法
            if (suffix == null || types.toLowerCase().indexOf(suffix.toLowerCase()) < 0) {
                return thumbPath;
            }
            Image img = ImageIO.read(imgFile);
            int width = img.getWidth(null);
            int height = img.getHeight(null);
            if (width > THUMB_DEFAULT_WIDTH){
                x = (width - THUMB_DEFAULT_WIDTH) / 2;
                w = THUMB_DEFAULT_WIDTH + x;
            }else {
                w = width;
                x = 0;
            }
            if (height > THUMB_DEFAULT_HEIGHT){
                y = (height - THUMB_DEFAULT_HEIGHT) / 2;
                h = THUMB_DEFAULT_HEIGHT + y;
            }else {
                h = height;
                y = 0;
            }
            BufferedImage bi = new BufferedImage(THUMB_DEFAULT_WIDTH, THUMB_DEFAULT_HEIGHT, BufferedImage.TYPE_INT_RGB);
            Graphics g = bi.getGraphics();
            g.drawImage(img, 0, 0, w, h, x, y, x + w,y + h, null);
            g.dispose();
            // 保存新图片
            String name = imgFile.getName();
            name = name.replaceAll(SMALL_DEFAULT_PREVFIX,"");
            fileName = THUMB_DEFAULT_PREVFIX + name;
            String p = imgFile.getPath();
            // 将图片保存在原目录并加上前缀
            thumbPath = p.substring(0, p.lastIndexOf(File.separator)) + File.separator + fileName;
            targetFile = new File(thumbPath);
            ImageIO.write(bi, suffix, targetFile);
        } catch (Exception e){
            e.printStackTrace();
        } finally {

        }
        return fileName;
    }
}
