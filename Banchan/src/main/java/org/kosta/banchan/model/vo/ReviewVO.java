package org.kosta.banchan.model.vo;


public class ReviewVO {

    private String revNo;
    private int score;
    private String revContent;
    private String revPostdate;
    private String trNo;
	public ReviewVO() {
		super();
	}
	@Override
	public String toString() {
		return "ReviewVO [revNo=" + revNo + ", score=" + score + ", revContent=" + revContent + ", revPostdate="
				+ revPostdate + ", trNo=" + trNo + "]";
	}
	public String getRevNo() {
		return revNo;
	}
	public void setRevNo(String revNo) {
		this.revNo = revNo;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	public String getRevPostdate() {
		return revPostdate;
	}
	public void setRevPostdate(String revPostdate) {
		this.revPostdate = revPostdate;
	}
	public String getTrNo() {
		return trNo;
	}
	public void setTrNo(String trNo) {
		this.trNo = trNo;
	}

    



}