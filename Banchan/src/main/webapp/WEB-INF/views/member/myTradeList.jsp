<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- <script type="text/javascript">
function reviewRegisterCheck(){
	
	//alert($("input[name=rr]").parent().parent().parent().siblings().children().eq(27).html());
	var scheck = $("input[name=rr]").parent().parent().parent().siblings().children().eq(27).html();
	alert(scheck); 
	alert(scheck=='거래중');
	if(scheck=='거래중'){
		alert("거래중에는 후기를 작성할 수 없습니다");
		return false;
	}else
		return true; 
}
</script> 윤주....실패... -->

<section id="recent-list" style="margin-top: 350px;">
	<div class="container">
	<h3>[나의 거래 내역]</h3>
<c:choose>
<c:when test="${fn:length(tlist)==0}">
<h4>거래내역이 없습니다.</h4>
</c:when>
<c:otherwise>
<c:forEach items="${tlist}" var="t">
<table border="1" style="border-collapse: collapse;">
<tr>
<td>음식명</td>
<td>${t.foodSellVO.foodName}</td>
</tr>
<tr>
<td>거래번호</td>
<td>${t.trNo}</td>
</tr>
<tr>
<td>주문수량</td>
<td>${t.trQuantity}</td>
</tr>
<tr>
<td>단위</td>
<td>${t.foodSellVO.unit}</td>
</tr>
<tr>
<td>단위당 가격</td>
<td>${t.foodSellVO.price}원</td>
</tr>
<tr>
<td>거래신청일자</td>
<td>${t.trReqDate}</td>
</tr>
<tr>
<td>거래완료일자</td>
<td>${t.trFinDate}</td>
</tr>
<tr>
<td>거래예정일자</td>
<td>${t.foodSellVO.trDate}</td>
</tr>
<tr>
<td>주문마감일자</td>
<td>${t.foodSellVO.closeDate}</td>
</tr>
<tr>
<td>거래장소</td>
<td>${t.foodSellVO.loc}</td>
</tr>
<tr>
<td>총금액</td>
<td>${t.foodSellVO.price*t.trQuantity}원</td>
</tr>
<tr>
<td>판매자이름</td>
<td>${t.foodSellVO.sellerVO.memName}</td>
</tr>
<tr>
<td>판매자연락처</td>
<td>${t.foodSellVO.sellerVO.tel}</td>
</tr>
<tr>
<td>거래상태</td>
<td>
${t.trStatus}
<%-- <input type="hidden" name="checkStatus" value="${t.trStatusNo}"> --%>
</td>
</tr>
<c:if test="${t.trStatusNo=='2'}">
<tr>
<td colspan="2" align="center">
<a href="${pageContext.request.contextPath}/reviewRegisterForm.do?foodSellNo=${t.foodSellVO.foodSellNo}&foodNo=${t.foodSellVO.foodNo}&memId=${t.foodSellVO.sellerVO.memId}" onclick="return reviewRegisterCheck()">후기작성</a>
</td>
</tr>
</c:if>
</table>
<hr>
</c:forEach>
</c:otherwise>
</c:choose>
</div>
</section>