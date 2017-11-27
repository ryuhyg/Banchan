package org.kosta.banchan.model.dao;

import java.util.List;

import org.kosta.banchan.model.vo.FoodSellVO;

public interface SellDAO {

	FoodSellVO getFoodSellDetailByNo(String foodSellNo);

	//////////// start윤주////////////
	int getLeftQuantityByFoodSellNo(String foodSellNo);
	List<FoodSellVO> findFoodSellList(String kw);
	//////////// end윤주///////////////

	void registerFoodSell(FoodSellVO foodSellVO);

	List<FoodSellVO> getFoodSellInfoByMemId(String memId);

}