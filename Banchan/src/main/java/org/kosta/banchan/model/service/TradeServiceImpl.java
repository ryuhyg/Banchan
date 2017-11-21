package org.kosta.banchan.model.service;



import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.dao.TradeDAO;
import org.kosta.banchan.model.vo.TradeVO;
import org.springframework.stereotype.Service;

@Service
public class TradeServiceImpl implements TradeService {

    @Resource
    private TradeDAO tradeDAO;

    @Override
    public List<TradeVO> getSellerTradeListByFoodSellNo(String foodSellNo){
    	return tradeDAO.getSellerTradeListByFoodSellNo(foodSellNo);
    }
}