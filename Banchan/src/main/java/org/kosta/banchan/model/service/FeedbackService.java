package org.kosta.banchan.model.service;

import org.kosta.banchan.model.vo.ListVO;
import org.kosta.banchan.model.vo.ReviewVO;

public interface FeedbackService {
	///////////// start윤주////////////////
	void reviewRegister(ReviewVO rvo, String memId,String foodNo);

	ListVO<ReviewVO> getReviewListByFoodSellNo(String foodSellNo,String pageNo);
	/////////////// end윤주/////////////////
}