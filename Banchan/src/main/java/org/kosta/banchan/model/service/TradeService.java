package org.kosta.banchan.model.service;

import java.util.List;

import org.kosta.banchan.model.vo.TradeVO;

public interface TradeService {

	List<TradeVO> getSellerTradeListByFoodSellNo(String foodSellNo);


}