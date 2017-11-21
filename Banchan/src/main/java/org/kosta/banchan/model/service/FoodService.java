package org.kosta.banchan.model.service;

import java.util.List;

import org.kosta.banchan.model.vo.FoodSellVO;
import org.kosta.banchan.model.vo.FoodVO;

public interface FoodService {

	FoodVO getFoodByNo(String foodNo);

	FoodSellVO getFoodSellDetailByNo(String foodSellNo);


	List<FoodVO> getFoodListByMemId(String memId);

	void registerFoodSell(FoodSellVO foodSellVO);



}