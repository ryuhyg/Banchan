
package org.kosta.banchan.model.dao;


import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.vo.AddressVO;
import org.kosta.banchan.model.vo.Authority;
import org.kosta.banchan.model.vo.MemberVO;
import org.kosta.banchan.model.vo.PwQnaVO;
import org.kosta.banchan.model.vo.SellerVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Resource
    private SqlSessionTemplate template;
    
	@Override
    public List<MemberVO> selectMember() {
        return template.selectList("member.selectMember");
    }
	
	   @Override
		public MemberVO findMemberById(String id) {
			return template.selectOne("member.findMemberById",id);
		}
		@Override
		public int idcheck(String id) {
			return template.selectOne("member.idcheck",id);				
		}
		/*
		 * Security에서 인증시 사용
		 */
		@Override					     
		public List<Authority> selectAuthorityByMemId(String memId) {
			return template.selectList("member.selectAuthorityByMemId", memId);
		}
		/*
		 * Security를 위해 권한부여를 위해  사용
		 */
		@Override	
		public void registerRole(Authority authority){
			template.insert("member.registerRole",authority);
		}

/////////////////////// start  광태 메서드   ///////////////////////////////	
	//광태 ajax id check
		@Override
		public int checkIdOnAjax(String id) {
			return template.selectOne("member.checkIdOnAjax",id);				
		}
		
		//광태 비밀번호 찾기 질문 리스트
		@Override
		public List<PwQnaVO> getAllPwQnAList(){
			return template.selectList("member.getAllPwQnAList");
		}
		
		//광태 주소타입 존재 체크
		@Override 
		public String checkAddressNoByAddressAPI(MemberVO memberVO) {
			
			return template.selectOne("member.checkAddressNoByAddressAPI", memberVO);
		}
		
		//광태 새로운 주소지 등록
		@Override
		public void registerNewAddressInfo(AddressVO addressVO) {
			//System.out.println("전 :" +memberVO);
			template.insert("member.registerNewAddressInfo", addressVO);
			//System.out.println("후 :" +memberVO);
		}
		
		//광태 회원 등록
		@Override
		public void registerMember(MemberVO memberVO) {
			template.insert("member.registerMember", memberVO);
		}
		
		//광태 회원가입시 권한 등록
		@Override
		public void registerMemberBasicAuth(MemberVO memberVO) {
			template.insert("member.registerMemberBasicAuth",memberVO);
		}
		
	/////////// start 위치기반 추천 메서드 ////////////////////
		
		//회원 아이디로 addressNo 정보 받기 
		public String findMemberAddressnoById(MemberVO memberVO) {
			return template.selectOne("member.findMemberAddressnoById", memberVO);
		}
		@Override
		public List<SellerVO> getAllSameAddressSellerListByAddress(String addressNo){
			return template.selectList("member.getAllSameAddressSellerListByAddress", addressNo);
		}
	/////////// end 위치기반 추천 메서드 ////////////////////   
/////////////////////// end  광태 메서드   ///////////////////////////////
	

}