package org.kosta.banchan.model.service;

import java.util.List;

import org.kosta.banchan.model.vo.AnswerVO;
import org.kosta.banchan.model.vo.ListVO;
import org.kosta.banchan.model.vo.ReviewVO;

public interface FeedbackService {
	///////////// start윤주////////////////
	//후기
	void reviewRegister(ReviewVO rvo, String memId);
	ListVO<ReviewVO> getReviewListByFoodSellNo(String foodSellNo,String pageNo);
	//답변
	void answerRegister(AnswerVO avo);
	AnswerVO findAnswerByAnsNo(String ansNo);
	List<AnswerVO> getAllAnswerListByQuestNo(String questNo);

	/////////////// end윤주/////////////////
	
	///////////// start정훈////////////////
	
	///////////// end정훈////////////////

}