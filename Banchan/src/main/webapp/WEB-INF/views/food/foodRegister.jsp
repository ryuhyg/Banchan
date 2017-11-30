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
       		//$target.css('display', '');
	        $target.html('<img src="' + e.target.result + '" alt="" style="width:350px; height:250px;"/>');
        }
        reader.readAsDataURL(html.files[0]);
    }
}
function checkForm(){
	var text;
	var result = confirm("음식을 등록 하시겠습니까?");
	if (result == true) {
	    text = "음식이 등록되었습니다.";
	    alert(text);
	    return true;
	}else{
		text="음식 등록이 취소되었습니다";
		alert(text);
		return false;
	}
}
</script>
<style>
.btn btn-default
{
width: 100px;
position: absolute;
top: 0px;
background-color: #33BB00;
color: #FFFFFF;
border-style: solid;
}
 
.file_input_hidden
{
font-size: 45px;
position: absolute;
right: 0px;
top: 0px;
opacity: 0;
 
filter: alpha(opacity=0);
-ms-filter: "alpha(opacity=0)";
-khtml-opacity: 0;
-moz-opacity: 0;
}

</style>
<section id="recent-list" style="margin-top: 150px;">
<c:choose>
<c:when test="${message!='ok'}">
	<div class="container">
		<div class="row">
			<div class="col-sm-1">
				<!-- left -->
			</div>
			<!--  음식 등록 페이지 -->
			<div class="col-sm-10">
			<h3 class="title-form"><i class="icon fa fa-comment" style="margin-right: 5px"></i>음식등록페이지</h3>
				<div class="blog-list blog-detail">
					<form class="form-large grey-color" action="foodRegister.do" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
					<h2 class="title-form">
						<!-- <i class="icon fa fa-cutlery" style="margin-right: 5px"></i> --><input type="text" name="foodname" placeholder="음식명"  required="required"></h2>
					
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
						<input type="button" value="파일 선택" class="btn btn-default" style="margin-top: 8px" />
						<div style="margin-top: 10px;" class="file_input_div">
							<input type ="file"  class="file_input_hidden" value="파일 업로드" name="uploadImage"  id="cma_file" accept="image/*" onchange="getimagereview(this,$('#cma_image'))"/>
							<div id="cma_image" style="margin-top: 10px;"></div>
							 </div>
						</div>
						<div class="col-xs-7" style="float: right" class="row">
							<textarea rows="10" cols="52" name="foodInfo" style="width: 100%; height: 100%;"  placeholder="내용을 입력하세요"></textarea>
							<input type="submit" class="btn btn-default" value="등록" >	
						</div>
						</div>
						</form>
				</div>
			</div>
		</div>
		</c:when>
<c:otherwise>
	<div class="container">
		<div class="row">
			<div class="col-sm-1">
				<!-- left -->
			</div>
			<!--  등록 음식 수정 페이지 -->
				<div class="col-sm-10">
				<h3 class="title-form"><i class="icon fa fa-comment" style="margin-right: 5px"></i>음식수정페이지</h3>
				<div class="blog-list blog-detail">
					<form class="form-large grey-color" action="updateRegFood.do" method="post" enctype="multipart/form-data">
					<h2 class="title-form"><input type="text" name="foodname" value="${beFood.foodName}"></h2>
						<input type="hidden" name="memId" id="memId" value="${memId}">
						<input type="hidden" name="foodNo" value="${foodNo}">
						<sec:csrfInput/>
						<%-- csrf 토큰 --%>
						<div class="row">
							
						<div class="col-xs-5" style="float: left" class="row">
						<select name="category">
								<c:forEach items="${category}" var="categorylist">
								<c:choose>
								<c:when test="${beFood.categoryNo==categorylist.CATEGORY_NO }">
								<option value="${categorylist.CATEGORY_NO }" selected="selected">${categorylist.CATEGORY_NAME}</option>
								</c:when>
									<c:otherwise>
									<option value="${categorylist.CATEGORY_NO }">${categorylist.CATEGORY_NAME}</option>
									</c:otherwise>
									</c:choose>
								</c:forEach>
						</select>
						<input type="button" value="파일 선택" class="btn btn-default" style="margin-top: 8px" />
						<div style="margin-top: 10px;" class="file_input_div">
							<input type ="file"  class="file_input_hidden" value="파일 업로드" name="uploadImage"  id="cma_file" accept="image/*" onchange="getimagereview(this,$('#cma_image'))"/>
							<div id="cma_image" style="margin-top: 10px;">
								<img src="${pageContext.request.contextPath }/resources/images/${beFood.foodMainImg}" alt="" style="width:350px; height:200px;"/>
							</div>
							 </div>
						</div>
							<div class="col-xs-7" style="float: right" class="row">
							<textarea rows="10" cols="52" name="foodInfo" style="width: 100%; height: 100%;">${beFood.foodDe}</textarea>
							<input type="submit" class="btn btn-default" value="수정" >	
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
</c:otherwise>
</c:choose>
</section>
