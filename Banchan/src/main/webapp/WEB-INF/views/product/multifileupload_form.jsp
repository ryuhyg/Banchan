<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
springmvc fileupload <br><br>
<%-- 파일업로드의 폼은 반드시!!!!! post 전송방식
	   enctype="multipart/form-data" 속성을 부여해야 함
	   
	   Spring Security post 방식 전송일 때는 아래 태그로 csrf tag를 삽입한다 
		<sec:csrfInput/>
 --%>
<form action="${pageContext.request.contextPath}/multi_fileupload.do" enctype="multipart/form-data" method="post">
<sec:csrfInput/>
<input type="text" name="userInfo"><br>
<input type="file" name="file[0]"><br>
<input type="file" name="file[1]"><br>
<input type="file" name="file[2]"><br>
<input type="submit" value="파일업로드"><br>
</form>










