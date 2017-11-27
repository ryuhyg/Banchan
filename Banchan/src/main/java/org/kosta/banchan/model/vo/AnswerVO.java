package org.kosta.banchan.model.vo;

public class AnswerVO {

	private String ansNo;
	private String ansContent;
	private String ansPostdate;
	private String memId;

	public AnswerVO() {
		super();
	}

	@Override
	public String toString() {
		return "AnswerVO [ansNo=" + ansNo + ", ansContent=" + ansContent + ", ansPostdate=" + ansPostdate + ", memId="
				+ memId + "]";
	}

	public String getAnsNo() {
		return ansNo;
	}

	public void setAnsNo(String ansNo) {
		this.ansNo = ansNo;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public String getAnsPostdate() {
		return ansPostdate;
	}

	public void setAnsPostdate(String ansPostdate) {
		this.ansPostdate = ansPostdate;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

}