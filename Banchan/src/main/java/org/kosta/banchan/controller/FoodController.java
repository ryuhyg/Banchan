package org.kosta.banchan.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.banchan.model.service.FoodService;

import org.kosta.banchan.model.service.MemberService;
import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.MemberVO;

import org.kosta.banchan.model.vo.FoodSellVO;

import org.springframework.stereotype.Controller;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
    //주문버튼 누르면 보여지는 주문확인페이지
    @RequestMapping("orderFoodForm.do")
    public ModelAndView orderFoodForm(HttpServletRequest request) {
    	//String foodSellNo;=101010 /food_sell table
    	//String foodNo = 1001 /food table
    	String foodNo = "1001"; //임의의 세팅값입니다.
    	FoodVO fvo = foodService.getFoodInfoByFoodNo(foodNo);
    	String memId = request.getParameter("memId");
    	String memName = memberService.getSellerNameByMemId(memId);
    	MemberVO mvo = new MemberVO(memId,memName);
    	int trQuantity = Integer.parseInt(request.getParameter("trQuantity"));
    	int price = Integer.parseInt(request.getParameter("price"));
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("mvo",mvo);
    	mv.addObject("fvo",fvo);
    	mv.addObject("trQuantity",trQuantity);
    	mv.addObject("totalPrice",trQuantity*price);
    	mv.setViewName("food/orderFoodForm.tiles");
    	return mv;
    }
    @RequestMapping("foodSellDetailForTest_YoonJoo.do")
    public String foodSellDetailForTest_YoonJoo() {
    	return "food/foodSellDetailForTest_YoonJoo.tiles";
    }
    @Transactional
    @RequestMapping("orderFood.do")
    public String orderFood() {
    	/*
    	 * 
 		  private String trNo;
    private int trQuantity;
    private String trReqDate;
    private String trFinDate;
    private String memId;
    private String trStatusNo;   
    private FoodSellVO foodSellVO;
    	 */
    	
    	return "";
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