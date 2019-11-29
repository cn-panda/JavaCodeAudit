package com.ofsoft.cms.admin.controller.weixin;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.jfinal.MsgController;
import com.jfinal.weixin.sdk.msg.in.*;
import com.jfinal.weixin.sdk.msg.in.event.*;
import com.jfinal.weixin.sdk.msg.in.speech_recognition.InSpeechRecognitionResults;
import com.jfinal.weixin.sdk.msg.out.OutTextMsg;
import com.ofsoft.cms.core.annotation.Action;
import com.ofsoft.cms.core.config.ErrorCode;
import org.apache.commons.lang3.StringUtils;

@Action(path = "/weixin")
public class MessageController extends MsgController {

	@Override
	public ApiConfig getApiConfig() {
		return WeiXinConfig.getApiConfig();
	}

	@Override
	protected void processInCustomEvent(InCustomEvent arg0) {

	}

	/**
	 * 处理接收到的关注/取消关注事件
	 * 
	 * @param inFollowEvent
	 *            处理接收到的关注/取消关注事件
	 */
	@Override
	protected void processInFollowEvent(InFollowEvent inFollowEvent) {
		OutTextMsg outMsg = new OutTextMsg(inFollowEvent);
		if (InFollowEvent.EVENT_INFOLLOW_SUBSCRIBE
				.equalsIgnoreCase(inFollowEvent.getEvent())) {
			outMsg.setContent(WxConfigInfo
					.getMsg("weixin_processInFollowEvent"));
		} else {
			outMsg.setContent(WxConfigInfo.getMsg("weixin_unsubscribe"));
		}
		render(outMsg);
	}

	/**
	 * 处理接收到的扫描带参数二维码事件
	 */
	@Override
	protected void processInQrCodeEvent(InQrCodeEvent params) {
		OutTextMsg outMsg = new OutTextMsg(params);
		try {
			if (params.getEventKey().startsWith("qrscene_")) {
				// 未关注
					outMsg.setContent(WxConfigInfo
							.getMsg("weixin_processInFollowEvent_two"));
				render(outMsg);
			} else {
				// 已关注
				outMsg.setContent(WxConfigInfo
						.getMsg("weixin_processInFollowEvent_two"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			outMsg.setContent(ErrorCode.get("6666"));
			render(outMsg);
		}
	}

	@Override
	protected void processInImageMsg(InImageMsg arg0) {

	}

	@Override
	protected void processInLinkMsg(InLinkMsg arg0) {

	}

	@Override
	protected void processInLocationEvent(InLocationEvent arg0) {

	}

	@Override
	protected void processInLocationMsg(InLocationMsg inLocationMsg) {
		OutTextMsg outMsg = new OutTextMsg(inLocationMsg);
		outMsg.setContent("已收到地理位置消息:" + "\nlocation_X = "
				+ inLocationMsg.getLocation_X() + "\nlocation_Y = "
				+ inLocationMsg.getLocation_Y() + "\nscale = "
				+ inLocationMsg.getScale() + "\nlabel = "
				+ inLocationMsg.getLabel());
		outMsg.setContent("success");
		render(outMsg);

	}

	@Override
	protected void processInMassEvent(InMassEvent arg0) {

	}

	@Override
	protected void processInMenuEvent(InMenuEvent inMenuEvent) {
		OutTextMsg outMsg = new OutTextMsg(inMenuEvent);
		outMsg.setContent("已收到地理位置消息");
		render(outMsg);
	}

	@Override
	protected void processInMerChantOrderEvent(InMerChantOrderEvent arg0) {

	}

	@Override
	protected void processInPoiCheckNotifyEvent(InPoiCheckNotifyEvent arg0) {

	}

	@Override
	protected void processInShakearoundUserShakeEvent(
			InShakearoundUserShakeEvent arg0) {

	}

	@Override
	protected void processInShortVideoMsg(InShortVideoMsg arg0) {

	}

	@Override
	protected void processInSpeechRecognitionResults(
			InSpeechRecognitionResults arg0) {

	}

	@Override
	protected void processInSubmitMemberCardEvent(InSubmitMemberCardEvent arg0) {

	}

	@Override
	protected void processInTemplateMsgEvent(InTemplateMsgEvent arg0) {

	}

	@Override
	protected void processInTextMsg(InTextMsg inTextMsg) {
		String msgContent = inTextMsg.getContent().trim();
		Record record = Db
				.findFirst(
						"select id, auto_key, content, status, created, updated from of_sys_weixin_auto where is_del = '1' and status='1' and auto_key = ? ",
						msgContent);
		OutTextMsg outMsg = new OutTextMsg(inTextMsg);
		if (record != null) {
			outMsg.setContent(StringUtils.defaultIfBlank(
					record.getStr("content"),
					WxConfigInfo.getMsg("weixin_seach_no_info")));
			render(outMsg);
		} else {
			outMsg.setContent(WxConfigInfo.getMsg("weixin_auto_no_info"));
		}
		render(outMsg);

	}

	@Override
	protected void processInUpdateMemberCardEvent(InUpdateMemberCardEvent arg0) {

	}

	@Override
	protected void processInUserPayFromCardEvent(InUserPayFromCardEvent arg0) {

	}

	@Override
	protected void processInUserViewCardEvent(InUserViewCardEvent arg0) {

	}

	@Override
	protected void processInVerifyFailEvent(InVerifyFailEvent arg0) {

	}

	@Override
	protected void processInVerifySuccessEvent(InVerifySuccessEvent arg0) {

	}

	@Override
	protected void processInVideoMsg(InVideoMsg arg0) {

	}

	@Override
	protected void processInVoiceMsg(InVoiceMsg arg0) {

	}

	@Override
	protected void processInWifiEvent(InWifiEvent arg0) {

	}

	@Override
	protected void processIsNotDefinedEvent(InNotDefinedEvent arg0) {

	}

	@Override
	protected void processIsNotDefinedMsg(InNotDefinedMsg arg0) {

	}

}
