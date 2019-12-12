package com.lxinet.jeesns.common.utils;

import com.lxinet.jeesns.model.picture.Picture;
import com.lxinet.jeesns.core.utils.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

/**
 * Created by zchuanzhao on 2017/3/7.
 */
public class PictureUtil {
    public static void delete(HttpServletRequest request, List<Picture> pictures){
        if (pictures != null){
            for (Picture picture : pictures){
                delete(request, picture);
            }
        }

    }

    public static void delete(HttpServletRequest request, Picture picture){
        String path = picture.getPath();
        String thumbnailPath = picture.getThumbnailPath();
        String smallPath = picture.getSmallPath();
        if(StringUtils.isNotEmpty(path)){
            File file = new File(request.getServletContext().getRealPath(path));
            if ((file.exists())){
                file.delete();
            }
        }
        if(StringUtils.isNotEmpty(thumbnailPath)){
            File file = new File(request.getServletContext().getRealPath(thumbnailPath));
            if ((file.exists())){
                file.delete();
            }
        }
        if(StringUtils.isNotEmpty(smallPath)){
            File file = new File(request.getServletContext().getRealPath(smallPath));
            if ((file.exists())){
                file.delete();
            }
        }
    }
}
