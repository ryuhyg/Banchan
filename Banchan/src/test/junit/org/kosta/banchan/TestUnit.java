package org.kosta.banchan;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.banchan.model.dao.SellerDAO;
import org.kosta.banchan.model.vo.AddressVO;
import org.kosta.banchan.model.vo.MemberVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= 
{"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class TestUnit {
	@Resource
	private SellerDAO sellerDAO;
	@Test
	public void unitTest() {
		System.out.println(sellerDAO.selectSellerInfo("java2"));
		
		
		/*MemberVO mvo = new MemberVO();
		mvo.setAddressVO(new AddressVO());
		mvo.getAddressVO().setAddressAPI("경기도 성남시 분당구 삼평동 대왕판교로 67777602");
		mvo.getAddressVO().setLatitude(444);
		mvo.getAddressVO().setLongitude(1442.11);
		System.out.println(mvo);
		dao.registerNewAddressInfo(mvo)*/
	}
}
