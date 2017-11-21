package org.kosta.banchan.model.dao;
import javax.annotation.Resource;

import org.kosta.banchan.model.vo.FoodSellVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SellDAOImpl implements SellDAO {

	@Resource
    private SqlSessionTemplate template;
	
	
	/** [지원] 판매음식 상세정보 조회
	 * 판매음식의 상세정보를 조회한다. 
	 * 이 때 판매음식 정보 뿐 아니라 등록음식에 대한 정보도 함께 조회한다.
	 * 
	 * @param foodSellNo
	 * @return
	 */
	@Override
	public FoodSellVO getFoodSellDetailByNo(String foodSellNo) {
		return template.selectOne("food.getFoodSellDetailByNo", foodSellNo);
	}
	
	/** [지원] 판매음식등록 
	 * 판매할 음식을 등록한다.
	 * 
	 * @param foodSellVO
	 */
	/*@Override
	public void registerFoodSell(FoodSellVO foodSellVO) {
		template.insert("food.registerFoodSell", foodSellVO);
	}*/
	
	

}