<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <div class="col-md-1 list-group" style="float:right; margin-left:10px; margin-top: 150px; position: fixed; width: 100px; ">
   		<%--  쿠키:${cookie.test.value} --%>
   		<div class="list-group-item list-group-item-warning" style="size:inherit; ">
   		<p style="font-size: small;">최근 클릭<br> 상품</p>  
		<c:forEach items="${cookie}" var="l">
			<a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=${l.value.name}" style="size:inherit;">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/${l.value.value}" style="width:50px; height:50px;">
			</a> 
		</c:forEach> 
		</div> 
			<%-- <a href="#" class="list-group-item list-group-item-success">${clickList}</a>
			<a href="#" class="list-group-item list-group-item-info">${clickList}</a>
			<a href="#" class="list-group-item list-group-item-warning">Third item</a>
			<a href="#" class="list-group-item list-group-item-danger">Fourth item</a> --%>
   </div>