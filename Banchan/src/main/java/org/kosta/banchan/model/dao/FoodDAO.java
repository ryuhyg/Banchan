package org.kosta.banchan.model.dao;

import java.util.List;

import org.kosta.banchan.model.vo.FoodVO;

public interface FoodDAO {

	FoodVO getFoodByNo(String foodNo);

	List<FoodVO> getFoodListByMemId(String memId);

	/*int getTotalFoodCountByMemId(String memId);*/


}