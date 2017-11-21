package org.kosta.banchan.controller;

import javax.annotation.Resource;

import org.kosta.banchan.model.service.FoodService;
import org.kosta.banchan.model.vo.FoodSellVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FoodController {

   @Resource
    private FoodService foodService;

   
   // 파일 업로드를 FoodController에서 하실지 FileUploadController에서 하실지..
    private String uploadPath;

    @RequestMapping("registerFoodView.do")
    public String registerFoodView() {
    	return "food/register_foodsell_view.tiles";
    }
    
    /** [지원] 판매음식등록
     * 	등록음식 중 판매할 음식을 등록한다. 
     * 
     * @param foodSellVO
     * @return
     */
    @RequestMapping(method=RequestMethod.POST , value="registerFoodSell.do")
    public String registerFoodSell(FoodSellVO foodSellVO) {
    	System.out.println("foodSellVO : "+ foodSellVO);
    	foodService.registerFoodSell(foodSellVO);
    	System.out.println(" 메서드 후 foodSellVO : "+ foodSellVO); //ok 
    	return "redirect:getFoodSellDetail.do?foodSellNo="+foodSellVO.getFoodSellNo();
    }
    
    /** [지원] 판매음식상세정보
     * 판매음식에 대한 상세정보
     * FoodSellVO 와 FoodVO의 정보를 함께 가져온다. 
     * 
     * @param foodSellNo
     * @param model
     * @return
     */
    @RequestMapping("getFoodSellDetail.do")
    public String getFoodSellDetail(String foodSellNo,Model model) {
    	System.out.println("foodSellNo : "+ foodSellNo);
    	System.out.println(foodService.getFoodSellDetailByNo(foodSellNo));
    	
    	model.addAttribute("sellfood", foodService.getFoodSellDetailByNo(foodSellNo));
    	return "food/foodsell_detail.tiles";
    }
    

}