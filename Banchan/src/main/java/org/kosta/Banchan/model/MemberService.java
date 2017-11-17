package org.kosta.Banchan.model;

import java.util.List;

public interface MemberService {
	MemberVO findMemberById(String id);

	List<String> getAddressList();

	List<MemberVO> findMemberListByAddress(String address);

	int getMemberCount();

	void updateMember(MemberVO vo);

	void registerMember(MemberVO vo);

	String idcheck(String id);
	
	List<Authority> selectAuthorityByUsername(String username);
}
