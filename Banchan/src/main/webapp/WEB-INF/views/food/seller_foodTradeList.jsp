<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<section id="recent-list" class="agency" style="margin-top: 350px">
<c:forEach items="${tradeList}" var="trade">
	${trade.trNo} <br>
	${trade.trQuantity} <br>
</c:forEach>
</section>