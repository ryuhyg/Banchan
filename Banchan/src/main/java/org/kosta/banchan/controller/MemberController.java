package org.kosta.banchan.controller;

import javax.annotation.Resource;

import org.kosta.banchan.model.service.MemberService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("seller_myPage.do")
	public String sellerDetail() {
		return "member/seller_myPage.tiles";
	}

	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "member/login_fail";
	}
	
}
