package org.kosta.Banchan.model;

import org.springframework.web.multipart.MultipartFile;

/**
 * 파일 업로드 지원
 * @author kosta
 *
 */
public class ProductVO {
	private String name;
	private MultipartFile uploadFile; // 파일업로드를 위한 변수 
	public ProductVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductVO(String name, MultipartFile uploadFile) {
		super();
		this.name = name;
		this.uploadFile = uploadFile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	@Override
	public String toString() {
		return "ProductVO [name=" + name + ", uploadFile=" + uploadFile + "]";
	}
	
}










