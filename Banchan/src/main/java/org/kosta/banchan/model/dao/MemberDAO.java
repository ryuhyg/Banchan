package org.kosta.banchan.model.dao;

import java.util.List;

import org.kosta.banchan.model.vo.AddressVO;
import org.kosta.banchan.model.vo.MemberVO;
import org.kosta.banchan.model.vo.PwQnaVO;

public interface MemberDAO {

	List<MemberVO> selectMember();

/////////////////////// start  광태 메서드   ///////////////////////////////
		//광태 ajax id check
		int checkIdOnAjax(String id);
		//광태 비밀번호 찾기 질문 리스트
		List<PwQnaVO> getAllPwQnAList();
		//광태 주소타입 존재 체크
		String checkAddressNoByAddressAPI(MemberVO memberVO);
		//광태 새로운 주소지 등록
		void registerNewAddressInfo(AddressVO addressVO);
		//광태 회원 등록
		void registerMember(MemberVO memberVO);
		//광태 회원가입시 권한 등록
		void registerMemberBasicAuth(MemberVO memberVO);
/////////////////////// end  광태 메서드   ///////////////////////////////
}