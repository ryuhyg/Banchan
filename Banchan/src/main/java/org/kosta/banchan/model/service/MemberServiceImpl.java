package org.kosta.banchan.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.dao.MemberDAO;
import org.kosta.banchan.model.dao.SellerDAO;
import org.kosta.banchan.model.vo.Authority;
import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.MemberVO;
import org.kosta.banchan.model.vo.PwQnaVO;
import org.kosta.banchan.model.vo.SellerVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {

   @Resource
    private MemberDAO memberDAO;
   @Resource
   private SellerDAO sellerDAO; 
   	//광태 비번 암호화 객체 주입
 	@Resource
 	private BCryptPasswordEncoder passwordEncoder;

   @Override
	public MemberVO findMemberById(String id) {
		return memberDAO.findMemberById(id);
	}
   /*
    * 권한 확인
    */
   @Override
	public List<Authority> selectAuthorityByMemId(String id) {
		return memberDAO.selectAuthorityByMemId(id);
	}
   /*
    * 아이디 체크
    */
   @Override
   public int idcheck(String id) {
	   return memberDAO.idcheck(id);
   }
   /////////////////////// start  광태 메서드   ///////////////////////////////
	 //광태  회원가입 ajax id check
	   @Override
		public String checkIdOnAjax(String id) {
			int count = memberDAO.checkIdOnAjax(id);
			return (count == 0) ? "ok" : "fail";
		}
	   
	   //광태 비밀번호 찾기 질문 리스트
	   @Override
	   public List<PwQnaVO> getAllPwQnAList(){
		   return memberDAO.getAllPwQnAList();
	   }
	   
	   //광태 회원가입 메소드
	   @Transactional
	   @Override
	   public void registerMember(MemberVO memberVO) {
		   
		   		// 비밀번호를 bcrypt 알고리즘으로 암호화
				String encodedPwd = passwordEncoder.encode(memberVO.getPw());
				memberVO.setPw(encodedPwd);
				
				// 주소 타입이 존재하는지 확인
				String addressNO= memberDAO.checkAddressNoByAddressAPI(memberVO);
				if(addressNO !=null) {
					//memberVO안에 addressVO의 addressNo에 SET
					memberVO.getAddressVO().setAddressNo(addressNO);
				}
				// 주소 테이블 insert
				else if( addressNO == null) {
					//시퀀스 이용하여 주소테이블에 insert ( 번호, api 주소, 위도,경도) , 
					// registerNewAddressInfo메서드  실행후 memberVO의 addressNo변수에는 insert시의 address_no값이 set 된다.
					memberDAO.registerNewAddressInfo(memberVO.getAddressVO());		
				}
				
				// 멤버 테이블 insert
					// 전화번호 - 제거
					String tempTel= memberVO.getTel();
					memberVO.setTel(tempTel.replaceAll("-", ""));
					memberDAO.registerMember(memberVO);
				// 권한 테이블 insert
					memberDAO.registerMemberBasicAuth(memberVO);
	
	   }
	   /////////// start 위치기반 추천 메서드 ////////////////////
	   
	   public void getAllNearSellerListByAddress() {
		   // 현재 로그인된 회원 아이디로 addressNO get
		   
		   // 멤버 테이블에서 addressNO 같은 회원들 List 로 get 후 return	   
	   }
	   
	   @Override
	   public List<SellerVO> getAllSameAddressSellerListByAddress(String addressNo){
		   return memberDAO.getAllSameAddressSellerListByAddress(addressNo);
	   }
	   
	   @Override
	   public List<SellerVO> getSameDongSellerListByAddress(String addressAPI){
		   String temp = addressAPI.substring(0, addressAPI.lastIndexOf(" "));
			System.out.println("temp : " + temp);
		   return memberDAO.getSameDongSellerListByAddress(temp);
	   }
	   /////////// end 위치기반 추천 메서드 ////////////////////   
   /////////////////////// end  광태 메서드   ///////////////////////////////
	   
////////////////////start 우정 메서드 ////////////////////////////
	  public SellerVO selectSellerInfo(String id) {
		  System.out.println("selectSellerInfo Service");
		  return sellerDAO.selectSellerInfo(id);
	  }
	  public List<FoodVO> selectFoodInfo(String id) {
		  return sellerDAO.selectFoodInfo(id);
	  }
	  
////////////////////start 우정 메서드 ////////////////////////////
	   
	   
	   
/////////////////////// start  정훈 메서드   ///////////////////////////////
	   //정훈 main화면 top3 판매자 리스트 메서드
	   @Override
		public List<SellerVO> selectSellerTop3() {
			List<SellerVO> list = sellerDAO.selectSellerTop3();
			for (int i = 0; i < list.size(); i++) {
				if (!(list.get(i).getSellerInfo().length() < 18)) {
					String str = list.get(i).getSellerInfo().substring(0, 18);
					list.get(i).setSellerInfo(str + "...");
				}
			}
			return list;
		}

/////////////////////// end  정훈 메서드   ///////////////////////////////

/////////////////////// start  윤주 메서드   ///////////////////////////////

@Override
public int isSeller(String memId) {
return memberDAO.isSeller(memId);
}

@Transactional
@Override
public void sellerRegister(SellerVO svo) { //트랜젝션 처리
memberDAO.insertAuth(new Authority(svo.getMemId(),"20"));
memberDAO.sellerRegister(svo);
}
@Override
public String getSellerNameByMemId(String memId) {
	return memberDAO.getSellerNameByMemId(memId);
}
/////////////////////// end  윤주 메서드   ///////////////////////////////
}