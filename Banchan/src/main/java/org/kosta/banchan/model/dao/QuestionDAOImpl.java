package org.kosta.banchan.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDAOImpl implements QuestionDAO {

   @Resource
    private SqlSessionTemplate template;
//start정훈
  
//end정훈
}