package com.lxinet.jeesns.web.front;

import com.lxinet.jeesns.core.exception.NotLoginException;
import com.lxinet.jeesns.model.picture.Picture;
import com.lxinet.jeesns.common.utils.MemberUtil;
import com.lxinet.jeesns.core.dto.ResultModel;
import com.lxinet.jeesns.model.picture.PictureAlbum;
import com.lxinet.jeesns.service.picture.IPictureAlbumService;
import com.lxinet.jeesns.service.picture.IPictureService;
import com.lxinet.jeesns.core.utils.Const;
import com.lxinet.jeesns.core.utils.ImageUtil;
import com.lxinet.jeesns.core.utils.StringUtils;
import com.lxinet.jeesns.web.common.BaseController;
import com.lxinet.jeesns.model.member.Member;
import com.lxinet.jeesns.service.member.IMemberService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 文件上传
 * Created by zchuanzhao on 16/9/29.
 */
@Controller
@RequestMapping("/")
public class UploadController extends BaseController {
	@Resource
	private IMemberService memberService;
	@Resource
	private IPictureService pictureService;
	@Resource
	private IPictureAlbumService pictureAlbumService;

	@RequestMapping("${managePath}/uploadImage")
	@ResponseBody
	public Object manageUploadImage(@RequestParam(value = "file", required = false) MultipartFile file) {
		return uploadImage(file, 0);
	}


	/**
	 * 微博图片上传
	 * @param file
	 * @return
	 */
	@RequestMapping("/weiboUploadImage")
	@ResponseBody
	public Object weiboUploadImage(@RequestParam(value = "file", required = false) MultipartFile file) {
		return uploadImage(file, 2);
	}

	/**
	 * 普通图片上传
	 * @param file
	 * @return
	 */
	@RequestMapping("/uploadImage")
	@ResponseBody
	public Object indexUploadImage(@RequestParam(value = "file", required = false) MultipartFile file) {
		return uploadImage(file, 0);
	}

	/**
	 * 缩略图上传
	 * @param file
	 * @return
	 */
	@RequestMapping("/thumbnailUploadImage")
	@ResponseBody
	public Object thumbnailUploadImage(@RequestParam(value = "file", required = false) MultipartFile file) {
		return uploadImage(file, 11);
	}

	/**
	 * 保存图片
	 * @param file
	 * @param type 0是普通图片，1是文章图片，2是微博图片，3是群组帖子图片，11是缩略图
	 * @return
	 */
	private Object uploadImage(MultipartFile file, int type) {
		Member loginMember = MemberUtil.getLoginMember(request);
		if (loginMember == null){
			throw new NotLoginException();
		}
		String fileName = file.getOriginalFilename();
		String suffix = fileName.substring(fileName.lastIndexOf("."),fileName.length());
		if(suffix == null || (!".png".equals(suffix.toLowerCase()) && !".jpg".equals(suffix.toLowerCase()) && !".gif".equals(suffix.toLowerCase()) && !".jpeg".equals(suffix.toLowerCase()) && !".bmp".equals(suffix.toLowerCase()))) {
			return new ResultModel(-1,"格式不支持");
		}
		String newFileName = UUID.randomUUID() + suffix;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		String path = Const.UPLOAD_PATH + "/images/"+ymd+"/";
		String savePath = request.getServletContext().getRealPath(path);
		File baseFile = new File(savePath);
		File targetFile = new File(baseFile, newFileName);

		if (!baseFile.exists()) {
			baseFile.mkdirs();
		}
		//保存
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//上传成功的图片URL，如果是文章、群组帖子、微博图片，则返回图片ID
		String url = "";
		if(type == 2){
			try {
				PictureAlbum pictureAlbum = pictureAlbumService.findWeiboAlbum(loginMember.getId());
				if (pictureAlbum == null){
					pictureAlbum = new PictureAlbum();
					pictureAlbum.setType(2);
					pictureAlbum.setName("微博配图");
					pictureAlbum.setMemberId(loginMember.getId());
					pictureAlbum.setJuri(0);
					pictureAlbum.setCover(path + ImageUtil.SMALL_DEFAULT_PREVFIX + newFileName);
					pictureAlbumService.save(pictureAlbum);
				}
				BufferedImage sourceImg = ImageIO.read(new FileInputStream(targetFile));
				Picture picture = new Picture();
				picture.setWidth(sourceImg.getWidth());
				picture.setHeight(sourceImg.getHeight());
				picture.setMd5(DigestUtils.md5Hex(new FileInputStream(targetFile)));
				//生成缩略图和小图片
				new ImageUtil().dealImage(targetFile);
				picture.setPath(path + newFileName);
				picture.setThumbnailPath(path + ImageUtil.THUMB_DEFAULT_PREVFIX + newFileName);
				picture.setSmallPath(path + ImageUtil.SMALL_DEFAULT_PREVFIX + newFileName);
				picture.setType(type);
				picture.setMemberId(loginMember.getId());
				picture.setAlbumId(pictureAlbum.getId());
				pictureService.save(picture);
				url = String.valueOf(picture.getPictureId());
				if (StringUtils.isEmpty(pictureAlbum.getCover()) || Const.DEFAULT_PICTURE_COVER.equals(pictureAlbum.getCover())){
					pictureAlbum.setCover(picture.getSmallPath());
					pictureAlbumService.update(pictureAlbum);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(type == 11){
			//生成缩略图
			String thumbnailName = new ImageUtil().dealImage(targetFile);
			//删除原文件
			targetFile.delete();
			url = path + thumbnailName;
		}else {
			url = path + newFileName;
		}
		return new ResultModel(0,"上传成功",url);
	}

	/**
	 * 上传头像
	 * @param file
	 * @return
	 */
	@RequestMapping("member/uploadAvatar")
	@ResponseBody
	public Object uploadAvatar(@RequestParam(value = "__avatar1", required = false) MultipartFile file){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMM");
		String fileName = UUID.randomUUID()+".jpg";
		String ymd = simpleDateFormat.format(new Date());
		String filePath = Const.UPLOAD_PATH + "/avatar/" + ymd + "/";
		String savePath = request.getServletContext().getRealPath(filePath);
		File baseFile = new File(savePath);
		File targetFile = new File(savePath, fileName);

		if (!baseFile.exists()) {
			baseFile.mkdirs();
		}
		//保存
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Member loginMember = MemberUtil.getLoginMember(request);
		Member findMember = memberService.findById(loginMember.getId());
		Map result = new HashMap();
		if(findMember != null){
			String oldAvatar = findMember.getAvatar();
			findMember.setAvatar(filePath + fileName);
			ResultModel resultModel = memberService.updateAvatar(findMember,oldAvatar,request);
			if (resultModel.getCode() == 0){
				MemberUtil.setLoginMember(request, findMember);
			}
			result.put("success", resultModel.getCode() == 0);
			result.put("msg", resultModel.getMessage());
		}else {
			result.put("success",true);
			result.put("msg","会员不存在!");
		}
		return result;
	}
}
