package org.kosta.banchan.model.vo;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class FoodVO {

    private ArrayList<ReviewVO> reviewList;
    private String foodNo;
    private String foodName;
    private String foodDe;
    private float foodScore;
    private String foodMainImg;
    private String foodPostdate;
    private String categoryNo;
    private String memId;
    private MultipartFile uploadImage;
    private SellerVO sellerVO;
    
	public FoodVO() {
		super();
	}

	@Override
	public String toString() {
		return "FoodVO [reviewList=" + reviewList + ", foodNo=" + foodNo + ", foodName=" + foodName + ", foodDe="
				+ foodDe + ", foodScore=" + foodScore + ", foodMainImg=" + foodMainImg + ", foodPostdate="
				+ foodPostdate + ", categoryNo=" + categoryNo + ", memId=" + memId + ", uploadImage=" + uploadImage
				+ ", sellerVO=" + sellerVO + ", getUploadImage()=" + getUploadImage() + ", getReviewList()="
				+ getReviewList() + ", getFoodNo()=" + getFoodNo() + ", getFoodName()=" + getFoodName()
				+ ", getFoodDe()=" + getFoodDe() + ", getFoodScore()=" + getFoodScore() + ", getFoodMainImg()="
				+ getFoodMainImg() + ", getFoodPostdate()=" + getFoodPostdate() + ", getCategoryNo()=" + getCategoryNo()
				+ ", getMemId()=" + getMemId() + ", getSellerVO()=" + getSellerVO() + ", toString()=" + super.toString()
				+ "]";
	}


	public MultipartFile getUploadImage() {
		return uploadImage;
	}

	public void setUploadImage(MultipartFile uploadImage) {
		this.uploadImage = uploadImage;
	}

	public ArrayList<ReviewVO> getReviewList() {
		return reviewList;
	}
	public void setReviewList(ArrayList<ReviewVO> reviewList) {
		this.reviewList = reviewList;
	}
	
	public String getFoodNo() {
		return foodNo;
	}
	public void setFoodNo(String foodNo) {
		this.foodNo = foodNo;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getFoodDe() {
		return foodDe;
	}
	public void setFoodDe(String foodDe) {
		this.foodDe = foodDe;
	}
	public float getFoodScore() {
		return foodScore;
	}
	public void setFoodScore(float foodScore) {
		this.foodScore = foodScore;
	}
	public String getFoodMainImg() {
		return foodMainImg;
	}
	public void setFoodMainImg(String foodMainImg) {
		this.foodMainImg = foodMainImg;
	}
	public String getFoodPostdate() {
		return foodPostdate;
	}
	public void setFoodPostdate(String foodPostdate) {
		this.foodPostdate = foodPostdate;
	}
	public String getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}

	public SellerVO getSellerVO() {
		return sellerVO;
	}
	public void setSellerVO(SellerVO sellerVO) {
		this.sellerVO = sellerVO;
	}
}