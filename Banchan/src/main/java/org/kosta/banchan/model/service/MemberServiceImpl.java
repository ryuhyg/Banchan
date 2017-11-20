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
		return null;
	}
   @Override
	public List<Authority> selectAuthorityByMemId(String memId) {
		return null;
	}
}