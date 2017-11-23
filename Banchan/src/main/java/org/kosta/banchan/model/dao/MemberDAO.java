package org.kosta.banchan.model.dao;

import java.util.List;

import org.kosta.banchan.model.vo.AddressVO;
import org.kosta.banchan.model.vo.Authority;
import org.kosta.banchan.model.vo.MemberVO;
import org.kosta.banchan.model.vo.PwQnaVO;
import org.kosta.banchan.model.vo.SellerVO;

public interface MemberDAO {

	List<MemberVO> selectMember();


	MemberVO findMemberById(String id);

	int idcheck(String id);

	void registerRole(Authority authority);

	List<Authority> selectAuthorityByMemId(String memId);



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
		// 같은 번지 주소 판매자 리스트
		List<SellerVO> getAllSameAddressSellerListByAddress(String addressNo);
		// 동 주소 판매자 리스틑
		List<SellerVO> getSameDongSellerListByAddress(String addressAPI);
/////////////////////// end  광태 메서드   ///////////////////////////////	
/////////////////////// start  윤주 메서드   ///////////////////////////////
int isSeller(String memId);

void insertAuth(Authority authority);

void sellerRegister(SellerVO svo);

String getSellerNameByMemId(String memId);
/////////////////////// end  윤주 메서드   ///////////////////////////////


		


//회원정보수정(정훈)
		void getEditMembers(SellerVO vo);

//질문찾아오기(정훈)
		PwQnaVO findPwQnaNo(String pwQnaNo);

//회원정보수정-구매자(정훈)
		void editMemberBuyer(MemberVO memberVO);

//회원정보수정-판매자(정훈)
		void editMemberSeller(MemberVO memberVO);

//업데이트용 주소타입 존재 체크(정훈)
		String checkAddressNoByAddressAPIByUpdate(MemberVO memberVO);

//업데이트용 새로운 주소지 등록(정훈)
		void registerNewAddressInfoByUpdate(AddressVO addressVO);

//회원이 구매자인지 판매자 인지 판별(정훈)
		SellerVO findMemberTypeById(String memId);

//회원이 구매자인지 판매자 인지 판별(정훈)
		void editMemberSellerInfoAndImage(SellerVO vo);

//주소정보 들고오기(정훈)
		AddressVO findMemberAddressAPIById(String memId);


		


	
}