<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
파일 업로드 결과 화면 <br><br>
<c:forEach items="${requestScope.nameList}" var="fileName">
	<a href="fileDownload.do?fileName=${fileName}">${fileName}</a>
</c:forEach>