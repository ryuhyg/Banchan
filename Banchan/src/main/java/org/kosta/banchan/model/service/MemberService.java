package org.kosta.banchan.model.service;

import java.util.List;

import org.kosta.banchan.model.vo.Authority;
import org.kosta.banchan.model.vo.MemberVO;

public interface MemberService {

	MemberVO findMemberById(String id);

	List<Authority> selectAuthorityByMemId(String memId);




}