package cn.barathrum.frogshop.utils;

import cn.barathrum.frogshop.sendsms.AbsRestClient;
import cn.barathrum.frogshop.sendsms.JsonReqClient;

/**
 * 用于发送验证码到用户手机
 * @author 83893
 *
 */
public class SendVerifyCodeUtil {
	private static String sid = "6e41e64ffb2cd46baef8f71937f5a2ea";
	private static String token = "20c6db30dd9f607e3b486615614c7eec";
	private static String appid = "c30e151c28ad4256bbefb25d89c9b27d";
	private static String templateid = "312723";
	//private String param = "1313";//自己生成验证码
	//private String mobile = "13257617382";
	private static String uid = "";
	
	static AbsRestClient InstantiationRestAPI() {
		return new JsonReqClient();
	}
	
	public static String testSendSms( String param, String mobile){
		try {
			String result=InstantiationRestAPI().sendSms(sid, token, appid, templateid, param, mobile, uid);
			System.out.println("Response content is: " + result);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
