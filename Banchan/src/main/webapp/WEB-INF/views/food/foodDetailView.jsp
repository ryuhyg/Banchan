<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="recent-list" class="agency" style="margin-top: 350px">
	<h2>FoodDetail 상세 페이지 입니다.</h2>
	<img alt="등록한이미지" src="resources/images/${food.foodMainImg}" width="300px" height="200px"><hr>
	이미지명 ${food.foodName}
	<br>
	주부님 ${food.sellerVO.memName}<br>
	음식상세정보 ${food.foodDe}<br>
	별점 ${food.foodScore}
	
	
</section>