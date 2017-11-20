
package org.kosta.banchan.model.dao;


import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.vo.Authority;
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

}