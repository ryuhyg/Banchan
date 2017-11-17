<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%-- 파일업로드 테스트 
		파일업로드 적용시에는 !!!!!!!!!!!!!!!!!반드시!!!!!!!!!!!!!!!!!!!
		http method는 POST 
		enctype="multipart/form-data" 를 명시해야 한다 
		
		ProductVO 의 멤버변수를 확인한다 
		private MultipartFile uploadFile; 
		
		Spring Security post 방식 전송일 때는 아래 태그로 csrf tag를 삽입한다 
		<sec:csrfInput/>
 --%>    
<form action="${pageContext.request.contextPath}/registerProductAction.do" method="post" 
enctype="multipart/form-data">
<sec:csrfInput/>
상품명 <input type="text" name="name"><br>
<%-- file upload를 위해 type을 file로 명시 --%>
상품이미지 <input type="file" name="uploadFile"><br>
<input type="submit" value="등록">
<!-- ProductController -- ProductService
		|
		registerProductResult.jsp     
 -->
</form>






