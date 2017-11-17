package org.kosta.Banchan.model;

import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	@Override
	public void registerProduct(String name){
		System.out.println(name+" 상품등록!");
	}
}
