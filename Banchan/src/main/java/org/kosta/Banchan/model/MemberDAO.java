package org.kosta.Banchan.model;

import java.util.List;

public interface MemberDAO {

	MemberVO findMemberById(String id);

	List<String> getAddressList();

	List<MemberVO> findMemberListByAddress(String address);	

	int getMemberCount();

	void updateMember(MemberVO vo);

	void registerMember(MemberVO vo);

	int idcheck(String id);

	List<Authority> selectAuthorityByUsername(String username);

	void registerRole(Authority authority);

}