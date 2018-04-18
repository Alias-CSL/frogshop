package cn.barathrum.frogshop.test;

import java.io.File;

public class Demo {
	public static void main(String[] args) {
		//String basepath = "D:\\frogshop\\src\\main\\webapp\\goodImage\\goodDetial\\";
		for(int i = 3;i < 95;i++) {
			for(int j =1;j < 4;j++){
				System.out.println("insert into shop_desc_picture value(goodId,descPicture) VALUES("+i+",http://localhost:8080/frogshop/goodImage/goodDesc/"+i+"/"+j+".jpg);");
			}
		}
	}
}
