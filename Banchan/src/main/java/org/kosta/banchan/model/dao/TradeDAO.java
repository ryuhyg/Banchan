package org.kosta.banchan.model.dao;

import java.util.List;

import org.kosta.banchan.model.vo.TradeVO;

public interface TradeDAO {

	List<TradeVO> getSellerTradeListByFoodSellNo(String foodSellNo);

	void updateTradeStatus(String tradeNo);

	List<TradeVO> getAllSellerTradeList(String sellerId);
	////////////////////Start 윤주 //////////////////////////
	List<TradeVO> getTradeListByMemId(String memId);
	////////////////////END 윤주 //////////////////////////

	int getTradeCountByFoodSellNo(String foodSellNo);

}