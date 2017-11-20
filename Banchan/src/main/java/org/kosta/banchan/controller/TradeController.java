package org.kosta.banchan.controller;

import javax.annotation.Resource;

import org.kosta.banchan.model.service.FeedbackService;
import org.kosta.banchan.model.service.TradeService;
import org.springframework.stereotype.Controller;

@Controller
public class TradeController {
	
	@Resource
    private TradeService tradeService;
	@Resource
    private FeedbackService feedbackService;



}