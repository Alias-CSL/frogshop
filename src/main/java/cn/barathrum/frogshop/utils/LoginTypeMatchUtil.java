package cn.barathrum.frogshop.utils;

public class LoginTypeMatchUtil {
	public static final int PHONETYPE = 1;
	public static final int EMAILTYPE = 2;
	public static final int NAMETYPE = 3;
	public static int loginType(String str) {
		String phonePattern = "^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\\d{8}$";
		String emailPattern = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";   
		if(str.matches(phonePattern)) {//手机类型
			return PHONETYPE;
		}else if(str.matches(emailPattern)) {//邮箱类型
			return EMAILTYPE;
		}else{//用户名类型
			return NAMETYPE;
		}
	}
	public static void main(String[] args) {
		System.out.println(LoginTypeMatchUtil.loginType("lisi"));
		System.out.println(LoginTypeMatchUtil.loginType("13257617382"));
		System.out.println(LoginTypeMatchUtil.loginType("833965726@qq.com"));
		
	}
}
