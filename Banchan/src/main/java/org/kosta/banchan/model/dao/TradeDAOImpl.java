package org.kosta.banchan.model.dao;


import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.vo.TradeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TradeDAOImpl implements TradeDAO {

	@Resource
    private SqlSessionTemplate template;
	
	
	@Override	
	public List<TradeVO> getSellerTradeListByFoodSellNo(String foodSellNo){
		return template.selectList("trade.getSellerTradeListByFoodSellNo", foodSellNo);
	}

}