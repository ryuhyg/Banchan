package org.kosta.banchan.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.banchan.model.service.FoodService;
import org.kosta.banchan.model.service.MemberService;
import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.MemberVO;
import org.kosta.banchan.model.vo.PwQnaVO;
import org.kosta.banchan.model.vo.SellerVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	@Resource
	private FoodService foodeService;
	
	/*
	 *  회원정보수정시 비밀번호 암호화처리를 위한 객체를 주입받는다
	 *  spring-security.xml 에서 bean 설정이 되어 있음 
	 */
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	/////////////////////////////////////향걸 start////////////////////////////////////
	@RequestMapping("loginView.do")
	public String loginView(){
		return "member/loginView.tiles";
	}
	
	@RequestMapping("registerView.do")
	public String registerView() {
		return "member/registerView.tiles";		
	}	
	

	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "member/login_fail";
	}

	/////////////////////// start  광태 메서드   ///////////////////////////////
		// 광태 Ajax id check
	    @RequestMapping("checkIdOnAjax.do")
		@ResponseBody
		public String checkIdOnAjax(String id) {
			return memberService.checkIdOnAjax(id);
		}
	    
	    @RequestMapping("member/registerView.do")
	    public String getAllPwQnAList(Model model) {
	    	
	    	List<PwQnaVO> pwQnaList =
	    						memberService.getAllPwQnAList();
	    	
	    	//request에 set해서 비밀번호 찾기 질문 리스트를 보냄.
	    	model.addAttribute("pwQnaList", pwQnaList);   	
	    	
	    	return "member/registerView.tiles";
	    }
	    
	    @RequestMapping(value = "registerMember.do", method = RequestMethod.POST)
	    public String registerMember(MemberVO memberVO) {
	    	
	    	//System.out.println("memberVO :"+memberVO);
	    	memberService.registerMember(memberVO);
	    	
	    	return "redirect:member/registerMember_ok.do";
	    }
	    
	   ///////////////start 위치기반//////////
	    @RequestMapping("locationServicePage.do")
	    public String locationServicePage(Model model) {
	    	
	    	System.out.println("locationServicePage");
	    	
	    	List<SellerVO> list =
	    			memberService.getAllSameAddressSellerListByAddress("1003");
	    	model.addAttribute("list",list);
	    	return "member/locationServicePage.tiles";
	    }
	    ////////////// end 위치기반 ///////////
	/////////////////////// end  광태 메서드   ///////////////////////////////
	    
	
	
/////////////////////// start  정훈 메서드   ///////////////////////////////
	    //top3
	    @RequestMapping("selectSellerTop3.do")
	    public String selectSellerTop3(Model model) {
	    	
	    	List<SellerVO> list=memberService.selectSellerTop3();
	    	
	    	model.addAttribute("list", list);
	    	return "home.tiles";
	    }
	    //회원수정페이지로..
	    @RequestMapping("editMemberView.do")
	    public String editMemberView(Model model) {
	    	List<PwQnaVO> pwQnaList =
					memberService.getAllPwQnAList();
	    	//request에 set해서 비밀번호 찾기 질문 리스트를 보냄.
	    	model.addAttribute("pwQnaList", pwQnaList);   	
	    		
	    	return "member/editMemberView.tiles";
	    }
	    //회원수정
	    @RequestMapping(value = "editMember.do", method = RequestMethod.POST)
	    public String editMember(MemberVO memberVO) {
	    
	    	return "redirect:member/editMember_ok.do";
	    }
	    //회원수정완료
/////////////////////// end  정훈 메서드   ///////////////////////////////
////////////////////start 우정 메서드 ////////////////////////////
	    @Secured("ROLE_SELLER")
	    @RequestMapping("sellerPageInfo.do")
	    public String seller_myPage(Model model,String memId) {
	    	SellerVO svo=memberService.selectSellerInfo(memId);
	    	//System.out.println(svo);
	    	List<FoodVO> flist=foodeService.getFoodListByMemId(memId);
	    	model.addAttribute("svo",svo);
	    	model.addAttribute("flist",flist);
	    	return "member/seller_myPage.tiles";
	    }
////////////////////end 우정 메서드 ////////////////////////////
	    
/////////////////////// start  윤주 메서드   ///////////////////////////////
//판매자 등록 폼(이미 판매자로 등록되어있으면 sellerRegisterForm_fail.jsp로 alert띄움)
@RequestMapping("sellerRegisterForm.do")
public String sellerRegisterForm(String id) {
	System.out.println("sellerRegisterform id:"+id);

String memId = id;//로그인 기능 구현되면 세션의 아이디 정보를 가져와서 memId에 할당예정
int sellerCheck = memberService.isSeller(memId);
if(sellerCheck==0)
	return "member/sellerRegisterForm.tiles";
else
	return "member/sellerRegisterForm_fail";
}

private String uploadPath;//프로필사진 업로드 경로
//판매자등록 메서드
@RequestMapping(value = "sellerRegister.do",method = RequestMethod.POST)
public String sellerRegister(String id, SellerVO svo,HttpServletRequest request) {
	System.out.println("sellerRegister id:"+id);
uploadPath=request.getSession().getServletContext().getRealPath("/resources/images/");
File uploadDir=new File(uploadPath);
if(uploadDir.exists()==false)
	uploadDir.mkdirs();
MultipartFile file=svo.getUploadImage();//파일 
System.out.println(file+"<==");
//System.out.println(file.isEmpty()); // 업로드할 파일이 있는 지 확인 
if(file!=null&&file.isEmpty()==false){
	System.out.println("파일명:"+file.getOriginalFilename());
	File uploadFile=new File(uploadPath+file.getOriginalFilename());
	try {
		file.transferTo(uploadFile);//실제 디렉토리로 파일을 저장한다 
		System.out.println(uploadPath+file.getOriginalFilename()+" 파일업로드");
	} catch (IllegalStateException | IOException e) {				
		e.printStackTrace();
	}
}
String memId= id; // 로그인기능 구현되면 세션정보 가져올 예정
svo.setMemId(memId);
svo.setSellerImg(file.getOriginalFilename());
svo.setSellerInfo(request.getParameter("sellerInfo"));
memberService.sellerRegister(svo);
return "redirect:sellerRegister_ok.do";
}
@RequestMapping("sellerRegister_ok.do")
public String sellerRegisterOk() {
return "member/sellerRegister_ok.tiles";
}
/////////////////////// end  윤주 메서드   ///////////////////////////////
}
