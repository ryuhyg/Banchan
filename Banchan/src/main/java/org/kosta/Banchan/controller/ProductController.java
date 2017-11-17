package org.kosta.Banchan.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.Banchan.model.ProductService;
import org.kosta.Banchan.model.ProductVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	@Resource
	private ProductService productService;	
	/**.
	 * 상품등록화면을 제공하는 메서드 
	 * @return
	 */
	/*@RequestMapping("product_register.do")
	public String registerProductView(){
		return "product_registerProduct";
	}*/
	/**
	 * 업로드 경로 
	 */
	private String uploadPath;
	/**
	 * 파일 업로드 구현 
	 * @param name
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping(value = "registerProductAction.do", 
			method = RequestMethod.POST)
	public ModelAndView registerProductAction(ProductVO productVO,HttpServletRequest request){
		uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");
		File uploadDir=new File(uploadPath);
		if(uploadDir.exists()==false)
			uploadDir.mkdirs();
		System.out.println(productVO.getName());
		MultipartFile file=productVO.getUploadFile();//파일 
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
		productService.registerProduct(productVO.getName());
		ModelAndView mv=new ModelAndView();
		mv.setViewName("product/registerProductResult.tiles");
		mv.addObject("fileName", file.getOriginalFilename());		
		return mv;
	}
	@Secured("ROLE_MEMBER")
	//파일 다운로드를 위한 메서드 
	@RequestMapping("fileDownload.do")
	public String fileDownload(String fileName){
		return "downloadView";
	}
}




















