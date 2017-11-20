
package org.kosta.banchan.model.dao;


import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.vo.MemberVO;
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

}