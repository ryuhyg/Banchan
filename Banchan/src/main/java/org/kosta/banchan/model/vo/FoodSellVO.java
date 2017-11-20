package org.kosta.banchan.model.vo;

public class FoodSellVO {

    private String foodSellNo;
    private String trDate;
    private String closeDate;
    private String loc;
    private int price;
    private int preQuantity;
    private String sellPostdate;
    private String unit;
    private String sellDetail;

   
    private FoodVO foodVO;

	public FoodSellVO() {
		super();
	}

	@Override
	public String toString() {
		return "FoodSellVO [foodSellNo=" + foodSellNo + ", trDate=" + trDate + ", closeDate=" + closeDate + ", loc="
				+ loc + ", price=" + price + ", preQuantity=" + preQuantity + ", sellPostdate=" + sellPostdate
				+ ", unit=" + unit + ", sellDetail=" + sellDetail + ", foodVO=" + foodVO + "]";
	}

	public String getFoodSellNo() {
		return foodSellNo;
	}

	public void setFoodSellNo(String foodSellNo) {
		this.foodSellNo = foodSellNo;
	}

	public String getTrDate() {
		return trDate;
	}

	public void setTrDate(String trDate) {
		this.trDate = trDate;
	}

	public String getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPreQuantity() {
		return preQuantity;
	}

	public void setPreQuantity(int preQuantity) {
		this.preQuantity = preQuantity;
	}

	public String getSellPostdate() {
		return sellPostdate;
	}

	public void setSellPostdate(String sellPostdate) {
		this.sellPostdate = sellPostdate;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getSellDetail() {
		return sellDetail;
	}

	public void setSellDetail(String sellDetail) {
		this.sellDetail = sellDetail;
	}

	public FoodVO getFoodVO() {
		return foodVO;
	}

	public void setFoodVO(FoodVO foodVO) {
		this.foodVO = foodVO;
	}
    
    
}