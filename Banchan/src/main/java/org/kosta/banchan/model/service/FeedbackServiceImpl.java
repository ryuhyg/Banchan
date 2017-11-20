package org.kosta.banchan.model.service;

import javax.annotation.Resource;

import org.kosta.banchan.model.dao.AnswerDAO;
import org.kosta.banchan.model.dao.QuestionDAO;
import org.kosta.banchan.model.dao.ReviewDAO;
import org.springframework.stereotype.Service;

@Service
public class FeedbackServiceImpl implements FeedbackService {

	@Resource
    private ReviewDAO reviewDAO;

	@Resource
    private QuestionDAO questionDAO;

	@Resource
    private AnswerDAO answerDAO;




}