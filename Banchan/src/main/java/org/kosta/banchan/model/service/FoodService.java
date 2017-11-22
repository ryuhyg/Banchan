package org.kosta.banchan.model.service;

import java.util.List;

import org.kosta.banchan.model.vo.FoodSellVO;
import org.kosta.banchan.model.vo.FoodVO;

public interface FoodService {
///////////////////start윤주/////////////////////////
FoodVO getFoodInfoByFoodNo(String foodNo);
///////////////////end윤주//////////////////////////

	FoodVO getFoodByNo(String foodNo);

	FoodSellVO getFoodSellDetailByNo(String foodSellNo);


	List<FoodVO> getFoodListByMemId(String memId);

	void registerFoodSell(FoodSellVO foodSellVO);

	List<FoodSellVO> getFoodSellInfoByMemId(String memId);



}