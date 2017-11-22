<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<section id="recent-list" class="agency" style="margin-top: 350px">
<sec:authorize access="hasRole('ROLE_SELLER')"><!-- 오직 구매자 권한 설정 -->
<sec:authentication var="mvo" property="principal" />
<div id="page-container">
	<div class="container">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="row">
			<h2>${foodSell.foodName} 거래요청내역</h2>
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
				<div class="row form-large grey-color">
					<span class="text">
					예약마감일: ${foodSell.closeDate}<br>
					거래일: ${foodSell.trDate }<br>
					거래장소(상세): ${foodSell.loc}<br>
					가격:  ${foodSell.price}<br>
					준비수량:  ${foodSell.preQuantity} 개<br>
					수량당 양 : ${foodSell.unit}<br>
					음식소개:  ${foodSell.foodDe}<br>
					음식평점: ${foodSell.foodScore}<br>
					판매 상세정보: ${foodSell.sellDetail}<br>
					</span>
				</div>
				<div class="row">
					<hr style="border: 1px solid black">
					
				</div>
			</div> <!-- col-md-9 -->
			
		</div> <!-- row -->
		<div class="row">
				<table class="table table-hover">
					<tr>
						<th>거래번호</th>
						<th>구매자명</th>
						<th>거래수량</th>
						<th>거래신청날짜</th>
						<th>거래상태</th>
					</tr>
					<c:forEach items="${tradeList}" var="trade">
					<tr>
						<td>${trade.trNo}</td>
						<td>${trade.memId}</td>
						<td>${trade.trQuantity}</td>
						<td>${trade.trReqDate}</td>
						<td>${trade.trStatus}</td>
					</tr>
					</c:forEach>
				</table>
		</div>
		</div>
		<div class="col-md-2"></div>
	</div> <!-- container  -->
</div> <!-- page-container -->
</sec:authorize> <!-- sec -->
</section>	<!-- recent-list -->			



