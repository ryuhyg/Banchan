<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
jQuery(document).ready(function(){
    
    var select = $("select#category");
    
    select.change(function(){
    	var select_name = $(this).children("option:selected").val();
        /* var select_name = $(this).children("option:selected").text(); */
        $(this).siblings("label").text(select_name);
        location.href="${pageContext.request.contextPath}/selectCategoryFood.do?category="+select_name+"&pageNo=1";
    });
  });
</script>
<style type="text/css">
#select_box {
    position: relative;
    width: 200px;
    height: 40px;
    background: url(select_arrow.png) 180px center no-repeat; 
    border: 1px solid #E9DDDD;
}
#select_box label {
    position: absolute;
    font-size: 14px;
    color: #a97228;
    top: 13px;
    left: 12px;
    letter-spacing: 1px;
}
#select_box select #category {
    width: 100%;
    height: 40px;
    min-height: 40px;
    line-height: 40px;
    padding: 0 10px;
    opacity: 0;
    filter: alpha(opacity=0); 
}
</style> 

<section id="agent-page"  style="margin-top: 100px;">
	<div class="container">
		<div id="select_box">
		    <select id="category" name="category">
		   	 <option value="">전체보기</option>
				<c:forEach items="${category}" var="categorylist">
				<c:choose>
				<c:when test="${categorySelected eq categorylist.CATEGORY_NAME} ">
				<option value="${categorylist.CATEGORY_NAME}" selected="selected">${categorylist.CATEGORY_NAME}</option>
				</c:when>
				<c:otherwise>
				<option value="${categorylist.CATEGORY_NAME}">${categorylist.CATEGORY_NAME}</option>
				</c:otherwise>
				</c:choose>
				</c:forEach>
			</select>
		    <!-- <select id="category" title="select category">
		        <option value="" selected="selected">전체보기</option>
		        <option value="반찬">반찬</option>
		        <option value="김치">김치</option>
		        <option value="고기">고기</option>
		        <option value="국,찌게">국,찌게</option>
		        <option value="도시락">도시락</option>
		        <option value="베이커리">베이커리</option>
		    </select>-->
		</div>
	<div class="col-md-8">
		<c:forEach var="food" items="${lvo.list }" >
		<div class="row" style="vertical-align: middle">
							<div class="col-sm-8 col-md-8 col-sm-push-4">
								<div class="bs-callout callout-success" style="width: 800px">
										<h3 class="title" style="width: auto">
								<a href="${pageContext.request.contextPath}/foodDetailView.do?foodNo=${food.foodNo}">
									${food.foodName}</a><a style="font-size: 12px"><i class="fa fa-star" style="margin-right: 5px; margin-left: 10px"></i>평점:&nbsp;${food.foodScore}</a></h3> 
							 <span class='description' style='color:black;font-size:12px;'>		
								 <table height="81px">  
								<tr> 
									<td><i class='fa fa-user' style="font-weight: bold; margin-right: 5px">&nbsp;판매자 이름&nbsp;</i></td><td><a>${food.memId}</a></td>
								</tr>
								<tr>
									<td><i class='fa fa-calendar' style="font-weight: bold; margin-right: 5px">&nbsp;음식 상세&nbsp;</i></td><td><a>${food.foodDe}</a></td>
								</tr>		
								<tr>
									<td></td><td></td>
								</tr>			
								</table>
							 </span>
								</div><!-- bs-callout callout-success -->
							</div><!-- /.col-md-8 -->
							<div class="col-sm-4 col-md-4 col-sm-pull-8" style="padding-top: 15px;" >
							<!-- . Agent Box -->
							<div class="img" >
								<a href="${pageContext.request.contextPath}/foodDetailView.do?foodNo=${food.foodNo}"><img alt="Sample images" width="250px" height="150px" src="${pageContext.request.contextPath }/resources/images/${food.foodMainImg}"></a>
							</div>
							</div><!-- /.col-md-4 -->		
						</div>
		</c:forEach>
	</div>
	<div class="col-md-2"></div>
	</div>
</section>
		
