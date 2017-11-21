package org.kosta.banchan.model.dao;

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
}