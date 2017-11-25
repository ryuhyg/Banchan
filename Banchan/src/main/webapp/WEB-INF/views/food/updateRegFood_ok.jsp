<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
		#array { text-align:center; }
</style>
<sec:authentication var="mvo" property="principal" />
<section id="recent-list" style="margin-top: 350px;">
	<div class="container" id="array">
		<h2>음식등록이 수정되었습니다.</h2>
		<a href="home.do">홈으로</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/sellerPageInfo.do?memId=${mvo.memId}">판매자 마이페이지로</a>
	</div>
</section>