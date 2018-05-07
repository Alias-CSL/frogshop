package cn.barathrum.frogshop.form.bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
/**
 * 用于保存前台用户上传的图片
 * @author 83893
 *
 */
public class UploadImge {
	List<MultipartFile> images;
	
	public UploadImge() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UploadImge(List<MultipartFile> images) {
		super();
		this.images = images;
	}

	public List<MultipartFile> getImages() {
		return images;
	}

	public void setImages(List<MultipartFile> images) {
		this.images = images;
	}
	
}
