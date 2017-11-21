package org.kosta.banchan.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.banchan.model.service.FoodService;
import org.kosta.banchan.model.service.MemberService;
import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
}