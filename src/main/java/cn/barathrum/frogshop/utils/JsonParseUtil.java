package cn.barathrum.frogshop.utils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonParseUtil {
	
	public static List<String> JsonParseToAttributes(String arrStr) {
		String result = " ";
	     JSONArray jsonArr = JSONArray.fromObject(arrStr);
	     //System.out.println(jsonArr.getJSONObject(1).keys());  
	     Iterator<Object> it = jsonArr.iterator();  
	     List<String> attributes = new ArrayList<>();
	        while(it.hasNext()){  
	            JSONObject obj = (JSONObject)it.next();  
	            Iterator name = obj.keys();
	   
	            while(name.hasNext()) {
	            	//attributes like  '%"衣长":\\[%"短"%\\]%'  
	            	String key = name.next().toString();
	            	String value = (String) obj.get(key);
	            	//System.out.println(key+":"+value); 
	            	attributes.add("'%\""+key+"\":[%\""+value+"\"%]%'");
	            	//result = result+" attributes like '%\""+key+"\":[%\""+value+"\"%]%' and ";
	            }
	        }  
	    // String str =result.substring(0, result.length()-4);
	     System.out.println(attributes.toString());
	     return attributes;
	}
}
