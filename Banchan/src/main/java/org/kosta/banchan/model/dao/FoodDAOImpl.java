package org.kosta.banchan.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class FoodDAOImpl implements FoodDAO {

	@Resource
    private SqlSessionTemplate template;

}