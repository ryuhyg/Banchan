<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <sec:authentication var="mvo" property="principal" />
<script type="text/javascript">
function getimagereview(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
       		//$target.css('display', '');
	        $target.html('<img src="' + e.target.result + '" alt="" style="width:350px; height:200px;"/>');
        }
        reader.readAsDataURL(html.files[0]);
    }
}
</script>
<section id="recent-list" style="margin-top: 150px;">
	<div class="container">
		<div class="col-sm-10">
			<div class="blog-list blog-detail">
				<form class="form-large grey-color" action="sellerRegister.do?id=${mvo.memId}" method="post" enctype="multipart/form-data">
				<sec:csrfInput/>
				<div style="margin-top: 10px;">
				프로필사진 업로드
				<div id="cma_image"></div>
				<input type="file" name="uploadImage" id="cma_file" accept="image/*" onchange="getimagereview(this,$('#cma_image'))" >
				</div>
				<div style="margin-top: 10px;">
				판매자 소개 :
				<br>
				<textarea rows="8" cols="100" name="sellerInfo">
				</textarea>
				</div>
				<div align="right" style="margin-right: 41px;">
				<input type="submit" value="등록">
				</div>
				</form>
			</div>
		</div>
	</div>
</section>