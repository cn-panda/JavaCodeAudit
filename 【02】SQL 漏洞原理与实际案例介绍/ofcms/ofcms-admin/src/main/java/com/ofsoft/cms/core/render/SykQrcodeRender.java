package com.ofsoft.cms.core.render;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.jfinal.kit.LogKit;
import com.jfinal.render.Render;
import com.jfinal.render.RenderException;

/**
 * 渲染二维码
 * 
 * @author OF
 * 
 */
public class SykQrcodeRender extends Render {

	private static final int BLACK = 0xFF000000;
	private static final int WHITE = 0xFFFFFFFF;

	private String url;

	public SykQrcodeRender(String url) {
		this.url = url;
	}

	@Override
	public void render() {
		MultiFormatWriter multiFormatWriter = new MultiFormatWriter();

		Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");

		BitMatrix matrix = null;
		try {
			matrix = multiFormatWriter.encode(url, BarcodeFormat.QR_CODE, 400,
					400, hints);
		} catch (WriterException e) {
			e.printStackTrace();
		}
		int width = matrix.getWidth();
		int height = matrix.getHeight();
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {
				image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
			}
		}

		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");

		ServletOutputStream sos = null;
		try {
			sos = response.getOutputStream();
			ImageIO.write(image, "jpeg", sos);
		} catch (IOException e) {
			if (getDevMode())
				throw new RenderException(e);
		} catch (Exception e) {
			throw new RenderException(e);
		} finally {
			if (sos != null) {
				try {
					sos.close();
				} catch (IOException e) {
					LogKit.logNothing(e);
				}
			}
		}
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
