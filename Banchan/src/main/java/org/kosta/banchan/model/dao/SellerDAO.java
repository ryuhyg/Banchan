package org.kosta.banchan.model.dao;

import java.util.List;


import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.SellerVO;

public interface SellerDAO {

	SellerVO selectSellerInfo(String id);


	List<FoodVO> selectFoodInfo(String id);
	List<SellerVO> selectSellerTop3();


}