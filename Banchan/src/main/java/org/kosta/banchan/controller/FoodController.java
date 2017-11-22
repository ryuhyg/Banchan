package org.kosta.banchan.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.banchan.model.service.FoodService;
import org.kosta.banchan.model.service.MemberService;
import org.kosta.banchan.model.vo.FoodSellVO;
import org.kosta.banchan.model.vo.TradeVO;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FoodController {

   @Resource
    private FoodService foodService;
   @Resource
   	private MemberService memberService;
   
   // 파일 업로드를 FoodController에서 하실지 FileUploadController에서 하실지..
    private String uploadPath;

    /////////////////////////start 윤주 ////////////////////////////
   
    @Transactional
    @RequestMapping("orderFood.do")
    public String orderFood(HttpServletRequest request) {
    	
    	int trQuantity = Integer.parseInt(request.getParameter("trQuantity"));
    	System.out.println("q:"+trQuantity);
    	String memId = request.getParameter("memId");
    	System.out.println("mid:"+memId);
    	String foodSellNo = request.getParameter("foodSellVO.foodSellNo");
    	System.out.println("fsno:"+foodSellNo);
    	
    	TradeVO tvo = new TradeVO();
    	tvo.setTrQuantity(trQuantity);
    	tvo.setMemId(memId);
    	tvo.setFoodSellVO(new FoodSellVO());
    	tvo.getFoodSellVO().setFoodSellNo(foodSellNo);
    	System.out.println("tvo:"+tvo);
    	foodService.orderFood(tvo);
    	return "food/orderFood_ok.tiles";
    }
    /////////////////////////end 윤주///////////////////////////////////


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