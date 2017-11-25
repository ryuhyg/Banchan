package org.kosta.banchan.model.service;

import java.util.List;
import java.util.Map;

import org.kosta.banchan.model.vo.FoodSellVO;
import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.ListVO;
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

	FoodVO getFoodMemInfo(String foodNo);

	List<FoodVO> selectRegFoodByNo(String foodNo);
	
	void deleteRegFood(String foodNo);

	void updateRegFood(FoodVO fvo);

	ListVO<FoodSellVO> getFoodSellInfoByMemId(String memId, String pageNo);

}