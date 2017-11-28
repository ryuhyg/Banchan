package org.kosta.banchan.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.banchan.model.service.FeedbackService;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FoodController {

	@Resource
	private FoodService foodService;
	@Resource
	private MemberService memberService;
	@Resource
	private FeedbackService feedbackService;
	// 파일 업로드를 FoodController에서 하실지 FileUploadController에서 하실지..
	private String uploadPath;


	///////////////////////// start 윤주 ////////////////////////////

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
	///////////////////////// end 윤주///////////////////////////////////

	///////////////////////// start 우정///////////////////////////////////
	@RequestMapping("registerFoodView.do")
	public String registerFoodView(String foodNo, Model model) {
		FoodVO fvo = foodService.getFoodByNo(foodNo);
		model.addAttribute("fvo", fvo);
		return "food/register_foodsell_view.tiles";
	}
	@RequestMapping("deleteConfirmAjax.do")
	@ResponseBody
	public int deleteConfirmAjax(String foodSellNo) {
		return foodService.deleteConfirmAjax(foodSellNo);
	}

	@RequestMapping("deleteFoodSell.do")
	public String deleteFoodSell(String foodSellNo,String sellerId, Model model) {
		foodService.deleteFoodSell(foodSellNo);
		return "redirect:sellerPageInfo.do?memId="+sellerId+"&pageNo=1";
	}
	///////////////////////// end 우정///////////////////////////////////

	///////////////////////// start 지원///////////////////////////////////

	/**
	 * [지원] 판매음식등록 등록음식 중 판매할 음식을 등록한다.
	 * 
	 * @param foodSellVO
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST, value = "registerFoodSell.do")
	public String registerFoodSell(FoodSellVO foodSellVO) {
		// System.out.println("foodSellVO : "+ foodSellVO);
		foodService.registerFoodSell(foodSellVO);
		// System.out.println(" 메서드 후 foodSellVO : "+ foodSellVO); //ok
		return "redirect:getFoodSellDetail.do?foodSellNo=" + foodSellVO.getFoodSellNo();
	}

	/**
	 * [지원] 판매음식상세정보 판매음식에 대한 상세정보 FoodSellVO 와 FoodVO의 정보를 함께 가져온다.
	 * 
	 * @param foodSellNo
	 * @param model
	 * @return
	 */
	@RequestMapping("getFoodSellDetail.do")
	public String getFoodSellDetail(String foodSellNo, Model model,String pageNo, HttpServletRequest req, HttpServletResponse resp) {
		// 윤주
		model.addAttribute("rlist", feedbackService.getReviewListByFoodSellNo(foodSellNo,pageNo));
		model.addAttribute("leftQuantity", foodService.getLeftQuantityByFoodSellNo(foodSellNo));
		model.addAttribute("foodSell", foodService.getFoodSellDetailByNo(foodSellNo));
		
		///// Start 최근 클릭 리스트 코드 추가 광태
		System.out.println("cookie*********");
		Cookie[] cookie= req.getCookies();
		boolean checkDupl=false;
		for (int i = 0; i < cookie.length; i++) {
			//System.out.println("--- "+cookie[i].getName()+" : "+cookie[i].getValue());
			if(cookie[i].getName().equals(foodSellNo)) {
				checkDupl=true;
				break; // 클릭한 상품이 이미 있으면 탈출
			}
		}
		
		if(checkDupl) {
			System.out.println("이미 추가된 상품!");
		}else {
			System.out.println(cookie.length);
			if(cookie.length>4) { // 최근클릭 4개 상품만 유지
				Cookie kc =  new Cookie(cookie[0].getName(),null);
				kc.setMaxAge(0);
				//System.out.println("******222***ddd****");
			    resp.addCookie(kc);
			   // System.out.println("*********ddd****");
			}
			FoodSellVO fvo =foodService.getFoodSellDetailByNo(foodSellNo);
			Cookie c =  new Cookie(foodSellNo,fvo.getFoodMainImg());
			c.setComment(foodSellNo);
			c.setMaxAge(60*60*24);
			resp.addCookie(c);
		}	
		for (int i = 0; i < cookie.length; i++) {
			System.out.println("--- "+cookie[i].getName()+" : "+cookie[i].getValue());
		}
	
		///// End최근 클릭 리스트 코드 추가 광태
		return "food/foodsell_detail.tiles";
	}
	
	@RequestMapping("editFoodSellView.do") 
	public String editFoodSellView(String foodSellNo,Model model) {
		model.addAttribute("foodSell",foodService.getFoodSellDetailByNo(foodSellNo));
		return "food/editFoodSellView.tiles";
	}
	
	@RequestMapping(value="editFoodSell.do", method=RequestMethod.POST)
	public String editFoodSell(FoodSellVO foodSellVO) {
		foodService.editFoodSell(foodSellVO);
		return "redirect:editFoodSellOk.do?foodSellNo=" + foodSellVO.getFoodSellNo();
	}
	
	@RequestMapping("editFoodSellOk.do")
	public String editFoodSellOk(String foodSellNo,Model model) {
		model.addAttribute("foodSellNo", foodSellNo);
		return "food/editFoodSell_ok.tiles";
	}
	
	
	
	
	///////////////////// end 지원 ///////////////////////////////////
	
	
	///////////////////// 영민 start ///////////////////////////////////
	@RequestMapping("foodRegisterForm.do")
	public String foodRegisterForm(Model model) {
		List<Map<String, String>> list = foodService.allCategorySelect();
		System.out.println("list :" + list);

		model.addAttribute("category", list);
		return "food/foodRegister.tiles";
	}

	@RequestMapping(value = "foodRegister.do", method = RequestMethod.POST)
	public String foodRegister(String id, FoodVO fvo, HttpServletRequest request) {
		System.out.println("foodRegister fvo:" + fvo);

		/* 테스트 경로 */
		uploadPath = "C://Users/kosta/git/Banchan/Banchan/src/main/webapp/resources/images/";
		/* 서버 경로 */
		// uploadPath=request.getSession().getServletContext().getRealPath("/resources/images/");

		File uploadDir = new File(uploadPath);
		if (uploadDir.exists() == false)
			uploadDir.mkdirs();
		MultipartFile file = fvo.getUploadImage();// 파일
		System.out.println("File명이 뭐니? :" + file.toString());
		// System.out.println(file.isEmpty()); // 업로드할 파일이 있는 지 확인
		if (file != null && file.isEmpty() == false) {
			// System.out.println("파일명:"+file.getOriginalFilename());
			File uploadFile = new File(uploadPath + file.getOriginalFilename());
			
			try {
				file.transferTo(uploadFile);// 실제 디렉토리로 파일을 저장한다
				System.out.println("-------------------------------------------");
				System.out.println(uploadPath + file.getOriginalFilename() + " 파일업로드");
				System.out.println("-------------------------------------------");
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		// String memId=""; // 로그인기능 구현되면 세션정보 가져올 예정

		fvo.setMemId(id);
		// fvo.setFoodScore(score);
		fvo.setFoodName(request.getParameter("foodname"));
		fvo.setFoodMainImg(file.getOriginalFilename());
		fvo.setFoodDe(request.getParameter("foodInfo"));
		fvo.setCategoryNo(request.getParameter("category"));
		System.out.println("카테고리 no:" + request.getParameter("category"));
		System.out.println("fvo2:" + fvo);
		foodService.foodRegister(fvo);

		return "redirect:foodRegister_ok.do?memId=" + id;
	}

	@RequestMapping("foodRegister_ok.do")
	public String foodRegister_ok(String memId, Model model) {
		model.addAttribute("memId", memId);
		return "food/foodRegister_ok.tiles";
	}

	@RequestMapping("foodDetailView.do")
	public String foodDetailView(String foodNo, String pageNo, Model model) {
		FoodVO food = foodService.getFoodMemInfo(foodNo);
		model.addAttribute("food", food);
		
		// 지원 후기 리스트 추가
		model.addAttribute("rlist", feedbackService.getReviewListByFoodNo(foodNo, pageNo));
		
		return "food/foodDetailView.tiles";
	}

	@RequestMapping("deleteRegFood.do")
	public String deleteRegFood(String foodNo, Model model, String memId) {
		System.out.println("삭제하기 전의 memId 확인 :" + memId);
		String message = "";
		List<FoodVO> food = foodService.selectRegFoodByNo(foodNo);
		System.out.println("Select foodIdResult :" + food);
		if (food.size() == 0) {
			// foodService.deleteRegFood(foodNo);
			model.addAttribute("message", "ok");
			model.addAttribute("foodNo", foodNo);
			model.addAttribute("memId", memId);
		} else {
			model.addAttribute("message", "fail");
			model.addAttribute("foodNo", foodNo);
			model.addAttribute("memId", memId);
		}
		return "food/deleteRegFood_result.tiles";
	}

	@RequestMapping("deleteRegFoodResult.do")
	public String deleteRegFoodResult(String foodNo, String memId) {
		foodService.deleteRegFood(foodNo);
		System.out.println("memId 확인 :" + memId);
		return "redirect:sellerPageInfo.do?memId=" + memId;
	}

	@RequestMapping("updateRegViewFood.do")
	public String updateRegViewFood(String foodNo, Model model, String memId) {
		System.out.println("수정하기 전 foodNo:" + foodNo);
		String message = "";
		List<FoodVO> foodlist = foodService.selectRegFoodByNo(foodNo);
		if (foodlist.size() == 0) {

			List<Map<String, String>> list = foodService.allCategorySelect();
			model.addAttribute("category", list);
			FoodVO beforeFood = foodService.getFoodMemInfo(foodNo);
			System.out.println("수정하기 전 food :" + beforeFood);

			model.addAttribute("foodNo", foodNo);
			model.addAttribute("memId", memId);
			model.addAttribute("beFood", beforeFood);

			model.addAttribute("message", "ok");
			return "food/foodRegister.tiles";

		} else {
			model.addAttribute("message", "fail");
			model.addAttribute("memId", memId);
			return "food/deleteRegFood_result.tiles";
		}
	}

	@RequestMapping(value = "updateRegFood.do", method = RequestMethod.POST)
	public String updateRegFood(String memId, FoodVO fvo, HttpServletRequest request, Model model) {
		System.out.println("수정하려는 fvo 값:" + fvo);
		System.out.println("받은 아이디 값 : " + memId);

		System.out.println("이미지정보 확인하자" + request.getParameter("beforeFoodImg"));
		/* 테스트 경로 */
		uploadPath = "C://Users/kosta/git/Banchan/Banchan/src/main/webapp/resources/images/";
		/* 서버 경로 */
		// uploadPath=request.getSession().getServletContext().getRealPath("/resources/images/");
		File uploadDir = new File(uploadPath);
		if (uploadDir.exists() == false)
			uploadDir.mkdirs();
		MultipartFile file = fvo.getUploadImage();// 파일
		System.out.println(file + "<==");
		// System.out.println(file.isEmpty()); // 업로드할 파일이 있는 지 확인
		if (file != null && file.isEmpty() == false) {
			System.out.println("파일명:" + file.getOriginalFilename());
			File uploadFile = new File(uploadPath + file.getOriginalFilename());
			try {
				file.transferTo(uploadFile);// 실제 디렉토리로 파일을 저장한다
				System.out.println("-------------------------------------------");
				System.out.println(uploadPath + file.getOriginalFilename() + " 파일업로드");
				System.out.println("-------------------------------------------");
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		String foodImage = (String) file.getOriginalFilename();
		System.out.println("updateImage:" + foodImage);
		if (foodImage.equals("null") || foodImage.equals("")) {
			System.out.println("이미지를 안줬을 경우 처리하는 부분");
			fvo.setMemId(memId);
			// fvo.setFoodScore(score);
			fvo.setFoodNo(request.getParameter("foodNo"));
			fvo.setFoodName(request.getParameter("foodname"));
			fvo.setFoodDe(request.getParameter("foodInfo"));
			fvo.setCategoryNo(request.getParameter("category"));
			System.out.println("fvo2:" + fvo);
			foodService.noimgUpdateRegFood(fvo);
			System.out.println("아이디 멀로 들어오니?"+memId);
			
			return "redirect:updateRegFoodOk.do?memId="+ memId;
		} else {
			fvo.setMemId(memId);
			// fvo.setFoodScore(score);
			fvo.setFoodNo(request.getParameter("foodNo"));
			fvo.setFoodName(request.getParameter("foodname"));
			fvo.setFoodMainImg(file.getOriginalFilename());
			fvo.setFoodDe(request.getParameter("foodInfo"));
			fvo.setCategoryNo(request.getParameter("category"));
			System.out.println("fvo2:" + fvo);
			foodService.imgUpdateRegFood(fvo);
			
			System.out.println("아이디 멀로 들어오니?"+memId);
			return "redirect:updateRegFoodOk.do?memId="+memId;
		}
	}

	@RequestMapping("updateRegFoodOk.do")
	public String updateRegFoodOk(String memId, Model model) {
		System.out.println("여긴 아이디가 뭐니? :"+memId);
		model.addAttribute("memId", memId);
		
		return "food/updateRegFood_ok.tiles";
	}
	////////////////////////// 영민 end//////////////////////////////////////
}
