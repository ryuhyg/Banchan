package org.kosta.banchan.model.vo;

public class SellerVO extends MemberVO {

 
    private String memId;
    private String sellerImage;
    private String sellerInfo;
    private float sellerScore;
	public SellerVO() {
		super();
	}
	@Override
	public String toString() {
		return "SellerVO [memId=" + memId + ", sellerImage=" + sellerImage + ", sellerInfo=" + sellerInfo
				+ ", sellerScore=" + sellerScore + "]";
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
    
    

}