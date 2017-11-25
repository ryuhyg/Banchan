<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function () {
		$("#trQuantity").change(function () {
			//구매수량이 준비수량보다 적은지 확인
			var preQuantity=$("#preQuantity").text();
			if(parseInt($(this).val()) > parseInt(preQuantity)){
				alert("준비수량이 부족합니다!");
				$("#trQuantity").val(1); 
			}
			var orderPrice=$(this).val()*$("#price").text();
			$("#orderPrice").text(orderPrice);
		}); //change
	}); //ready
	
	function orderFoodConfirm(){
		var isLogin = $("#checkId").val();
		if(isLogin==null || isLogin==""){
			var flag = confirm("로그인하셔야 구매 가능합니다. 로그인하시겠습니까?");
			if(flag)
				location.href="loginView.do";
			else
				history.go(0);
		}
		else
			return confirm("구매하시겠습니까?");
		return false;
	}
</script>

<sec:authentication var="mvo" property="principal" />
<section id="recent-list" class="agency" style="margin-top: 150px">
<div id="page-container">
	<div class="container">
		<div class="row">
			<h2>판매상세정보</h2>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="agent-box-card grey">
					<div class="image-content">
						<div class="image image-fill">
							<img alt="Image Sample" src="${sellfood.foodMainImg}">
						</div>						
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<h1 class="name">${sellfood.foodName}</h1>
				<div class="row">
				<div class="col-md-11">
				<table class="table">
					<tr>
						<th>음식평점</th>
						<td colspan="3">${sellfood.foodScore}</td>
					</tr>
					<tr>
						<th>예약마감일</th>
						<td>${sellfood.closeDate}</td>
						<th>거래일</th>
						<td>${sellfood.trDate}</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><span id="price">${sellfood.price}</span> 원</td>
						<th>양(개당)</th>
						<td>${sellfood.unit}</td>
					</tr>
					<tr>
						<th>준비수량</th>
						<td><span id="preQuantity">${sellfood.preQuantity}</span>&nbsp;(${sellfood.unit })</td>
						<th>남은수량</th>
						<td><span id="leftQuantity">${leftQuantity}</span>&nbsp;(${sellfood.unit })</td>
					</tr>
					<tr>
						<th>거래장소</th>
						<td colspan="3">${sellfood.loc}</td>
					</tr>
					<tr>
						<th>음식소개</th>
						<td colspan="3">${sellfood.foodDe}</td>
					</tr>
					<tr>
						<th>판매추가정보</th>
						<td colspan="3">${sellfood.sellDetail}</td>
					</tr>						
				</table>
				</div> <!-- col-md-10 --> 
				</div> <!-- row  -->
				<div class="row col-md-11">
				<hr>
					<form action="${pageContext.request.contextPath}/orderFood.do" onsubmit="return orderFoodConfirm()" >
					<div class="row"> 
					 <div class="col-sm-2" style="text-align: right">구매수량:</div>
					  <div class="col-sm-2">
				        <input type="number" min="1" name="trQuantity" id="trQuantity" class="form-control" style="width: 100px"/>
				      </div>
						<input type="hidden" name="foodSellVO.foodSellNo" value="${sellfood.foodSellNo}" id="foodSellNo"/>
 						<sec:authorize access="hasRole('ROLE_BUYER')"><!--구매자 권한 설정 -->
 						<input type="hidden" name="memId" id="checkId" value="${mvo.memId }">
 						</sec:authorize>
				      	<label class="control-label" for="거래가격">거래가격:
						<span id="orderPrice"></span>
						</label>
				  
					</div> <!-- row -->
 						<div class="row" align="center">
						<input type="submit"  class="btn btn-default" style="margin-top: 20px;"  value="구매하기">
						</div>
					</form>
				</div>
			</div> <!-- col-md-9 -->	
		</div> <!-- row -->
		
	</div> <!-- container  -->
</div> <!-- page-container -->
</section>	<!-- recent-list -->			
