package org.kosta.banchan.model.dao;

import java.util.List;

import org.kosta.banchan.model.vo.Authority;
import org.kosta.banchan.model.vo.MemberVO;

public interface MemberDAO {

	List<MemberVO> selectMember();


}