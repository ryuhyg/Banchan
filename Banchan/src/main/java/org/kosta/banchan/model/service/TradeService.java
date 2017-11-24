package org.kosta.banchan.model.service;

import java.util.List;

import org.kosta.banchan.model.vo.ListVO;
import org.kosta.banchan.model.vo.TradeVO;

public interface TradeService {

	////////////////start 지원///////////////////
	             //List<TradeVO> getSellerTradeListByFoodSellNo(String foodSellNo);
	void completeTrade(String tradeNo);
	List<TradeVO> getAllSellerTradeList(String sellerId);
	////////////////end 지원///////////////////

	
	
	////////////////start윤주///////////////////
	List<TradeVO> getTradeListByMemId(String memId);
	////////////////end윤주////////////////////
	
	//우정
	int getTradeCountByFoodSellNo(String foodSellNo);
	ListVO<TradeVO> getSellerTradeListByFoodSellNo(String foodSellNo, String foodNo);


}