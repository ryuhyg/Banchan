<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="recent-list" class="agency" style="margin-top: 350px">
	<img alt="등록한이미지" src="${pageContext.request.contextPath}/resources/images/${food.foodMainImg}" width="300px" height="200px">
	이미지명 ${food.foodName}
	<br>
	주부님 ${food.sellerVO.memName}<br>
	음식상세정보 ${food.foodDe}<br>
	별점 ${food.foodScore}
	
	<div class="container-fluid">
  <div class="row">
    <div class="col-sm-4" style="background-color:lavender;">.col-sm-4</div>
    <div class="col-sm-8" style="background-color:lavenderblush;">.col-sm-8</div>
  </div>
</div>
	
</section>