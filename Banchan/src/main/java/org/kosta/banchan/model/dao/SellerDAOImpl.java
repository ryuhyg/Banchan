package org.kosta.banchan.model.dao;

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

}