package org.kosta.banchan.model.service;

import javax.annotation.Resource;

import org.kosta.banchan.model.dao.AnswerDAO;
import org.kosta.banchan.model.dao.QuestionDAO;
import org.kosta.banchan.model.dao.ReviewDAO;
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
////////////////start윤주/////////////////////////
	@Transactional
	@Override
	public void reviewRegister(ReviewVO rvo,String memId) {
		reviewDAO.reviewRegister(rvo);
		reviewDAO.updateSellerScore(memId);
	}
//////////////////end윤주///////////////////////////
}