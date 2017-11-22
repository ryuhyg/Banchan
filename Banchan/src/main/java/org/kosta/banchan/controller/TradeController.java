package org.kosta.banchan.controller;

import javax.annotation.Resource;

import org.kosta.banchan.model.service.FeedbackService;
import org.kosta.banchan.model.service.FoodService;
import org.kosta.banchan.model.service.TradeService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TradeController {
	
	@Resource
	private FoodService foodService;
	@Resource
    private TradeService tradeService;
	@Resource
    private FeedbackService feedbackService;

	/** [지원] 판매자-해당 판매상품에 관한 거래요청리스트 조회 
	 * 
	 * @param foodSellNo
	 * @param model
	 * @return
	 */
	@Secured("ROLE_SELLER")
	@RequestMapping("getSellerTradeListByFoodSellNo.do")
	public String getSellerTradeListByFoodSellNo(String foodSellNo, Model model) {
		System.out.println(tradeService.getSellerTradeListByFoodSellNo(foodSellNo));
		model.addAttribute("foodSell", foodService.getFoodSellDetailByNo(foodSellNo));
		model.addAttribute("tradeList", tradeService.getSellerTradeListByFoodSellNo(foodSellNo));
		return "food/seller_foodTradeList.tiles";
	}
}