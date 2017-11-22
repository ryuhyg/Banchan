<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authentication var="mvo" property="principal" />
<script>
function getimagereview(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            $target.html('<img src="' + e.target.result + '" alt="" width="200" height="150"/>');
        }
        reader.readAsDataURL(html.files[0]);
    }
}
</script>
<section id="recent-list" style="margin-top: 350px;">
	<div class="container-fluid">
		<form action="foodRegister.do" method="post" enctype="multipart/form-data">
		<sec:csrfInput/>
			<input type="text" name="foodname"> <br>
			<input type="hidden" name="id" value="${mvo.memId}">
			<select name="category">
			<c:forEach items="${category}" var="categorylist">
				<option value="${categorylist.CATEGORY_NO }">${categorylist.CATEGORY_NAME}</option>
			</c:forEach>
			</select>
			<hr>
			<div class="row">
				<div class="col-sm-3">
					<input type="file" name="uploadImage"  id="cma_file" accept="image/*" onchange="getimagereview(this,$('#cma_image'))" />
					<!-- <input type="file" name="uploadImage"> -->
					<br>
					  <div id="cma_image" style="width:10;max-width:10;/* border:1px solid #000; */display:none;"></div>
				</div>
				<div class="col-sm-6">
					<textarea rows="6" cols="60" name="foodInfo" placeholder="내용을 입력하세요"></textarea>
				</div>
				<div class="col-sm-3">
				</div>
			</div>
			<input type="submit" value="등록" >
		</form>
	</div>
</section>
