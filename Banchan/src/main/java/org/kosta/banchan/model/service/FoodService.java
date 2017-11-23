package org.kosta.banchan.model.service;

import java.util.List;
import java.util.Map;

import org.kosta.banchan.model.vo.FoodSellVO;
import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.TradeVO;

public interface FoodService {
///////////////////start윤주/////////////////////////
	void orderFood(TradeVO tvo);
///////////////////end윤주//////////////////////////

	FoodVO getFoodByNo(String foodNo);

	FoodSellVO getFoodSellDetailByNo(String foodSellNo);


	List<FoodVO> getFoodListByMemId(String memId);

	void registerFoodSell(FoodSellVO foodSellVO);
	
	//////// 영민 start /////////
	void foodRegister(FoodVO fvo);

	List<Map<String, String>> allCategorySelect();
	////////영민 end /////////

	List<FoodSellVO> getFoodSellInfoByMemId(String memId);

	FoodVO getFoodMemInfo(String no);


}