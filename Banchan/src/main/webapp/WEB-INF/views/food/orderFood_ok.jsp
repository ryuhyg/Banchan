<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <sec:authentication var="mvo" property="principal" />
<section id="recent-list" style="margin-top: 350px;">
	<div class="container">
	<h3>주문이 완료되었습니다.</h3>
	<a href="home.do">홈으로</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="myTradeList.do?memId=${mvo.memId }">구매내역보기</a>
	</div>
</section>