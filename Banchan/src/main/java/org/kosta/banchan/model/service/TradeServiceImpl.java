package org.kosta.banchan.model.service;



import javax.annotation.Resource;

import org.kosta.banchan.model.dao.TradeDAO;
import org.springframework.stereotype.Service;

@Service
public class TradeServiceImpl implements TradeService {

    @Resource
    private TradeDAO tradeDAO;


}