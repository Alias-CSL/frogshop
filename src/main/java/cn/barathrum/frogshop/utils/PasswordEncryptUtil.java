package cn.barathrum.frogshop.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * 用户密码加密工具类
 * @author 83893
 *
 */
public class PasswordEncryptUtil {
	/**
	 * 
	 * @param credentials 用户密码
	 * @param salt 盐值
	 * @return
	 */
	public static String passwordEncry(String credentials,String salt) {
		String hashAlgorithmName = "MD5";//加密算法
		int hashIterations = 1024;//加密次数
		String result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations).toHex();
		return result;
	}
	/*public static void main(String[] args) {
		//String salt = UuidUtil.get32UUID();//盐值
		String salt = "admin";
		String result = passwordEncry("123456",salt);
		System.out.println(result);
	}*/
}
