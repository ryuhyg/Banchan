<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!-- datepicker --> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
<script type="text/javascript">
	$(document).ready(function () { 
		$.datepicker.regional['ko'] ={
				showOn: "both",
				buttonImage: "${pageContext.request.contextPath}/resources/images/calendar2.png",
				buttonImageOnly: true,
				buttonText: "날짜를 선택하세요.",
				closeText : '닫기',         
	            prevText : '이전달',         
	            nextText : '다음달',         
	            currentText : '오늘',         
	            monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],         
	            monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],         
	            dayNames : ['일', '월', '화', '수', '목', '금', '토'],         
	            dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],         
	            dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
	            closeText:'취소',
	            dateFormat: "yy-mm-dd",
	            showButtonPanel: true,
	            
	            onClose: function () {
	                if ($(window.event.srcElement).hasClass('ui-datepicker-close')) {
	                    $(this).val('');
	                }
	            }
			};
		
			$.datepicker.setDefaults($.datepicker.regional['ko']); 
			
			$('#closeDate').datepicker({
				minDate: 0,
				onSelect: function(selected) {
					$("#trDate").datepicker("option","minDate",selected);
				}
			});
			
			$('#trDate').datepicker({
				minDate: 0,
				onSelect: function(selected) {
					$("#closeDate").datepicker("option","maxDate",selected);
				}
			});
			
			$("#regForm").submit(function() {
				return confirm("수정하시겠습니까?");
			});
			
			
			
	});//ready 
</script>	 
    
<section id="recent-list" class="agency" style="margin-top: 150px">
<sec:authorize access="hasRole('ROLE_SELLER')"><!-- 오직 판매자 권한 설정 -->
<sec:authentication var="mvo" property="principal" />
<div class="container">
	<div class="row">
		<div class="col-sm-1"><!-- left --></div>
		
		<div class="col-sm-10" >
			<div class="blog-list blog-detail">
		<h3 class="title-form"><i class="icon fa fa-comment" style="margin-right: 5px"></i>판매등록</h3>

 
		<form  class="form-large grey-color" action="${pageContext.request.contextPath}/editFoodSell.do?" method="post"  id="regForm" >
		<sec:csrfInput/><%-- csrf 토큰 --%>
		<div>
		<h4 class="title-form" style="padding-left: 15px; font-weight: bold; padding-top: 8px">${foodSell.foodName }</h4>
		</div>
		<div class="col-xs-6" style="float: left" class="row">
			<img style="padding-top: 15px" width="350px" height="250px" src="${pageContext.request.contextPath}/resources/images/${foodSell.foodMainImg}" > 
		</div>
		<div  class="col-xs-6" style="float:right" class="row">
			<div class="row" >
				<label for="id"> <i class="fa fa-user user" style="margin-right: 5px;"></i>거래일자</label>
				<input type="text"  name="trDate" id="trDate" required="required" class="margin-bottom small-text trDate" value="${foodSell.trDate}" > 
			</div>
			<div class="row">	
				<label for="date"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>마감일자</label>
				<input type="text" name="closeDate" id="closeDate" class="margin-bottom small-text " required="required" value="${foodSell.closeDate}">	
			</div>
			<div class="row">
				<label for="loc"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>거래장소 </label>
				<input type="text"	 name="loc"  id="loc" class="margin-bottom small-text"  required="required" value="${foodSell.loc}">	
			</div>
				<div class="row">
					<div  class="col-xs-4" >
						<label for="price"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>가격 </label>
						<input type="number" name="price"  id="price" min="0" class="margin-bottom form-control"  required="required" value="${foodSell.price}">
						</div>
					<div  class="col-xs-4" >
						<label for="preQuantity"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>준비수량</label>
						<input type="number" name="preQuantity"  id="preQuantity" min="1" class="margin-bottom form-control" required="required" value="${foodSell.preQuantity}">	
					</div>
					<div  class="col-xs-4" >
						<label for="unit"><i class="fa fa-ellipsis-h" style=" margin-right: 5px"></i>수량 당 정보</label>
						<input type="text" name="unit"  id="unit" class="margin-bottom form-control"  required="required" value="${foodSell.unit}" >
					</div>
				</div>
		</div>
		<div class= "row">
	 		<div  class="container-fluid">										
				<label for="sellDetail"><i class="fa fa-ellipsis-h" style="margin-right: 5px;padding-top: 40px"></i>음식 상세정보</label><br>
				<textarea rows="4" class="" cols="52"  style="width: 100%" readonly="readonly">${foodSell.foodDe}</textarea>
			</div>
		</div>				
		<div class="row">
	 		<div  class="container-fluid">										
				<label for="sellDetail"><i class="fa fa-ellipsis-h" style="margin-right: 5px;padding-top: 30px"></i>판매 추가 상세정보</label><br>
				<textarea rows="10" class="" cols="52" name="sellDetail" style="width: 100%"  required="required">${foodSell.sellDetail}</textarea>
			</div>
		</div>
		<div  class="col-xs-11" ></div>
		<div  class="col-xs-1" style="float: left ;margin-bottom: 100px;" ><input type="submit" id="editButton" class="btn btn-default"  style="float: left ;margin-bottom: 100px;" value="수정하기" ></div>
			<input type="hidden" name="foodSellNo" value="${foodSell.foodSellNo}" id="foodSellNo"/>
			<input type="hidden" name="memId" value="${foodSell.memId}" id="sellerId"/>
		</form>
		</div> 
		</div>
		</div>	
	
		<div class="col-sm-1"><!-- right --></div>
		</div>
</sec:authorize>	
</section> 