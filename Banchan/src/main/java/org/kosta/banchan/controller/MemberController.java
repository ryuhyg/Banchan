package org.kosta.banchan.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.banchan.model.service.MemberService;
import org.kosta.banchan.model.vo.MemberVO;
import org.kosta.banchan.model.vo.PwQnaVO;
import org.kosta.banchan.model.vo.SellerVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	/*
	 *  회원정보수정시 비밀번호 암호화처리를 위한 객체를 주입받는다
	 *  spring-security.xml 에서 bean 설정이 되어 있음 
	 */
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping("loginView.do")
	public String loginView(){
		return "member/loginView.tiles";
	}
	
	@RequestMapping("registerView.do")
	public String registerView() {
		return "member/registerView.tiles";		
	}	
	

	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "member/login_fail";
	}
	
	/////////////////////// start  광태 메서드   ///////////////////////////////
		// 광태 Ajax id check
	    @RequestMapping("checkIdOnAjax.do")
		@ResponseBody
		public String checkIdOnAjax(String id) {
			return memberService.checkIdOnAjax(id);
		}
	    
	    @RequestMapping("member/registerView.do")
	    public String getAllPwQnAList(Model model) {
	    	
	    	List<PwQnaVO> pwQnaList =
	    						memberService.getAllPwQnAList();
	    	
	    	//request에 set해서 비밀번호 찾기 질문 리스트를 보냄.
	    	model.addAttribute("pwQnaList", pwQnaList);   	
	    	
	    	return "member/registerView.tiles";
	    }
	    
	    @RequestMapping(value = "registerMember.do", method = RequestMethod.POST)
	    public String registerMember(MemberVO memberVO) {
	    	
	    	//System.out.println("memberVO :"+memberVO);
	    	memberService.registerMember(memberVO);
	    	
	    	return "redirect:member/loginView.do";
	    }
	    
	   ///////////////start 위치기반//////////
	    @RequestMapping("locationServicePage.do")
	    public String locationServicePage(Model model) {
	    	
	    	System.out.println("locationServicePage");
	    	
	    	List<SellerVO> list =
	    			memberService.getAllSameAddressSellerListByAddress("1003");
	    	model.addAttribute("list",list);
	    	return "member/locationServicePage.tiles";
	    }
	    ////////////// end 위치기반 ///////////
	/////////////////////// end  광태 메서드   ///////////////////////////////
	    
	
	
/////////////////////// start  정훈 메서드   ///////////////////////////////
	    @RequestMapping("selectSellerTop3.do")
	    public String selectSellerTop3(Model model) {
	    	
	    	List<SellerVO> list=memberService.selectSellerTop3();
	    	
	    	model.addAttribute("list", list);
	    	return "home.tiles";
	    }
/////////////////////// end  정훈 메서드   ///////////////////////////////
////////////////////start 우정 메서드 ////////////////////////////
	    @RequestMapping("sellerPageInfo.do")
	    public String seller_myPage(Model model,String memId) {
	    	SellerVO svo=memberService.selectSellerInfo(memId);
	    	System.out.println(svo);
	    	model.addAttribute("svo",svo);
	    	return "member/seller_myPage.tiles";
	    }
////////////////////end 우정 메서드 ////////////////////////////
}
