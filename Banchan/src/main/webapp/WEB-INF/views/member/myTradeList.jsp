<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section id="recent-list" style="margin-top: 350px;">
	<div class="container">
	<h3>[나의 거래 내역]</h3>
<c:forEach items="${tlist }" var="t">
거래번호:${t.trNo}<br>
주문수량:${t.trQuantity}<br>
단위:${t.foodSellVO.unit}<br>
단위당 가격:${t.foodSellVO.price}원<br>
거래신청일자:${t.trReqDate}<br>
거래완료일자:${t.trFinDate}<br>
거래예정일자:${t.foodSellVO.trDate}<br>
주문마감일자:${t.foodSellVO.closeDate}<br>
거래장소:${t.foodSellVO.loc}<br>
총금액:${t.foodSellVO.price*t.trQuantity}원<br>
판매자이름:${t.foodSellVO.sellerVO.memName}<br>
판매자연락처:${t.foodSellVO.sellerVO.tel}<br>
거래상태:${t.trStatus}<br>
<hr>
</c:forEach>
</div>
</section>