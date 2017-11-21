<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <sec:authentication var="mvo" property="principal" />
<section id="recent-list" style="margin-top: 350px;">
	<div class="container">
		<form action="sellerRegister.do?id=${mvo.memId}" method="post" enctype="multipart/form-data">
		<sec:csrfInput/>
		프로필사진 업로드
		<input type="file" name="uploadImage">
		판매자 소개 :
		<br>
		<textarea rows="8" cols="100" name="sellerInfo">
		
		</textarea>
		<br>
		<input type="submit" value="등록">
		</form>
	</div>
</section>