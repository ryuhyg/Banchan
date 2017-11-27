<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.pagination {
    display: inline-block;
    text-align: center;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    font-size: 13px;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>  
  
    
<section id="recent-list" class="agency" style="margin-top: 150px">
<sec:authorize access="hasRole('ROLE_SELLER')"><!-- 오직 판매자 권한 설정 -->
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
					<c:choose>
					<c:when test="${!empty lvo.list}">
					<tr>
						<th>거래번호</th>
						<th>구매자명</th>
						<th>거래수량</th>
						<th>거래신청날짜</th>
						<th>거래상태</th>
					</tr>
					<c:forEach items="${lvo.list}" var="trade">
					<tr>
						<td>${trade.trNo}</td>
						<td>${trade.memId}</td>
						<td>${trade.trQuantity}</td>
						<td>${trade.trReqDate}</td>
						<td>${trade.trStatus}</td>
					</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
					<br>
					<br>
						<div style="font-weight: bold;text-align: center;">판매 상품에 대한 거래 내역이 존재하지 않습니다</div>
					</c:otherwise>
					</c:choose>
				</table>
				<div class="pageginationContainer" style="text-align: center;">
				 <div class="pagination" >
								<c:set var="pb" value="${lvo.pb}"></c:set>
								<c:if test="${pb.previousPageGroup}">	
								<a href="${pageContext.request.contextPath}/getSellerTradeListByFoodSellNo.do?foodSellNo=${foodSell.foodSellNo}
								&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
								</c:if>
								<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
								<c:choose>
								<c:when test="${pb.nowPage!=i}">
								<a href="${pageContext.request.contextPath}/getSellerTradeListByFoodSellNo.do?foodSellNo=${foodSell.foodSellNo}
								&pageNo=${i}">${i}</a>
								</c:when>
								<c:otherwise>
								<a href="#" >${i}</a>
								</c:otherwise>
								</c:choose>
								&nbsp;
								</c:forEach>
								<c:if test="${pb.nextPageGroup}">	
								<a href="${pageContext.request.contextPath}/getSellerTradeListByFoodSellNo.do?foodSellNo=${foodSell.foodSellNo}
								&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
								</c:if>
									 		
				</div> 
				</div>
		</div>
		</div>
		<div class="col-md-2"></div>
	</div> <!-- container  -->
</div> <!-- page-container -->
</sec:authorize> <!-- sec -->
</section>	<!-- recent-list -->			



