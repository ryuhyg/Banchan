package org.kosta.banchan.controller;

import javax.annotation.Resource;

import org.kosta.banchan.model.service.FoodService;
import org.springframework.stereotype.Controller;

@Controller
public class FoodController {

   @Resource
    private FoodService foodService;

   
   // 파일 업로드를 FoodController에서 하실지 FileUploadController에서 하실지..
    private String uploadPath;


}