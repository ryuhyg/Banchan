package org.kosta.banchan;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.banchan.model.dao.SellerDAO;
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
		System.out.println(sellerDAO.selectSellerTop3().get(0).getMemName());
	}
}
