package org.kosta.banchan.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.vo.FoodVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class FoodDAOImpl implements FoodDAO {

	@Resource
    private SqlSessionTemplate template;

////////////////////start 윤주//////////////////////////
	@Override
	public FoodVO getFoodInfoByFoodNo(String foodNo) {
		return template.selectOne("food.getFoodInfoByFoodNo",foodNo);
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
	@Override
	public List<FoodVO> getFoodListByMemId(String memId) {
		return template.selectList("food.getFoodListByMemId",memId);
	}
	/*@Override
	public int getTotalFoodCountByMemId(String memId) {
		return template.selectOne("getTotalFoodCountByMemId",memId);
	}*/
		
}