package org.kosta.banchan.model.service;



import javax.annotation.Resource;

import org.kosta.banchan.model.dao.FoodDAO;
import org.kosta.banchan.model.dao.SellDAO;
import org.kosta.banchan.model.vo.FoodVO;
import org.springframework.stereotype.Service;

@Service
public class FoodServiceImpl implements FoodService {

   @Resource
    private FoodDAO foodDAO;
   @Resource
    private SellDAO sellDAO;
  
///////////////////start윤주/////////////////////////
@Override
public FoodVO getFoodInfoByFoodNo(String foodNo) {
	return foodDAO.getFoodInfoByFoodNo(foodNo);
}
///////////////////end윤주/////////////////////////
}