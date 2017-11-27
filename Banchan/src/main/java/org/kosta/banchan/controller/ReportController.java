package org.kosta.banchan.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.service.ReportService;
import org.kosta.banchan.model.vo.ReportVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {
	@Resource
	private ReportService reportService;
	@RequestMapping("reportmain.do")
	public String getReport(Model model){
		List<ReportVO> rlist = reportService.getReport();
		model.addAttribute("rlist",rlist);
		return "/report/report";
	}
	
}
