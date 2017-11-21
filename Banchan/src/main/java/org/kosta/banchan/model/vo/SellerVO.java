package org.kosta.banchan.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class SellerVO extends MemberVO {

    private String memId;
    private String sellerImg;
    private String sellerInfo;
    private float sellerScore;
	
	public SellerVO() {
		super();
		//this.setAddressVO(new AddressVO());
	}

	
/*	@Override
	public String toString() {
		return "SellerVO [MemberVO [memId=" + memId+", pw=" + super.getPw()+ ", memName=" + super.getMemName() 
		+ ", birth=" + super.getBirth() + ", tel=" + super.getTel()+ ", addressDe=" +super.getAddressDe()
		+ ", pwAnswer=" + super.getPwAnswer() + ", enableNo=" + super.getEnableNo()+ ", pwQnaNo="+super.getPwQnaNo()
		+ ", pwQnaNo="+ super.getPwQnaNo() + "AddressVO [ addressNO=" + super.getAddressVO().getAddressNo()
		+"addressAPI=" + super.getAddressVO().getAddressAPI()+"Latitude=" + super.getAddressVO().getLatitude()+"Longitude=" + super.getAddressVO().getLongitude()+"]]"
		+ ", sellerImg=" + sellerImg + ", sellerInfo=" + sellerInfo + ", sellerScore="
				+ sellerScore + "]";
>>>>>>> branch 'master' of https://github.com/ryuhyg/Banchan.git
	}
<<<<<<< HEAD


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
*/


	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getsellerImg() {
		return sellerImg;
	}
	public void setsellerImg(String sellerImg) {
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


	@Override
	public String toString() {
		return "SellerVO [memId=" + memId + ", sellerImg=" + sellerImg + ", sellerInfo=" + sellerInfo + ", sellerScore="
				+ sellerScore + "]";
	}
	
	
}