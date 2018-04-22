package cn.barathrum.frogshop.utils;

import java.util.UUID;
/**
 * @description  生成UUID工具类
 * @author 83893
 *
 */
public class UuidUtil {

	public static String get32UUID() {
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		return uuid;
	}
}
