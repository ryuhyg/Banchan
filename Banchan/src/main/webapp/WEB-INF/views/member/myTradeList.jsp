<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style type="text/css">
table, th, td{
	text-align: center;
}

</style>

<section id="recent-list" style="margin-top: 350px;">
<div id="page-container">
	<div class="container">
		<div class="row">
			<h3>[나의 거래 내역]</h3>
			<c:choose>
			<c:when test="${fn:length(tlist)==0}">
				<h4>거래내역이 없습니다.</h4>
			</c:when>
			<c:otherwise>
				<table class="table table-hover"  style="text-align: center;font-size: 12px;">
					<thead>
						<tr class="tr_visible"> 
						<th>거래번호</th>
						<th>음식명</th>
						<th>거래신청날짜</th>
						<th>거래완료날짜</th>
						<th>거래일</th>
						<th>주문마감일</th>
						<th>거래장소</th>
						<th>구매수량</th>
						<th>단위</th>
						<th>단위당 가격</th>
						<th>총 주문가격</th>
						<th>판매자 이름</th>
						<th>판매자 연락처</th>
						<th>거래상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${tlist}" var="t">
			 			<tr>
						<td>${t.trNo}</td>
						<td>${t.foodSellVO.foodName}</td>
						<td>${t.trReqDate}</td>
						<td>${t.trFinDate}</td>
						<td>${t.foodSellVO.trDate}</td>
						<td>${t.foodSellVO.closeDate}</td>
						<td>${t.foodSellVO.loc}</td>
						<td>${t.trQuantity}</td>
						<td>${t.foodSellVO.unit}</td>
						<td>${t.foodSellVO.price}원</td>
						<td>${t.foodSellVO.price*t.trQuantity}원</td>
						<td>${t.foodSellVO.sellerVO.memName}</td>
						<td>${t.foodSellVO.sellerVO.tel}</td>
						<td>${t.trStatus}</td>
						<c:if test="${t.trStatusNo=='2'}">
						<td>
						<a href="${pageContext.request.contextPath}/reviewRegisterForm.do?foodSellNo=${t.foodSellVO.foodSellNo}&foodNo=${t.foodSellVO.foodNo}&memId=${t.foodSellVO.sellerVO.memId}" class="btn btn-default" >후기작성</a>
						</td>
						</c:if>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	</div>
</div>
</section>