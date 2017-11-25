package org.kosta.banchan.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.banchan.model.service.FoodService;
import org.kosta.banchan.model.service.MemberService;
import org.kosta.banchan.model.vo.FoodSellVO;
import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.TradeVO;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
    	String memId = request.getParameter("memId");
    	String foodSellNo = request.getParameter("foodSellVO.foodSellNo");
    	
    	TradeVO tvo = new TradeVO();
    	tvo.setTrQuantity(trQuantity);
    	tvo.setMemId(memId);
    	tvo.setFoodSellVO(new FoodSellVO());
    	tvo.getFoodSellVO().setFoodSellNo(foodSellNo);
    	foodService.orderFood(tvo);
    	return "redirect:orderFood_ok.do";
    }
    @RequestMapping("orderFood_ok.do")
    public String orderFoodOk() {
    	return "food/orderFood_ok.tiles";
    }
    /////////////////////////end 윤주///////////////////////////////////


    @RequestMapping("registerFoodView.do")
    public String registerFoodView(String foodNo,Model model) {
    	FoodVO fvo=foodService.getFoodByNo(foodNo);
    	System.out.println("이거야!!"+fvo.getFoodMainImg());
    	model.addAttribute("fvo",fvo);
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
    	//System.out.println("foodSellVO : "+ foodSellVO);
    	foodService.registerFoodSell(foodSellVO);
    	//System.out.println(" 메서드 후 foodSellVO : "+ foodSellVO); //ok 
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
    	//System.out.println("foodSellNo : "+ foodSellNo);
    	//System.out.println(foodService.getFoodSellDetailByNo(foodSellNo));
    	model.addAttribute("leftQuantity",foodService.getLeftQuantityByFoodSellNo(foodSellNo));
    	model.addAttribute("sellfood", foodService.getFoodSellDetailByNo(foodSellNo));
    	return "food/foodsell_detail.tiles";
    }
    
    
    ///////////////////// 영민 start ///////////////////////////////////
    @RequestMapping("foodRegisterForm.do")
    public String foodRegisterForm(Model model) {
    	List<Map<String, String>> list=foodService.allCategorySelect();
    	System.out.println("list :" + list);
    	
    	model.addAttribute("category", list);
    	return "food/foodRegister.tiles";
    }
    @RequestMapping(value = "foodRegister.do",method = RequestMethod.POST)
    public String foodRegister(String id,FoodVO fvo,HttpServletRequest request) {
    	System.out.println("foodRegister fvo:"+fvo);
    	
    /* 테스트 경로 */	
    uploadPath="C://Users/kosta/git/Banchan/Banchan/src/main/webapp/resources/images/";
    /* 서버 경로 */
   // uploadPath=request.getSession().getServletContext().getRealPath("/resources/images/");
    
    File uploadDir=new File(uploadPath);
    if(uploadDir.exists()==false)
    	uploadDir.mkdirs();
    MultipartFile file=fvo.getUploadImage();//파일 
    System.out.println("File명이 뭐니? :"+file.toString());
    //System.out.println(file.isEmpty()); // 업로드할 파일이 있는 지 확인 
    if(file!=null&&file.isEmpty()==false){
    	//System.out.println("파일명:"+file.getOriginalFilename());
    	File uploadFile=new File(uploadPath+file.getOriginalFilename());
    	try {
    		file.transferTo(uploadFile);//실제 디렉토리로 파일을 저장한다 
    		System.out.println("-------------------------------------------");
    		System.out.println(uploadPath+file.getOriginalFilename()+" 파일업로드");
    		System.out.println("-------------------------------------------");
    	} catch (IllegalStateException | IOException e) {				
    		e.printStackTrace();
    	}
    }
   // String memId=""; // 로그인기능 구현되면 세션정보 가져올 예정
   
    fvo.setMemId(id);
    //fvo.setFoodScore(score);
    fvo.setFoodName(request.getParameter("foodname"));
    fvo.setFoodMainImg(file.getOriginalFilename());
    fvo.setFoodDe(request.getParameter("foodInfo"));
    fvo.setCategoryNo(request.getParameter("category"));
    System.out.println("카테고리 no:"+request.getParameter("category"));
    System.out.println("fvo2:"+fvo);
    foodService.foodRegister(fvo);
    
    return "redirect:foodRegister_ok.do?memId="+id;	
    }
    @RequestMapping("foodRegister_ok.do")
    public String foodRegister_ok(String memId,Model model) {
    	model.addAttribute("memId",memId);
    	return "food/foodRegister_ok.tiles";
    }
    
    @RequestMapping("foodDetailView.do")
    public String foodDetailView(String foodNo, Model model) {
    	System.out.println("음식번호 테스트:"+foodNo);
    	FoodVO food=foodService.getFoodMemInfo(foodNo);
    	System.out.println("food결과 :"+food);
    	model.addAttribute("food", food);
    	
    	return "food/foodDetailView.tiles";
    }
    
    @RequestMapping("deleteRegFood.do")
    public String deleteRegFood(String foodNo, Model model) {
    	String message="";
    	List<FoodVO> food=foodService.selectRegFoodByNo(foodNo);
    	System.out.println("Select foodIdResult :"+food);
    	if(food.size()==0) {
    		foodService.deleteRegFood(foodNo);
    		model.addAttribute("message", "ok");
    	}else {
    		model.addAttribute("message", "fail");
    	}
    	return "food/deleteRegFood_result.tiles";
    }
    @RequestMapping("updateRegViewFood.do")
    public String updateRegViewFood(String foodNo, Model model) {
    	System.out.println("수정하기 전 foodNo:" + foodNo);
    	String message="";
    	List<FoodVO> foodlist=foodService.selectRegFoodByNo(foodNo);
    	if(foodlist.size()==0) {
    		
    		List<Map<String, String>> list=foodService.allCategorySelect();
        	model.addAttribute("category", list);
        	FoodVO beforeFood=foodService.getFoodMemInfo(foodNo);
        	System.out.println("수정하기 전 food :"+beforeFood);
        	
        	model.addAttribute("foodNo", foodNo);
        	model.addAttribute("beFood", beforeFood);
        	
        	model.addAttribute("message", "ok");
        	return "food/foodRegister.tiles";
    		
    	}else {
    		model.addAttribute("message", "fail");
    		return "food/deleteRegFood_result.tiles";
    	}
    }
    @RequestMapping(value = "updateRegFood.do",method = RequestMethod.POST)
    public String updateRegFood(String id, FoodVO fvo, HttpServletRequest request) {
    	System.out.println("수정하려는 fvo 값:"+fvo);
    	System.out.println("받은 아이디 값 : "+id);
    	
    	System.out.println("이미지정보 확인하자"+request.getParameter("beforeFoodImg"));
    	/* 테스트 경로 */	
        uploadPath="C://Users/kosta/git/Banchan/Banchan/src/main/webapp/resources/images/";
        /* 서버 경로 */
        //uploadPath=request.getSession().getServletContext().getRealPath("/resources/images/");
        File uploadDir=new File(uploadPath);
        if(uploadDir.exists()==false)
        	uploadDir.mkdirs();
        MultipartFile file=fvo.getUploadImage();//파일 
        System.out.println(file+"<==");
        //System.out.println(file.isEmpty()); // 업로드할 파일이 있는 지 확인 
        if(file!=null&&file.isEmpty()==false){
        	System.out.println("파일명:"+file.getOriginalFilename());
        	File uploadFile=new File(uploadPath+file.getOriginalFilename());
        	try {
        		file.transferTo(uploadFile);//실제 디렉토리로 파일을 저장한다 
        		System.out.println("-------------------------------------------");
        		System.out.println(uploadPath+file.getOriginalFilename()+" 파일업로드");
        		System.out.println("-------------------------------------------");
        	} catch (IllegalStateException | IOException e) {				
        		e.printStackTrace();
        	}
        }
        String foodImage=(String)file.getOriginalFilename();
        System.out.println("updateImage:" + foodImage);
        if(foodImage.equals("null")||foodImage.equals("")) {
        	System.out.println("이미지를 안줬을 경우 처리하는 부분");
        	fvo.setMemId(id);
            //fvo.setFoodScore(score);
            fvo.setFoodNo(request.getParameter("foodNo"));
            fvo.setFoodName(request.getParameter("foodname"));
            fvo.setFoodDe(request.getParameter("foodInfo"));
            fvo.setCategoryNo(request.getParameter("category"));
            System.out.println("fvo2:"+fvo);
            foodService.noimgUpdateRegFood(fvo);
            return "redirect:updateRegFoodOk.do";
        }else {
	        fvo.setMemId(id);
	        //fvo.setFoodScore(score);
	        fvo.setFoodNo(request.getParameter("foodNo"));
	        fvo.setFoodName(request.getParameter("foodname"));
	        fvo.setFoodMainImg(file.getOriginalFilename());
	        fvo.setFoodDe(request.getParameter("foodInfo"));
	        fvo.setCategoryNo(request.getParameter("category"));
	        System.out.println("fvo2:"+fvo);
	        foodService.imgUpdateRegFood(fvo);
	        
	        return "redirect:updateRegFoodOk.do";	
	        }
    }
    @RequestMapping("updateRegFoodOk.do")
    public String updateRegFoodOk() {
    	return "food/updateRegFood_ok.tiles";
    }
//////////////////////////영민 end//////////////////////////////////////
}
