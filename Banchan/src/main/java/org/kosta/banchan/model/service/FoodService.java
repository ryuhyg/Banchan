package org.kosta.banchan.model.service;

import org.kosta.banchan.model.vo.FoodSellVO;
import org.kosta.banchan.model.vo.FoodVO;

public interface FoodService {

	FoodVO getFoodByNo(String foodNo);

	FoodSellVO getFoodSellDetailByNo(String foodSellNo);

	void registerFoodSell(FoodSellVO foodSellVO);


}