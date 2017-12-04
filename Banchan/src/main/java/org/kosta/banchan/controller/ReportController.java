package org.kosta.banchan.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.service.FoodService;
import org.kosta.banchan.model.service.MemberService;
import org.kosta.banchan.model.service.ReportService;
import org.kosta.banchan.model.vo.FoodSellVO;
import org.kosta.banchan.model.vo.ReportVO;
import org.kosta.banchan.model.vo.SellerVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	@Resource
	private FoodService foodService;
	@Resource
	private MemberService memberService;
	@Resource
	private ReportService reportService;
	
	@RequestMapping("reportmain.do")
	@ResponseBody
	public List<ReportVO> getReport(Model model){
		List<ReportVO> rlist = reportService.getReport();
		System.out.println(rlist);
		model.addAttribute("rlist",rlist);
		return rlist;
	}
	
	@RequestMapping("searchByKeyword.do")
	public ModelAndView SearchByKeyword(String kw) {
		ModelAndView mv = new ModelAndView();
		List<SellerVO> slist=null;
		List<FoodSellVO> fslist = null;
		System.out.println("kw = "+kw);
		if(kw=="" || kw=="null") {
			
		}else {
			slist = memberService.findSellerList(kw);
			fslist = foodService.findFoodSellList(kw);
		}
		System.out.println("keyword ="+kw );
		mv.addObject("keyword",kw);
		System.out.println("slist = "+ slist);
		mv.addObject("slist",slist);
		System.out.println("fslist = "+ fslist);
		mv.addObject("fslist",fslist);
		mv.setViewName("search/search_result.tiles");
		return mv;
	}
	@RequestMapping("foodSearchMore.do")
	public ModelAndView foodSearchMore(String kw) {
		ModelAndView mv = new ModelAndView();
		List<FoodSellVO> fslist = null;
		if(kw=="" || kw=="null") {
			
		}else {
			fslist = foodService.findFoodSellList(kw);
		}
		mv.addObject("keyword",kw);
		mv.addObject("fslist",fslist);
		mv.setViewName("search/foodSearchResult_more.tiles");
		return mv;
	} 
	@RequestMapping("sellerSearchMore.do")
	public ModelAndView sellerSearchMore(String kw) {
		ModelAndView mv = new ModelAndView();
		List<SellerVO> slist=null;
		if(kw=="" || kw=="null") {
			
		}else {
			slist = memberService.findSellerList(kw);
		}
		mv.addObject("keyword",kw);
		mv.addObject("slist",slist);
		mv.setViewName("search/sellerSearchResult_more.tiles");
		return mv;
	} 
	
}
