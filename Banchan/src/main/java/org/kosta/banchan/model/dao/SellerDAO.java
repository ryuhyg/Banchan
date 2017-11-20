package org.kosta.banchan.model.dao;

import org.kosta.banchan.model.vo.SellerVO;

public interface SellerDAO {

	SellerVO selectSellerInfo(String id);


}