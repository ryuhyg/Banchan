package org.kosta.banchan.model.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.kosta.banchan.model.dao.AnswerDAO;
import org.kosta.banchan.model.dao.QuestionDAO;
import org.kosta.banchan.model.dao.ReviewDAO;
import org.kosta.banchan.model.vo.ListVO;
import org.kosta.banchan.model.vo.PagingBean;
import org.kosta.banchan.model.vo.ReviewVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FeedbackServiceImpl implements FeedbackService {

	@Resource
	private ReviewDAO reviewDAO;

	@Resource
	private QuestionDAO questionDAO;

	@Resource
	private AnswerDAO answerDAO;

	//////////////// start윤주/////////////////////////
	@Transactional
	@Override
	public void reviewRegister(ReviewVO rvo, String memId) {
		reviewDAO.reviewRegister(rvo);
		reviewDAO.updateSellerScore(memId);
	}
	@Override
	public ListVO<ReviewVO> getReviewListByFoodSellNo(String foodSellNo, String pageNo) {
		int totalCount = reviewDAO.getAllReviewCountByFoodSellNo(foodSellNo);
		PagingBean pagingBean = null;
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		if (pageNo == null)
			pagingBean = new PagingBean(totalCount);
		else
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));

		paramMap.put("startRowNumber", pagingBean.getStartRowNumber());
		paramMap.put("endRowNumber", pagingBean.getEndRowNumber());
		paramMap.put("foodSellNo", Integer.parseInt(foodSellNo));

		// start,end,foodSell no를 저장한 map를 param으로
		ListVO<ReviewVO> lvo = new ListVO<ReviewVO>(reviewDAO.getReviewListByFoodSellNo(paramMap), pagingBean);
		return lvo;
	}
	////////////////// end윤주///////////////////////////
}