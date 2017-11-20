package org.kosta.banchan.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.SellerVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SellerDAOImpl implements SellerDAO {

	@Resource
    private SqlSessionTemplate template;
	
	//우정 seller+member+address 정보 받아오기
	@Override
    public SellerVO selectSellerInfo(String id) {
        return template.selectOne("member.selectSellerInfo",id);
    }

	@Override
	public List<FoodVO> selectFoodInfo(String id) {
		return template.selectList("member.selectFoodInfo",id);
	}
	

}