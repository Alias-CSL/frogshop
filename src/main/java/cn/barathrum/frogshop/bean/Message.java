package cn.barathrum.frogshop.bean;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 通用的返回的类
 * @author 83893
 *
 */

public class Message implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//状态码
	public static final int successCode = 100;
	public static final int failCode = 200;
	private int code;
	//提示信息
	private String msg;
	//用户要返回给浏览器的数据
	private Map<String,Object> extend = new HashMap<>();
	
	public static Message success() {
		Message result = new Message();
		result.setCode(successCode);
		result.setMsg("处理成功");
		return result;
		
	}

	public static Message fail(){
		Message result = new Message();
		result.setCode(failCode);
		result.setMsg("处理失败");
		
		return result;
	}
	
	public Message add(String key,Object value) {
		this.getExtend().put(key, value);
		return this;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

	public static int getSuccesscode() {
		return successCode;
	}

	public static int getFailcode() {
		return failCode;
	}
	public static void main(String[] args) {
		 String arrStr = "[{\"衣长\":\"短\",\"品牌\":\"PLAYBOY/花花公子\",\"尺码\":\"M\"}]";  
	     JSONArray jsonArr = JSONArray.fromObject(arrStr);
	     //System.out.println(jsonArr.getJSONObject(1).keys());  
	     Iterator<Object> it = jsonArr.iterator();  
	     String result = "(";
	     while(it.hasNext()){  
	            JSONObject obj = (JSONObject)it.next();  
	            Iterator name = obj.keys();
	            while(name.hasNext()) {
	            	//attributes like  '%"衣长":\\[%"短"%\\]%'  
	            	String key = name.next().toString();
	            	String value = (String) obj.get(key);
	            	System.out.println(key+":"+value);  
	            	result = result+" attributes like '%\""+key+"\":\\\\[%\""+value+"\"%\\\\]%' and ";
	            }
	        }  
	     String str =result.substring(0, result.length()-4)+ ")";
	     System.out.println(str);
	}
}
