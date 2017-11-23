<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<section id="recent-list" style="margin-top: 350px">
	<div class="container">
		<div class="row">
			<div class="col-sm-1">
				<!-- left -->
			</div>

			<div class="col-sm-10">
				<div class="blog-list blog-detail">
					<h3 class="title-form">
						<i class="icon fa fa-comment" style="margin-right: 5px"></i>${food.foodName}</h3>

					<form class="form-large grey-color">
						<sec:csrfInput />
						<%-- csrf 토큰 --%>
						<div class="row">
						<div class="col-xs-6" style="float: left" class="row">
							<img style="padding-top: 30px" width="350px" height="250px" src="${pageContext.request.contextPath}/resources/images/${food.foodMainImg}">
						</div>
						<div class="col-xs-6" style="float: right" class="row">
							<label for="id"> <i class="fa fa-user user"
								style="margin-right: 5px"></i>주부님
							</label> 
							<input type="text" name="name" class="margin-bottom form-control" value="${food.sellerVO.memName}" readonly="readonly">
							<label for="date"><i class="fa fa-ellipsis-h"style="margin-right: 5px"></i>별점</label> 
							<input type="text" name="star" class="margin-bottom form-control" value="${food.foodScore}" readonly="readonly"> 
							<div class="row">
						</div>
						</div>
						</div>
						<div class="row">
							<div class="container-fluid" style="margin-top: 10px;">
								<label for="sellDetail"><i class="fa fa-ellipsis-h" style="margin-right: 8px;"></i>음식 상세정보</label><br>
								<textarea rows="4" cols="52" name="sellDetail" style="width: 100%" readonly="readonly">${food.foodDe}</textarea>
							</div>
						</div>
						</form>
				</div>
			</div>
		</div>

		<div class="col-sm-1">
			<!-- right -->
		</div>
	</div>

</section>

</section>