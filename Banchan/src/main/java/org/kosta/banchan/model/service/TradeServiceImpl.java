package org.kosta.banchan.model.service;



import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.dao.SellDAO;
import org.kosta.banchan.model.dao.TradeDAO;
import org.kosta.banchan.model.vo.TradeVO;
import org.springframework.stereotype.Service;

@Service
public class TradeServiceImpl implements TradeService {

    @Resource
    private TradeDAO tradeDAO;
    @Resource
    private SellDAO sellDAO;

    /** [지원] 판매자 구매요청리스트 
	 * 해당 판매음식에 대한 구매요청 리스트 조회 
     */
    @Override
    public List<TradeVO> getSellerTradeListByFoodSellNo(String foodSellNo){
    	return tradeDAO.getSellerTradeListByFoodSellNo(foodSellNo);
    }
    
    
    /**[지원] 판매자 거래완료확인
	 * 실제 거래가 완료된 후 거래완료 확인을 한다. 
	 * 판매자가 거래완료 버튼을 누르면 trade 테이블의 해당 trade_no 에 대한 tr_status가 '거래완료'로 변경된다.
	 * 
	 * @param tradeNo
	 */
    @Override
    public void updateTradeStatus(String tradeNo) {
    	tradeDAO.updateTradeStatus(tradeNo);
    }
    
    /**[지원] 판매자 전체 거래내역 조회 
     * 해당 판매자가 거래한 모든 거래내역을 조회한다. 
     * 
     * @param sellerId
     * @return
     */
    @Override
    public List<TradeVO> getAllSellerTradeList(String sellerId){
    	return tradeDAO.getAllSellerTradeList(sellerId);
    }
    
    
    
    
	///////////////////////start윤주////////////////////////////////
	@Override
	public List<TradeVO> getTradeListByMemId(String memId) {
	System.out.println("getTradeListByMemId memId:"+memId);
	return tradeDAO.getTradeListByMemId(memId);
	
	}
	///////////////////////end윤주///////////////////////////////////
}