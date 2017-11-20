package org.kosta.banchan.model.vo;
public class Authority {

    private String memId;
    public String authNo;
	public Authority() {
		super();
	}
	@Override
	public String toString() {
		return "Authority [memId=" + memId + ", authNo=" + authNo + "]";
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getAuthNo() {
		return authNo;
	}
	public void setAuthNo(String authNo) {
		this.authNo = authNo;
	}

    
    
    
}