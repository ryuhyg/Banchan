package org.kosta.banchan.model.service;



import javax.annotation.Resource;

import org.kosta.banchan.model.dao.FoodDAO;
import org.kosta.banchan.model.dao.SellDAO;
import org.springframework.stereotype.Service;

@Service
public class FoodServiceImpl implements FoodService {

   @Resource
    private FoodDAO foodDAO;
   @Resource
    private SellDAO sellDAO;



}