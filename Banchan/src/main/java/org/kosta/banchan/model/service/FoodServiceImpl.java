package org.kosta.banchan.model.service;



import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.dao.FoodDAO;
import org.kosta.banchan.model.dao.SellDAO;
import org.kosta.banchan.model.vo.FoodSellVO;
import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.TradeVO;
import org.springframework.stereotype.Service;

@Service
public class FoodServiceImpl implements FoodService {

   @Resource
    private FoodDAO foodDAO;
   @Resource
    private SellDAO sellDAO;
  
///////////////////start윤주/////////////////////////
	@Override
	public void orderFood(TradeVO tvo) {
		foodDAO.orderFood(tvo);
	}
///////////////////end윤주////////////////////////

   
   /** [지원] 등록음식 상세정보 조회
	 * 선택한 등록음식의 상세정보를 등록음식번호로 조회한다.
	 * 
	 */
	@Override
	public FoodVO getFoodByNo(String foodNo) {
		return foodDAO.getFoodByNo(foodNo);
	}
	
	
	/** [지원] 판매음식상세정보 조회
	 * 판매등록한 판매음식의 상세정보를 조회한다.
	 * 판매음식상세정보 뿐 아니라 등록음식의 정보도 함께 조회한다. 
	 * 
	 */
	@Override
	public FoodSellVO getFoodSellDetailByNo(String foodSellNo) {
		FoodSellVO foodSellVO=sellDAO.getFoodSellDetailByNo(foodSellNo);
		return foodSellVO;
	}


	/** [지원] 판매음식등록
	 * 선택한 등록음식을 판매하기 위해 판매음식등록한다. 
	 * 
	 */
	@Override
	public void registerFoodSell(FoodSellVO foodSellVO) {
		sellDAO.registerFoodSell(foodSellVO);
	}


	/**[우정] 판매자페이지에서 음식리스트 조회
	 * 판매가페이지에서 판매자가 등록한 음식을 조회한다.
	 */
	@Override
	public List<FoodVO> getFoodListByMemId(String memId) {
		//int TotalFoodCount= foodDAO.getTotalFoodCountByMemId(memId);
		return foodDAO.getFoodListByMemId(memId);
	}
	
}