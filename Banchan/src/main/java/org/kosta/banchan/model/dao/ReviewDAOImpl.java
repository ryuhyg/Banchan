package org.kosta.banchan.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.vo.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Resource
	private SqlSessionTemplate template;

	/////////////// start윤주//////////////////////////
	@Override
	public void reviewRegister(ReviewVO rvo) {
		template.insert("feedback.reviewRegister", rvo);
	}

	@Override
	public void updateSellerScore(String memId) {
		template.update("feedback.updateSellerScore", memId);
	}
	@Override
	public List<ReviewVO> getReviewListByFoodSellNo(HashMap<String, Integer> paramMap) {
		return template.selectList("feedback.getReviewListByFoodSellNo", paramMap);

	}
	@Override
	public int getAllReviewCountByFoodSellNo(String foodSellNo) {
		return template.selectOne("feedback.getAllReviewCountByFoodSellNo",foodSellNo);
	}
	//////////////// end윤주///////////////////////////

}