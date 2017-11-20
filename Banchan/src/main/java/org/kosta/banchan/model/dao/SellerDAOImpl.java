package org.kosta.banchan.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.vo.SellerVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SellerDAOImpl implements SellerDAO {

	@Resource
    private SqlSessionTemplate template;
	
	@Override
    public SellerVO selectSellerInfo(String id) {
        return template.selectOne("member.selectSellerInfo",id);
    }
	@Override
    public List<SellerVO> selectSellerTop3() {
        
		List<SellerVO> list=template.selectList("member.selectSellerTop3");

        return list;
    }

}