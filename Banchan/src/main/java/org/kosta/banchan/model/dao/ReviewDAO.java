package org.kosta.banchan.model.dao;

import java.util.HashMap;
import java.util.List;

import org.kosta.banchan.model.vo.ReviewVO;

public interface ReviewDAO {
	///////////// start윤주//////////////
	void reviewRegister(ReviewVO rvo);

	void updateSellerScore(String memId);

	List<ReviewVO> getReviewListByFoodSellNo(HashMap<String, String> paramMap);
	int getAllReviewCountByFoodSellNo(String foodSellNo);
	//////////// end윤주/////////////////////

}