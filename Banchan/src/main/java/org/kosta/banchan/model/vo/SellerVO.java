package org.kosta.banchan.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class SellerVO extends MemberVO {

    private String memId;
    private MultipartFile uploadImage; // 파일업로드를 위한 변수 
    private String sellerImage;
    private String sellerInfo;
    private float sellerScore;
	
	public SellerVO() {
		super();
	}
	
	
	public MultipartFile getUploadImage() {
		return uploadImage;
	}


	public void setUploadImage(MultipartFile uploadImage) {
		this.uploadImage = uploadImage;
	}


	public SellerVO(String memId, String sellerImage, String sellerInfo) {
		super();
		this.memId = memId;
		this.sellerImage = sellerImage;
		this.sellerInfo = sellerInfo;
	}
	

	public SellerVO(MultipartFile uploadImage, String sellerInfo) {
		super();
		this.uploadImage = uploadImage;
		this.sellerInfo = sellerInfo;
	}


	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getSellerImage() {
		return sellerImage;
	}
	public void setSellerImage(String sellerImage) {
		this.sellerImage = sellerImage;
	}
	public String getSellerInfo() {
		return sellerInfo;
	}
	public void setSellerInfo(String sellerInfo) {
		this.sellerInfo = sellerInfo;
	}
	public float getSellerScore() {
		return sellerScore;
	}
	public void setSellerScore(float sellerScore) {
		this.sellerScore = sellerScore;
	}


	@Override
	public String toString() {
		return "SellerVO [memId=" + memId + ", uploadImage=" + uploadImage + ", sellerImage=" + sellerImage
				+ ", sellerInfo=" + sellerInfo + ", sellerScore=" + sellerScore + "]";
	}
	
}