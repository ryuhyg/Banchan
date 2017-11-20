package org.kosta.banchan.model.service;

import java.util.List;

import org.kosta.banchan.model.vo.Authority;
import org.kosta.banchan.model.vo.MemberVO;
import org.kosta.banchan.model.vo.PwQnaVO;

public interface MemberService {

	MemberVO findMemberById(String id);

	List<Authority> selectAuthorityByMemId(String memId);
	
/////////////////////// start  광태 메서드   ///////////////////////////////
	// 광태 ajax id check
	String checkIdOnAjax(String id);
	//광태 비밀번호 찾기 질문 리스트
	List<PwQnaVO> getAllPwQnAList();
	// 광태 회원가입 메소드
	void registerMember(MemberVO memberVO);
/////////////////////// end  광태 메서드   ///////////////////////////////

}