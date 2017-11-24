package org.kosta.banchan;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.banchan.model.dao.FoodDAO;
import org.kosta.banchan.model.dao.MemberDAO;
import org.kosta.banchan.model.dao.SellerDAO;
import org.kosta.banchan.model.dao.TradeDAO;
import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.PagingBean;
import org.kosta.banchan.model.vo.SellerVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= 
{"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class TestUnit {
	@Resource
	private SellerDAO sellerDAO;
	@Resource
	private FoodDAO foodDAO;
	@Resource
    private BCryptPasswordEncoder passwordEncoder;
	@Resource
	private MemberDAO mDAO;
	@Resource
	private TradeDAO tradeDAO;
	
	
	@Test
	public void unitTest() {
		//System.out.println(sellerDAO.selectSellerInfo("java2"));

		/*MemberVO mvo = new MemberVO();
		mvo.setAddressVO(new AddressVO());
		mvo.getAddressVO().setAddressAPI("경기도 성남시 분당구 삼평동 대왕판교로 67777602");
		mvo.getAddressVO().setLatitude(444);
		mvo.getAddressVO().setLongitude(1442.11);
		System.out.println(mvo);
		dao.registerNewAddressInfo(mvo)*/
		//System.out.println(foodDAO.getFoodListByMemId("java2"));
		//System.out.println(sellerDAO.selectSellerTop3().get(0).getMemName());

		/*List<SellerVO> list =mDAO.getAllSameAddressSellerListByAddress("1003");
		System.out.println(list.get(0).getAddressVO());*/
		
		/*String temp = "서울 강남구 개포동 11-1";
		int lastIndex=  temp.lastIndexOf(" ");
		System.out.println(lastIndex);
		System.out.println(temp.substring(0, temp.lastIndexOf(" ")));*/

//		List<SellerVO> list= 
//		mDAO.getSameDongSellerListByAddress("강남시 ");
//		System.out.println(list);
//
//		//List<SellerVO> list =mDAO.getAllSameAddressSellerListByAddress("1003");
//		//System.out.println(list.get(0).getAddressVO());
//
//		//System.out.println(sellerDAO.selectSellerInfo("java2"));
//		System.out.println(foodDAO.getFoodSellInfoByMemId("java2"));
//
//
//		/*System.out.println(sellerDAO.selectSellerInfo("java2"));*/
//
//		System.out.println(sellerDAO.selectSellerInfo("java2"));
//		System.out.println(mDAO.findPwQnaNo("1"));
//		System.out.println(mDAO.findMemberTypeById("java2"));
		
		/*String no="1033";
		FoodVO vo=foodDAO.getFoodMemInfo(no);
		System.out.println("vo :"+vo);*/
		
		/*String str ="경기 성남시 분당구 안양판교로 1192 (백현동)";
		System.out.println(str.indexOf(" "));
		int first = str.indexOf(" ");
		String temp = str.substring(str.indexOf(" ")+1, str.length());
		System.out.println(temp);
		int second =temp.indexOf(" ");
		System.out.println(first+second);
		String temp2 = str.substring(0, first+second+1);
		System.out.println(temp2);*/
		
		
		int totalCount=tradeDAO.getTradeCountByFoodSellNo("101019");
		System.out.println("totalCount:"+totalCount);
		PagingBean pagingBean=null;
		HashMap<String,Integer> paramMap=new HashMap<String,Integer>();
		
		pagingBean=new PagingBean(totalCount,1);
		System.out.println("PagingBean st:"+pagingBean.getStartRowNumber()+"PagingBean end:"+pagingBean.getEndRowNumber());
		paramMap.put("startRowNumber",pagingBean.getStartRowNumber());
		paramMap.put("endRowNumber", pagingBean.getEndRowNumber());
		paramMap.put("foodSellNo", Integer.parseInt("101019"));
		
		System.out.println(tradeDAO.getSellerTradeListByFoodSellNo(paramMap));
		
	}
}
