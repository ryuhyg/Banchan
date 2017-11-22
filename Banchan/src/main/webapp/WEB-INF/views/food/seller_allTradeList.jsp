<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

    
<section id="recent-list" class="agency" style="margin-top: 350px">
<sec:authorize access="hasRole('ROLE_SELLER')"><!-- 오직 판매자 권한 설정 -->
<sec:authentication var="mvo" property="principal" />
<div id="page-container">
<div class="container">
	<div class="row">
	<h3>전체거래내역</h3>
	<table class="table table-hover" style="text-align: center">
		<tr>
			<th>거래번호</th>
			<th>음식사진</th>
			<th>음식명</th>
			<th>구매자아이디</th>
			<th>거래신청날짜</th>
			<th>거래완료날짜</th>
			<th>거래일</th>
			<th>거래장소</th>
			<th>구매수량</th>
			<th>주문가격</th>
			<th>거래상태</th>
		</tr>
		<c:forEach items="${tradeList }" var="trade">
		<tr>
			<td>${trade.trNo }</td>
			<td>${trade.foodSellVO.foodMainImg }</td>
			<td>${trade.foodSellVO.foodName}</td>
			<td>${trade.memId }</td>
			<td>${trade.trReqDate }</td>
			<td>${trade.trFinDate }</td>
			<td>${trade.foodSellVO.trDate }</td>
			<td>${trade.foodSellVO.loc }</td>
			<td id="quantity">${trade.trQuantity }
			<input type="hidden" value="${trade.foodSellVO.price}" id="price">
			</td>
			<td id="orderPrice">${trade.trQuantity * trade.foodSellVO.price} </td>
			<td>${trade.trStatus }</td>
		</tr>
		</c:forEach>
	</table>
	</div> <!-- row -->
</div><!-- container -->
</div> <!-- page-container -->
</sec:authorize> <!-- sec -->
</section>	<!-- recent-list -->			



