package org.kosta.banchan.model.vo;

import org.springframework.web.multipart.MultipartFile;


public class SellerVO extends MemberVO {

    private String memId;
    private String sellerImg;
    private String sellerInfo;
    private float sellerScore;
    private MultipartFile uploadImage;
    
   
	public SellerVO() {
		super();
	}
	
	public SellerVO(String sellerImg, String sellerInfo) {
		super();
		this.sellerImg = sellerImg;
		this.sellerInfo = sellerInfo;
	}

	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getSellerImg() {
		return sellerImg;
	}
	public void setSellerImg(String sellerImg) {
		this.sellerImg = sellerImg;
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
	public MultipartFile getUploadImage() {
		return uploadImage;
	}
	public void setUploadImage(MultipartFile uploadImage) {
		this.uploadImage = uploadImage;
	}
	@Override
	public String toString() {
		return "SellerVO [memId=" + memId + ", sellerImg=" + sellerImg + ", sellerInfo=" + sellerInfo + ", sellerScore="
				+ sellerScore + ", uploadImage=" + uploadImage + ", getMemId()=" + getMemId() + ", getSellerImg()="
				+ getSellerImg() + ", getSellerInfo()=" + getSellerInfo() + ", getSellerScore()=" + getSellerScore()
				+ ", getUploadImage()=" + getUploadImage() + ", toString()=" + super.toString() + "]";
	}

   
    

}