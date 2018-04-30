package cn.barathrum.frogshop.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;

public class DigitalCodeUtil {
	/**
	 * 
	 * @param length 验证码长度
	 * @return
	 */
	public static String getRandomCode(int length){
		int i = 0;
		Random random = new Random();
		StringBuffer verifyCode = new StringBuffer();  
		 while(i < length){  
             int t = random.nextInt(10);  
             verifyCode.append(t);  
                i++;  
             
         }  
		return verifyCode.toString();
	}
//@Autowired
	//private static SimpleDateFormat simpleDateFormat;
	/**
	 * 获取订单编码，通过下单时间+4位随机数
	 * @return
	 */
	public static String getOrderCode() {
		SimpleDateFormat simpleDateFormat;

		simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");

		Date date = new Date();

		String str = simpleDateFormat.format(date);

		Random random = new Random();

		String rannum = getRandomCode(4);// 获取4位随机数

		return str + rannum;// 当前时间
	}
}
