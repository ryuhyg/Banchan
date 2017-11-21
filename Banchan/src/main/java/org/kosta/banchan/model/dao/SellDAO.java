package org.kosta.banchan.model.dao;

import org.kosta.banchan.model.vo.FoodSellVO;

public interface SellDAO {

	FoodSellVO getFoodSellDetailByNo(String foodSellNo);


}