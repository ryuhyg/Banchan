package org.kosta.banchan.controller;

import javax.annotation.Resource;

import org.kosta.banchan.model.service.FeedbackService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FeedbackController {
	@Resource
    private FeedbackService feedbackService;
	///////////////start윤주////////////////////
	@RequestMapping("reviewFormForTest.do")
	public String reviewForm() {
		return "food/reviewFormForTest.tiles";
	}
	///////////////end윤주//////////////////////
}