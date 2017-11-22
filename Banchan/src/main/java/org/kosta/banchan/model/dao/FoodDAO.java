package org.kosta.banchan.model.dao;

import java.util.List;

import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.TradeVO;

public interface FoodDAO {
///////////////////start윤주/////////////////////////
	void orderFood(TradeVO tvo);
///////////////////end윤주//////////////////////////

	FoodVO getFoodByNo(String foodNo);

	List<FoodVO> getFoodListByMemId(String memId);

	/*int getTotalFoodCountByMemId(String memId);*/

}