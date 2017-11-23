<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authentication var="mvo" property="principal" />

<script>
function getimagereview(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            $target.html('<img src="' + e.target.result + '" alt="" style="width:350px; height:200px;"/>');
        }
        reader.readAsDataURL(html.files[0]);
    }
}
</script>
<section id="recent-list" style="margin-top: 350px;">
	<div class="container">
		<div class="row">
			<div class="col-sm-1">
				<!-- left -->
			</div>

			<div class="col-sm-10">
				<div class="blog-list blog-detail">
					<form class="form-large grey-color" action="foodRegister.do" method="post" enctype="multipart/form-data">
					<h3 class="title-form">
						<i class="icon fa fa-comment" style="margin-right: 5px"></i><input type="text" name="foodname"></h3>
						<input type="hidden" name="id" value="${mvo.memId}">
						<sec:csrfInput/>
						<%-- csrf 토큰 --%>
						<div class="row">
							
						<div class="col-xs-5" style="float: left" class="row">
						<select name="category">
								<c:forEach items="${category}" var="categorylist">
								<option value="${categorylist.CATEGORY_NO }">${categorylist.CATEGORY_NAME}</option>
								</c:forEach>
						</select>
						<div style="margin-top: 10px;">
							<input type="file" name="uploadImage"  id="cma_file" accept="image/*" onchange="getimagereview(this,$('#cma_image'))" />
							 <div id="cma_image" style="display:none;"></div>
						</div>
						</div>
						<div class="col-xs-7" style="float: right" class="row">
							<textarea rows="10" cols="52" name="foodInfo" style="width: 100%; height: 100%;"  placeholder="내용을 입력하세요"></textarea>
							<input type="submit" value="등록" >	
						</div>
						</div>
						</form>
				</div>
			</div>
		</div>

		<div class="col-sm-1">
			<!-- right -->
		</div>
	</div>

</section>
