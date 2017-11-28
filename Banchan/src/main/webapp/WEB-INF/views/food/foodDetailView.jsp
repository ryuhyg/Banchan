<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
.pagination {
    display: inline-block;
    text-align: center;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    font-size: 13px;
}

.pagination a.active {
    background-color: #000;
    color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>

<section id="recent-list" style="margin-top: 150px">
	<div class="container">
		<div class="row">
			<div class="col-sm-1">
				<!-- left -->
			</div>

			<div class="col-sm-10">
				<div class="blog-list blog-detail">
					<h3 class="title-form">
						<i class="icon fa fa-comment" style="margin-right: 5px"></i>${food.foodName}</h3>

					<form class="form-large grey-color">
						<sec:csrfInput />
						<%-- csrf 토큰 --%>
						<div class="row">
						<div class="col-xs-6" style="float: left" class="row">
							<img style="padding-top: 30px" width="350px" height="250px" src="${pageContext.request.contextPath}/resources/images/${food.foodMainImg}">
						</div>
						<div class="col-xs-6" style="float: right" class="row">
							<label for="id"> <i class="fa fa-user user"
								style="margin-right: 5px"></i>주부님
							</label> 
							<input type="text" name="name" class="margin-bottom form-control" value="${food.sellerVO.memName}" readonly="readonly">
							<label for="date"><i class="fa fa-ellipsis-h"style="margin-right: 5px"></i>별점</label> 
							<input type="text" name="star" class="margin-bottom form-control" value="${food.foodScore}" readonly="readonly"> 
							<div class="row">
						</div>
						</div>
						</div>
						<div class="row">
							<div class="container-fluid" style="margin-top: 10px;">
								<label for="sellDetail"><i class="fa fa-ellipsis-h" style="margin-right: 8px;"></i>음식 상세정보</label><br>
								<textarea rows="4" cols="52" name="sellDetail" style="width: 100%" readonly="readonly">${food.foodDe}</textarea>
							</div>
						</div>
						</form>
				</div>
			</div>
		</div>
		
		
		<div class="container">
		<div class="row">
				<c:choose>
				<c:when test="${fn:length(rlist.list)==0}">
				<h4>작성된 후기가 없습니다</h4>
				</c:when>
				<c:otherwise>
			<table class="table table-hover"  style="text-align: center;font-size: 12px;">
					<thead>
					<tr class="tr_visible">
						<td>NO</td>
						<td>별점</td>
						<td>내용</td>
						<td>작성자</td>
						<td>날짜</td> 
					</tr>
					</thead>
					<tbody>
				<c:forEach items="${rlist.list }" var="r">
					<tr>
						<td>${r.revNo }</td>
						<td align="left">
								<span class="star_rating">  <!-- 별점 표현 -->
      							<c:forEach begin="1" end="${r.score}">
    							<a class="on">★</a>
								</c:forEach>
       							</span>
						${r.score }
						</td>
						<td>${r.revContent }</td>
						<td>작성자 넣어야댐</td>
						<td>${r.revPostdate }</td>
					</tr>
				</c:forEach>
					</tbody>
			</table>
				</c:otherwise>
				</c:choose>
		</div>
		
		<c:set value="${rlist.pb }" var="pb"/>
		<div class="row" style="text-align: center;">
		<div class="pageginationContainer">
		<div class="pagination">
				<c:if test="${pb.previousPageGroup}">
				    <a href="${pageContext.request.contextPath}/foodDetailView.do?foodNo=${food.foodNo}&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
				</c:if>
		
			  	<c:forEach var="pageNum"  begin="${pb.startPageOfPageGroup}"  end="${pb.endPageOfPageGroup}">
			  		<c:choose>
			  			<c:when test="${pageNum==pb.nowPage}">
					    	<a href="${pageContext.request.contextPath}/foodDetailView.do?foodNo=${food.foodNo}&pageNo=${pageNum}" class="active">${pageNum}</a>
			  			</c:when>
			  			<c:otherwise>
					    	<a href="${pageContext.request.contextPath}/foodDetailView.do?foodNo=${food.foodNo}&pageNo=${pageNum}">${pageNum}</a>
			  			</c:otherwise>
			  		</c:choose>
			  	</c:forEach>
			  	
				<c:if test="${pb.nextPageGroup}">
				    <a href="${pageContext.request.contextPath}/foodDetailView.do?foodNo=${food.foodNo}&pageNo=${pb.startPageOfPageGroup+1}">&raquo;</a>
				</c:if>
		</div> <!-- pagination -->
		</div> <!-- pageginationContainer -->
		</div> <!-- row  -->
		</div>
		
		

		<div class="col-sm-1">
			<!-- right -->
		</div>
	</div> <!-- container -->

</section>

