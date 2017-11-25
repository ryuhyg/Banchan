<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authentication var="mvo" property="principal" />
<script type="text/javascript">
	$(document).ready(function(){
		var memId=$("#memId").val();
		var result="${message}";
		if(result=="fail"){
			alert("판매중인 음식이 존재합니다.");
			location.href="${pageContext.request.contextPath}/sellerPageInfo.do?memId="+memId;
		}else{
			alert("선택한 등록음식이 삭제되었습니다.");
			location.href="${pageContext.request.contextPath}/sellerPageInfo.do?memId="+memId;
		}
	});
</script>
<section id="recent-list" style="margin-top: 150px;">
<input type="hidden" id="memId" value="${mvo.memId}">

</section>