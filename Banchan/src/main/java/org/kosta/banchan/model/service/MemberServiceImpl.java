package org.kosta.banchan.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.banchan.model.dao.MemberDAO;
import org.kosta.banchan.model.vo.Authority;
import org.kosta.banchan.model.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

   @Resource
    private MemberDAO memberDAO;


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
}