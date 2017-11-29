package org.kosta.banchan.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.banchan.model.service.FeedbackService;
import org.kosta.banchan.model.vo.AnswerVO;
import org.kosta.banchan.model.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FeedbackController {
	@Resource
    private FeedbackService feedbackService;
	///////////////start윤주////////////////////
	@RequestMapping("reviewRegisterForm.do")
	public String reviewRegisterForm(HttpServletRequest request) {
		request.setAttribute("foodSellNo",request.getParameter("foodSellNo"));
		request.setAttribute("foodNo",request.getParameter("foodNo"));
		request.setAttribute("memId",request.getParameter("memId"));
		return "food/reviewForm.tiles";
	}
	@RequestMapping("reviewRegister.do")
	public String reviewRegister(HttpServletRequest request) {
		
		String foodSellNo = request.getParameter("foodSellNo");
		String memId = request.getParameter("memId");//판매자
		String rContent = request.getParameter("rContent");
		int score = Integer.parseInt(request.getParameter("score"));
		String foodNo = request.getParameter("foodNo");
		ReviewVO rvo = new ReviewVO();
		rvo.setScore(score);
		rvo.setRevContent(rContent);
		rvo.setFoodNo(foodNo);
		feedbackService.reviewRegister(rvo, memId);
		return "redirect:reviewRegister_ok.do?foodSellNo="+foodSellNo;
		
	}
	@RequestMapping("reviewRegister_ok.do")
	public String reviewRegisterOk(String foodSellNo,Model model) {
		model.addAttribute("foodSellNo",foodSellNo);
		return "food/reviewRegister_ok.tiles";
	}
	//댓글에 답변달기
	@ResponseBody
	@RequestMapping("answerRegister.do")
	public AnswerVO answerRegisterAjax(String questNo,String memId2,String ansContent){
		AnswerVO avo = new AnswerVO();
		avo.setAnsContent(ansContent);
		avo.setMemId(memId2);
		avo.setQuestNo(questNo);
		feedbackService.answerRegister(avo);
		AnswerVO currAvo = feedbackService.findAnswerByAnsNo(avo.getAnsNo());
		currAvo.setAnsNo(avo.getAnsNo());
		return currAvo;
	}
	
	///////////////end윤주//////////////////////
	
	///////////////start정훈//////////////////////
	//댓글달기
	

	///////////////end정훈//////////////////////

}