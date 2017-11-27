<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <div class="col-md-1 list-group" style="float:right; margin-left:10px; margin-top: 150px; position: fixed; ">
   		
   		<div class="list-group-item list-group-item-warning" style="size:inherit; ">
   		<p style="font-size: small;">최근 클릭<br> 상품</p>  
		<c:forEach items="${clickList}" var="l">
			<a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=${l.foodSellNo}" style="size:inherit;">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/${l.foodMainImg}" style="width:100%; height:100%;">
			</a>
		</c:forEach>
		</div>
			<%-- <a href="#" class="list-group-item list-group-item-success">${clickList}</a>
			<a href="#" class="list-group-item list-group-item-info">${clickList}</a>
			<a href="#" class="list-group-item list-group-item-warning">Third item</a>
			<a href="#" class="list-group-item list-group-item-danger">Fourth item</a> --%>
   </div>