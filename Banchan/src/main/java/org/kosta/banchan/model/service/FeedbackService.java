package org.kosta.banchan.model.service;

import java.util.List;

import org.kosta.banchan.model.vo.ReviewVO;

public interface FeedbackService {
	/////////////start윤주////////////////
	void reviewRegister(ReviewVO rvo,String memId); 
	List<ReviewVO> getReviewListByFoodSellNo(String foodSellNo);
	///////////////end윤주/////////////////
}