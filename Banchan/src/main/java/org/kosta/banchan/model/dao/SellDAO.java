package org.kosta.banchan.model.dao;

import java.util.List;

import org.kosta.banchan.model.vo.FoodSellVO;

public interface SellDAO {

	FoodSellVO getFoodSellDetailByNo(String foodSellNo);

	void registerFoodSell(FoodSellVO foodSellVO);

	List<FoodSellVO> getFoodSellInfoByMemId(String memId);

}