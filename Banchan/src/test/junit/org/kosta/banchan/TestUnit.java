package org.kosta.banchan;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.banchan.model.dao.FoodDAO;
import org.kosta.banchan.model.dao.MemberDAO;
import org.kosta.banchan.model.dao.SellerDAO;
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
		System.out.println(foodDAO.getFoodListByMemId("java2"));
		//System.out.println(sellerDAO.selectSellerTop3().get(0).getMemName());
		//List<SellerVO> list =mDAO.getAllSameAddressSellerListByAddress("1003");
		//System.out.println(list.get(0).getAddressVO());
		
		

	}
}
