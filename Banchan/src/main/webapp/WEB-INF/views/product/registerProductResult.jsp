<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
${param.name} 상품등록되었습니다 
<br><br>
<%-- <img src="${initParam.root}upload/${requestScope.fileName}"> --%>
<a href="${pageContext.request.contextPath}/fileDownload.do?fileName=${fileName}">${fileName}</a>
<img src="${pageContext.request.contextPath}/resources/upload/${fileName}" width="400" height="400">