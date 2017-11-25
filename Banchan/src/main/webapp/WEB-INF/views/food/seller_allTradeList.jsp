<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
table, th, td{
	text-align: center;
}
tr{
	display: none;
}
.tr_visible {
	display: table-row;
}
</style>

<script type="text/javascript">
	$(document).ready(function () {
		/* 해당 거래내역 클릭시 구매자 상세정보 확인가능 */
		$("#tardeList .tr_visible").click(function() {
			var trade=$(this);
			var buyerId=trade.children().eq(2).text();
			$.ajax({
               type:"get",
               url:"${pageContext.request.contextPath}/getBuyerInfoOnAjax.do",
               data: "id="+buyerId,
               success:function(data){ //data로 서버의 응답정보가 할당 
      			   trade.next().find("#buyerId").text(data.memId);	
      			   trade.next().find("#buyerName").text(data.memName);	
      			   trade.next().find("#buyerTel").text(data.tel);	
      			   trade.next().find("#buyerAddress").text(data.addressVO.addressAPI);	
            	   trade.next().toggle();
               }
            }); //success 
		});
		
		/* 거래완료확인 */
		$("button[name = 'completeTrade']").click(function() {
			if(confirm("거래완료 확인을 하시겠습니까?")==true){
				location.href="${pageContext.request.contextPath}/completeTrade.do?tradeNo="+$(this).val();
			} else{
				return false;
			}
		}); //click
	}); //ready
</script>
    
<section id="recent-list" class="agency" style="margin-top: 350px">
<sec:authorize access="hasRole('ROLE_SELLER')"><!-- 오직 판매자 권한 설정 -->
<sec:authentication var="mvo" property="principal" />
<div id="page-container">
<div class="container">
	<div class="row">
	<h3>전체거래내역</h3>
	<table class="table table-hover" id="tardeList" style="text-align: center;font-size: 12px;" >
		<thead>
			<tr class="tr_visible"> 
				<th>거래번호</th>
				<th>음식명</th>
				<th>구매자아이디</th>
				<th>거래신청날짜</th>
				<th>거래완료날짜</th>
				<th>거래일</th>
				<th>거래장소</th>
				<th>구매수량</th>
				<th>주문가격</th>
				<th colspan="2">거래상태</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach items="${tradeList }" var="trade">
			<tr class="tr_visible" >
				<td>${trade.trNo }</td>
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
				<c:choose>
					<c:when test="${trade.trStatus=='거래완료'}">
						<td colspan="2">거래완료되었습니다.</td>
					</c:when>
					<c:otherwise>
						<td>${trade.trStatus }</td>
						<td><button type="button"  name="completeTrade" value="${trade.trNo }" class="btn btn-default" style="background-color: #cc0000; border: 0px">거래완료</button></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td colspan="2">구매자 아이디: <span id="buyerId"></span> </td>
				<td colspan="2" >구매자 이름: <span id="buyerName"></span></td>
				<td colspan="3">구매자 연락처: <span id="buyerTel"></span></td>
				<td colspan="4">구매자 주소: <span id="buyerAddress"></span></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div> <!-- row -->
</div><!-- container -->
</div> <!-- page-container -->
</sec:authorize> <!-- sec -->
</section>	<!-- recent-list -->			



