package org.kosta.banchan.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.banchan.model.vo.FoodSellVO;
import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.TradeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class FoodDAOImpl implements FoodDAO {

	@Resource
    private SqlSessionTemplate template;

////////////////////start 윤주//////////////////////////

	@Override
	public void orderFood(TradeVO tvo) {
		template.insert("food.orderFood",tvo);
		
	}
//////////////////end 윤주//////////////////////////////

	
	/** [지원] 음식번호로 등록된 음식을 조회하는 메서드
	 * 
	 * @param foodNo
	 * @return
	 */
	@Override
	public FoodVO getFoodByNo(String foodNo) {
		return template.selectOne("food.getFoodByNo", foodNo);
	}
///////////////////start 우정//////////////////////////////
	@Override
	public List<FoodVO> getFoodListByMemId(String memId) {
		return template.selectList("food.getFoodListByMemId",memId);
	}
	
	@Override
	public List<FoodSellVO> getFoodSellInfoByMemId(String memId){
		return template.selectList("getFoodSellInfoByMemId",memId);
	}
///////////////////end 우정//////////////////////////////

	/*@Override
	public int getTotalFoodCountByMemId(String memId) {
		return template.selectOne("getTotalFoodCountByMemId",memId);
	}*/
	/*
	 * 		[영민] 카테고리 받아와서 음식등록 하는 페이지
	 */
	public void foodRegister(FoodVO fvo) {
		template.insert("food.foodRegister", fvo);
	}

	@Override
	public List<Map<String, String>> allCategorySelect() {
		return template.selectList("food.allCategorySelect");
	}
		
}