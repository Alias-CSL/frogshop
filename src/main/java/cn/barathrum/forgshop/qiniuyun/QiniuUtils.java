package cn.barathrum.forgshop.qiniuyun;

import java.io.InputStream;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;

public class QiniuUtils {
/*	private static final String ACCESS_KEY = "UURIzmPVoOP0FDgRno5KmWibH35-lsl4jn7ddMW2";
	private static final String SECRET_KEY = "ySDDWQa9TN8dFPRh4E8rlpgSXsy4xpfF2-e9XFP3";
	 默认上传空间
	private static final String BUCKET_NAME = "barathrum";// 默认到其他类中
	 空间默认域名 
	private static final String BUCKET_HOST_NAME = "p7bhzmlhi.bkt.clouddn.com";
	//private static UploadManager uploadManager = new UploadManager();
	public static Auth getAuth() {  
	    return Auth.create(ACCESS_KEY, SECRET_KEY);  
	}  */
	public static String streamUpload(String key,InputStream inputStream) { 
		//构造一个带指定Zone对象的配置类
		Configuration cfg = new Configuration(Zone.zone2());
	
		//...其他参数参考类注释
		UploadManager uploadManager = new UploadManager(cfg);
		//...生成上传凭证，然后准备上传
		String accessKey = "UURIzmPVoOP0FDgRno5KmWibH35-lsl4jn7ddMW2";
		String secretKey = "ySDDWQa9TN8dFPRh4E8rlpgSXsy4xpfF2-e9XFP3";
		String bucket = "barathrum";
		//...其他参数参考类注释

		//byte[] uploadBytes = "hello qiniu cloud".getBytes("utf-8");
		//System.out.println("QiniuUtils in");
   // ByteArrayInputStream byteInputStream= (ByteArrayInputStream) inputStream;
		Auth auth = Auth.create(accessKey, secretKey);
		String upToken = auth.uploadToken(bucket);

		try {
		    Response response = uploadManager.put(inputStream,key,upToken,null, null);
		    //解析上传成功的结果
		    DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
		    //System.out.println("QiniuUtils success");
		    //System.out.println(putRet.key);
		    //System.out.println(putRet.hash);
		    return putRet.key;
		} catch (QiniuException ex) {
		    Response r = ex.response;
		    //System.err.println(r.toString());
		    try {
		        System.err.println(r.bodyString());
		    } catch (QiniuException ex2) {
		        //ignore
		    }
		    	return null;		    	
		}

	}
}
