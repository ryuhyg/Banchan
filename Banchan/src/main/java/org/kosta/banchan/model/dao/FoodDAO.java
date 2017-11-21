package org.kosta.banchan.model.dao;

import java.util.List;
import org.kosta.banchan.model.vo.FoodVO;

public interface FoodDAO {
///////////////////start윤주/////////////////////////
	FoodVO getFoodInfoByFoodNo(String foodNo);
///////////////////end윤주//////////////////////////

	FoodVO getFoodByNo(String foodNo);

	List<FoodVO> getFoodListByMemId(String memId);

	/*int getTotalFoodCountByMemId(String memId);*/

}