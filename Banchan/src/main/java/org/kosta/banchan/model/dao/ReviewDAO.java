package org.kosta.banchan.model.dao;

import org.kosta.banchan.model.vo.ReviewVO;

public interface ReviewDAO {
	/////////////start윤주//////////////
	void reviewRegister(ReviewVO rvo);
	void updateSellerScore(String memId);
	////////////end윤주/////////////////////
	
}