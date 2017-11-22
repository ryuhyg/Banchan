<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	function orderFoodConfirm(){
		if($("#checkId").val()=="" || $("#checkId").val()==null){
			/* var flag = confirm("로그인하셔야 구매가능합니다.로그인 하시겠습니까?");
			if(flag==true){
				alert("로그인하기!");
				location.href="loginView.do";
			}
			else{
				alert("구매안하기!");
				return flag;
			} */
		}
	}
	/* $(document).ready(function () {
		$("#foodSellNo").val($(".sellfood").attr("id"));
		$("#quantity").change(function() {
			$("#orderQuantity").val($(this).val());
		}); //change
		
		$("#orderFoodConfirm").submit(function() {
			return confirm("구매하시겠습니까?");
		}); //submit
	}); //ready */
</script>

<sec:authentication var="mvo" property="principal" />
<section id="recent-list" class="agency" style="margin-top: 350px">
<%-- ${sellfood} --%>
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
							<img alt="Image Sample" src="http://placehold.it/512/bbbbbb/ffffff">
						</div>						
					</div>
				</div>
			</div>
			
			<div class="col-md-9">
				<h1 class="name">${sellfood.foodName}</h1>
				<div class="row">
					<span class="text">
					예약마감일: ${sellfood.closeDate}<br>
					거래일: ${sellfood.trDate }<br>
					거래장소(상세): ${sellfood.loc}<br>
					가격:  ${sellfood.price}<br>
					준비수량:  ${sellfood.preQuantity} 개<br>
					수량당 양 : ${sellfood.unit}<br>
					음식소개:  ${sellfood.foodDe}<br>
					음식평점: ${sellfood.foodScore}<br>
					판매 상세정보: ${sellfood.sellDetail}<br>
					</span>
				</div>
				<div class="row">
				<!-- <hr style="border: 1px solid black"> 
					 <div class="col-md-2 " >
							<label>구매수량</label>
							<input class="form-control" type="number" name="quantity" id="quantity" value="1" />
					</div> -->
					<div class="row">
					<hr style="border: 1px solid black">
						<div class="col-md-2 " >
					<form action="${pageContext.request.contextPath}/orderFood.do" onsubmit="return orderFoodConfirm()" >
						<label>구매수량</label>
						<input type="number" name="trQuantity" id="trQuantity" class="form-control"/>
						<input type="hidden" name="foodSellVO.foodSellNo" value="${sellfood.foodSellNo}" id="foodSellNo"/>
 						<sec:authorize access="hasRole('ROLE_BUYER')"><!--구매자 권한 설정 -->
 						<input type="hidden" name="memId" id="checkId" value="${mvo.memId }">
 						</sec:authorize>
						<input type="submit" class="btn btn-default" value="구매하기">
					</form>
						</div>
					</div>
					
					
					<!-- <div class="col-md-12 space-div" style="text-align: center">			
				<span class="sellfood" id=" ${sellfood.foodSellNo}"></span>
				
				<form action="${pageContext.request.contextPath}/orderFood.do"  id="orderFoodConfirm">
					<input type="hidden" name="foodSellVO.foodSellNo" id="foodSellNo"/>
					<input type="hidden" name="orderQuantity" id="orderQuantity"/>
					<input type="submit" class="btn btn-default" value="구매하기">
				</form>
				
				</div>-->
			
			</div> <!-- col-md-9 -->
		</div> <!-- row -->
	</div> <!-- container  -->
</div> <!-- page-container -->
</section>	<!-- recent-list -->			