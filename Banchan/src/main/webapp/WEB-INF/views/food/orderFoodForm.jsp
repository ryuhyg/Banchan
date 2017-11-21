<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="recent-list" style="margin-top: 350px;">
	<div class="container">
	<form action="orderFood.do">
	판매자:<a href="#">${mvo.memName}</a><br><!-- 링크에 판매자 정보 페이지 주소와 mvo.memId를 넣는다. -->
	주문신청일자:
	주문음식:${fvo.foodName}<br>
	음식설명:${fvo.foodDe}<br>
	주문수량:${trQuantity }<br>
	총 주문 금액:${totalPrice }원<br>
	<input type="submit" value="구매하기">
	</form>
	</div>
</section>