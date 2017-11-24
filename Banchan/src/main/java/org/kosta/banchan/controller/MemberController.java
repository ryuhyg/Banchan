package org.kosta.banchan.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.banchan.model.service.FoodService;
import org.kosta.banchan.model.service.MemberService;
import org.kosta.banchan.model.vo.AddressVO;
import org.kosta.banchan.model.vo.FoodSellVO;
import org.kosta.banchan.model.vo.FoodVO;
import org.kosta.banchan.model.vo.MemberVO;
import org.kosta.banchan.model.vo.PwQnaVO;
import org.kosta.banchan.model.vo.SellerVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
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
   
   @RequestMapping("deleteMember.do")
   public String deleteMember(String memId) {
	   memberService.deleteMember(memId);
	   return "member/deleteMember_result";
   }
   //////////////////////// END 향걸 /////////////////////////////////////
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
       public String locationServicePage(Model model, Authentication authentication) {
          
          List<SellerVO> list = null;
          
          // 회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
         if( SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) { 
            
            System.out.println("비로그인 상태  위치기반 접속!");
            AddressVO avo = new AddressVO();
            avo.setAddressAPI("경기도 성남시 분당구 삼평동 대왕판교로 660");
            avo.setLatitude(37.4008198);
            avo.setLongitude(127.10651510000002);
            model.addAttribute("addressVO",avo);
         }else {
            System.out.println("로그인 상태");
            MemberVO mvo =(MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            mvo.setAddressVO(memberService.getAddressAPIById(mvo)); 
            //System.out.println("mvo.getAddressVO() : "+mvo.getAddressVO());
            list = memberService.getSameDongSellerListByAddress(mvo.getAddressVO().getAddressAPI());
            model.addAttribute("addressVO",mvo.getAddressVO());
            
         }
         model.addAttribute("list",list);
          return "member/locationServicePage.tiles";   
          
       }
       @RequestMapping("searchLocationByService_unsigned.do")
       public String searchLocationByService(Model model,AddressVO addressVO) {
          System.out.println("searchLocationByService_unsigned!!!");
          System.out.println("addressVO :"+addressVO);
          List<SellerVO> list = null;
             list = memberService.getSameDongSellerListByAddress(addressVO.getAddressAPI());
            System.out.println("************************");
            System.out.println(list);
          model.addAttribute("addressVO",addressVO);
          model.addAttribute("list",list);
          return "member/locationServicePage.tiles";
       }
       
       ////////////// end 위치기반 ///////////
   /////////////////////// end  광태 메서드   ///////////////////////////////
       
   
   
/////////////////////// start  정훈 메서드   ///////////////////////////////
       //이달의 주부 Top3 리스트
       @RequestMapping("selectSellerTop3.do")
       public String selectSellerTop3(Model model) {
          List<SellerVO> list=memberService.selectSellerTop3();
          model.addAttribute("list", list);
          return "home.tiles";
       }
       //회원수정페이지로 -> 판매자, 구매자
       @RequestMapping("editMemberView.do")
       public String editMemberView(Model model, String pwQnaNo, String memId) {
          List<PwQnaVO> pwQnaList = memberService.getAllPwQnAList(); //질문리스트
          AddressVO avo=memberService.findMemberAddressAPIById(memId); //주소찾기
          System.out.println("address:" +avo.getAddressAPI());
          PwQnaVO pvo=memberService.findPwQnaNo(pwQnaNo); //질문찾기
          SellerVO svo=memberService.findMemberTypeById(memId); //회원타입 검색
          //회원 타입 검색해서 판매자와 구매자로 분기
             if(svo!=null) {
            	 model.addAttribute("svo", svo);
            	 model.addAttribute("pvo", pvo);
            	 model.addAttribute("avo", avo);
            	 model.addAttribute("pwQnaList", pwQnaList);
          return "member/editSellerMemberView.tiles"; //판매자 회원수정 페이지로...
             }else {
            	 model.addAttribute("pvo", pvo);
            	 model.addAttribute("avo", avo);
            	 model.addAttribute("pwQnaList", pwQnaList);
          return "member/editBuyerMemberView.tiles"; //구매자 회원수정 페이지로...
             }
       }
       //회원수정-구매자
       @Secured("ROLE_BUYER")
       @RequestMapping(value ="editBuyerMember.do", method = RequestMethod.POST)
       public String editBuyerMember(MemberVO mvo) {
    	   //security 세션정보를 셋팅해줘야 됨.
           MemberVO mvoBuyerMember = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //security 세션 정보(수정전)
                  
           memberService.editBuyerMemberService(mvo); //update
           mvoBuyerMember.setMemName(mvo.getPw()); //mvoBuyerMember에 업데이트 된 값 셋팅 (웹페이지에 갱신된 정보를 표현하기 위함)
           mvoBuyerMember.setMemName(mvo.getMemName()); //안그러면 로그아웃했다가 다시 로그인해야 수정된 정보가 출력됨
           mvoBuyerMember.setBirth(mvo.getBirth());
           mvoBuyerMember.setTel(mvo.getTel());
           mvoBuyerMember.setAddressDe(mvo.getAddressDe());
           mvoBuyerMember.setPwAnswer(mvo.getPwAnswer());
           mvoBuyerMember.setPwQnaNo(mvo.getPwQnaNo());
          
       return "redirect:member/editMember_ok.do";
       }
          
      //회원수정-판매자
       @Secured("ROLE_SELLER")
      @RequestMapping(value = "editSellerMember.do", method = RequestMethod.POST)
       public String editMember(SellerVO svo, HttpServletRequest request, Model model) {
            uploadPath=request.getSession().getServletContext().getRealPath("/resources/images/");
          File uploadDir=new File(uploadPath);
          if(uploadDir.exists()==false)
             uploadDir.mkdirs();
          MultipartFile file=svo.getUploadImage();//파일 
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
          String imageName=(String)file.getOriginalFilename();
          System.out.println("updateImage:" + imageName);
          if(imageName.equals("null")||imageName.equals("")) {
          MemberVO mvoSellerMember = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	         
    	  memberService.editSellerMemberNoImageService(svo); // 업데이트
    	  mvoSellerMember.setMemName(svo.getPw());
    	  mvoSellerMember.setMemName(svo.getMemName());
    	  mvoSellerMember.setBirth(svo.getBirth());
    	  mvoSellerMember.setTel(svo.getTel());
    	  mvoSellerMember.setAddressDe(svo.getAddressDe());
    	  mvoSellerMember.setPwAnswer(svo.getPwAnswer());
    	  mvoSellerMember.setPwQnaNo(svo.getPwQnaNo());
    	   }else {
          MemberVO mvoSellerMember = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
          
          svo.setSellerImg(file.getOriginalFilename()); //이미지 업데이트 
          memberService.editSellerMemberService(svo); // 업데이트
          mvoSellerMember.setMemName(svo.getPw());
          mvoSellerMember.setMemName(svo.getMemName());
          mvoSellerMember.setBirth(svo.getBirth());
          mvoSellerMember.setTel(svo.getTel());
          mvoSellerMember.setAddressDe(svo.getAddressDe());
          mvoSellerMember.setPwAnswer(svo.getPwAnswer());
          mvoSellerMember.setPwQnaNo(svo.getPwQnaNo());
          
      }
          return "redirect:member/editMember_ok.do";
       }

          
          
        //수정세션..  
  		/*System.out.println("Spring Security 세션 수정 전 회원정보:" + pvo);		
  		memberService.updateMember(memberVO);//service에서 변경될 비밀번호를 암호화한다 
  		// 수정한 회원정보로 Spring Security 세션 회원정보를 업데이트한다
  		pvo.setPassword(memberVO.getPassword());
  		pvo.setName(memberVO.getName());
  		pvo.setAddress(memberVO.getAddress());
  		System.out.println("Spring Security 세션 수정 후 회원정보:" + pvo);*/
        
  		
  		
       
       
       
       
       
/*       //비밀번호 질문 받아오기
       @RequestMapping("findPwQnaNo.do")
       public String findPwQnaNo(String pwQnaNo, Model model) {
          System.out.println("memberController:" + pwQnaNo);
          
         return "member/editMemberView.tiles";*/
       
       //회원수정완료
/////////////////////// end  정훈 메서드   ///////////////////////////////
       
////////////////////start 우정 메서드 ////////////////////////////
   
       @RequestMapping("sellerPageInfo.do")
       public String seller_myPage(Model model, String memId) {
          SellerVO svo = memberService.selectSellerInfo(memId);
          List<FoodVO> flist = foodeService.getFoodListByMemId(memId);
          List<FoodSellVO> fslist = foodeService.getFoodSellInfoByMemId(memId);
          model.addAttribute("svo", svo);
          model.addAttribute("flist", flist);
          model.addAttribute("fslist", fslist);
          return "member/seller_myPage.tiles";
       }
////////////////////end 우정 메서드 ////////////////////////////
       
/////////////////////// start  윤주 메서드   ///////////////////////////////
//판매자 등록 폼(이미 판매자로 등록되어있으면 sellerRegisterForm_fail.jsp로 alert띄움)
@RequestMapping("sellerRegisterForm.do")
public String sellerRegisterForm(String id) {
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
	//개발시 경로
	uploadPath="C://Users/kosta/git/Banchan/Banchan/src/main/webapp/resources/images/";
	//uploadPath=request.getSession().getServletContext().getRealPath("/resources/images/");
	File uploadDir=new File(uploadPath);
	if(uploadDir.exists()==false)
	   uploadDir.mkdirs();
	MultipartFile file=svo.getUploadImage();//파일 
	//System.out.println(file+"<==");
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
   Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   List<GrantedAuthority> updatedAuthorities = new ArrayList<>(auth.getAuthorities());
   updatedAuthorities.add(new SimpleGrantedAuthority("ROLE_SELLER"));                                                       
   Authentication newAuth = new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials(),
            updatedAuthorities);
   SecurityContextHolder.getContext().setAuthentication(newAuth);
   return "member/sellerRegister_ok.tiles";
}
/////////////////////// end  윤주 메서드   ///////////////////////////////
}