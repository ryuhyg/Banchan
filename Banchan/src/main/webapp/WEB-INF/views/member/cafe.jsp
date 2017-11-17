<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<sec:authentication var="mvo" property="principal" />  
 ${mvo.address}에 사는 
 ${mvo.name}님  카페입장 환영!
<br><br>
총 회원수 ${requestScope.count}명 


















