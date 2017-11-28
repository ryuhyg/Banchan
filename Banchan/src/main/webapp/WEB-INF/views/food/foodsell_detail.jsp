<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<sec:authentication var="mvo" property="principal" />

<!-- 별점 style부분 ************************* -->
 <style type="text/css"> /* 별점 css */
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc; 
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#ffcc00;}
.home-top{
	margin-top: 100px;
}
</style>     
    
<script type="text/javascript">

	$(document).ready(function () {
		$("#trQuantity").change(function () {
			//구매수량이 준비수량보다 적은지 확인
			var preQuantity=$("#preQuantity").text();
			if(parseInt($(this).val()) > parseInt(preQuantity)){
				alert("준비수량이 부족합니다!");
				$("#trQuantity").val(1); 
			}
			var orderPrice=$(this).val()*$("#price").text();
			$("#orderPrice").text(orderPrice);
		}); //change 
		

	/*판매 음식 삭제하기*/
	$("#deleteFood").click(function() {
		if(deleteFlag=confirm("삭제하시겠습니까?")){
			$.ajax({
	    		type:"get",
	        	url:"${pageContext.request.contextPath}/deleteConfirmAjax.do",
	        	data:"foodSellNo="+$("#foodSellNo").val(),
	        	success:function(data){
	        		if(data>1)
	        			alert("판매중인 상품이 있어 삭제할 수 없습니다.");
	        		else{
	        			alert("상품이 삭제되었습니다.");
	        			location.href="${pageContext.request.contextPath}/deleteFoodSell.do?foodSellNo="+$("#foodSellNo").val()+"&sellerId="+$("#sellerId").val();
	        		}
	        	} 
	    		
			}); //ajax	
		}
	}); //delFood click
	
	$("#editFoodSell").click(function() {
			if(deleteFlag=confirm("수정하시겠습니까?")){
				$.ajax({
		    		type:"get",
		        	url:"${pageContext.request.contextPath}/deleteConfirmAjax.do",
		        	data:"foodSellNo="+$("#foodSellNo").val(),
		        	success:function(data){
		        		if(data>1){
		        			alert("판매중인 상품이 있어 수정할 수 없습니다.");
		        		}
		        		else{
							location.href="${pageContext.request.contextPath}/editFoodSellView.do?foodSellNo="+$("#foodSellNo").val();
		        		}
		        	} 
				}); //ajax	
			}
		}); //click
	
	}); //ready

	function orderFoodConfirm(){
		var isLogin = $("#checkId").val();
		if(isLogin==null || isLogin==""){
			var flag = confirm("로그인하셔야 구매 가능합니다. 로그인하시겠습니까?");
			if(flag)
				location.href="loginView.do";
			else
				history.go(0);
		}
		else
			return confirm("구매하시겠습니까?");
		return false;
	}
</script>


<section id="recent-list" class="agency" style="margin-top: 150px">
<div id="page-container">
	<div class="container">
		<div class="row">
			<h2>판매상세정보</h2>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="agent-box-card grey">
					<div class="image-content">
						<div class="image image-fill">
							<img alt="Image Sample" src="${pageContext.request.contextPath}/resources/images/${foodSell.foodMainImg}">
						</div>						
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<h1 class="name">${foodSell.foodName}</h1>
				<div class="row">
				<div class="col-md-11">
				<table class="table">
					<tr>
						<th>음식평점</th>
						<td colspan="3">${foodSell.foodScore}</td>
					</tr>
					<tr>
						<th>예약마감일</th>
						<td>${foodSell.closeDate}</td>
						<th>거래일</th>
						<td>${foodSell.trDate}</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><span id="price">${foodSell.price}</span> 원</td>
						<th>양(개당)</th>
						<td>${foodSell.unit}</td>
					</tr>
					<tr>
						<th>준비수량</th>
						<td><span id="preQuantity">${foodSell.preQuantity}</span>&nbsp;(${foodSell.unit })</td>
						<th>남은수량</th>
						<td><span id="leftQuantity">${leftQuantity}</span>&nbsp;(${foodSell.unit })</td>
					</tr>
					<tr>
						<th>거래장소</th>
						<td colspan="3">${foodSell.loc}</td>
					</tr>
					<tr>
						<th>음식소개</th>
						<td colspan="3">${foodSell.foodDe}</td>
					</tr>
					<tr>
						<th>판매추가정보</th>
						<td colspan="3">${foodSell.sellDetail}</td>
					</tr>						
				</table>
				</div> <!-- col-md-10 --> 
				</div> <!-- row  -->
				<div class="row col-md-11">
				<hr>
					<form action="${pageContext.request.contextPath}/orderFood.do" onsubmit="return orderFoodConfirm()" >
					<div class="row"> 
					 <div class="col-sm-2" style="text-align: right">구매수량:</div>
					  <div class="col-sm-2">
				        <input type="number" min="1" name="trQuantity" id="trQuantity" class="form-control" style="width: 100px"/>
				      </div>
						<input type="hidden" name="foodSellVO.foodSellNo" value="${foodSell.foodSellNo}" id="foodSellNo"/>
						<input type="hidden" name="sellerId" value="${foodSell.memId}" id="sellerId"/>
					
						<sec:authorize access="hasRole('ROLE_BUYER')"><!--구매자 권한 설정 -->
 							<input type="hidden" name="memId" id="checkId" value="${mvo.memId }">
 						</sec:authorize>
				
 						
				      	<label class="control-label" for="거래가격">거래가격:
						<span id="orderPrice"></span>
						</label>
				  
					</div> <!-- row -->
 						
 						<div class="row" align="center">
 						<sec:authorize access="isAuthenticated()">
	 						<c:choose>
	 						<c:when test="${foodSell.memId!=mvo.memId }">
								<input type="submit"  class="btn btn-default" style="margin-top: 20px;"  value="구매하기">
	 						</c:when>
							<c:otherwise>
								<input type="button"  class="btn btn-default" id="editFoodSell" style="margin-top: 20px;"  value="수정하기">
								<input type="button"  class="btn btn-default" id="deleteFood" style="margin-top: 20px;" value="삭제하기">
								
							</c:otherwise> 						
	 						</c:choose>
 						</sec:authorize>
						</div>
					</form>
				</div>
			</div> <!-- col-md-9 -->	
		</div> <!-- row -->
		
	</div> <!-- container  -->
</div> <!-- page-container -->
<br><br>
<hr>
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
						<td>${r.memId }</td>
						<td>${r.revPostdate }</td>
					</tr>
				</c:forEach>
					</tbody>
			</table>
				</c:otherwise>
				</c:choose>
		</div>
		<c:set value="${rlist.pb }" var="pb"/>
	<div class="row center-block pagination"  align="center">
	  <ul class="pagination">
		<c:if test="${pb.previousPageGroup}">
		    <li><a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=${sellfood.foodSellNo }&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:if>

	  	<c:forEach var="pageNum"  begin="${pb.startPageOfPageGroup}"  end="${pb.endPageOfPageGroup}">
	  		<c:choose>
	  			<c:when test="${pageNum==pb.nowPage}">
			    	<li class="active"><a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=${foodSell.foodSellNo }&pageNo=${pageNum}">${pageNum}</a></li>
	  			</c:when>
	  			<c:otherwise>
			    	<li><a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=${foodSell.foodSellNo }&pageNo=${pageNum}">${pageNum}</a></li>
	  			</c:otherwise>
	  		</c:choose>
	  	</c:forEach>

		<c:if test="${pb.nextPageGroup}">
		    <li><a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=${foodSell.foodSellNo }&pageNo=${pb.startPageOfPageGroup+1}">&raquo;</a></li>
		</c:if>
	  </ul>
	</div>
	</div>
	

<hr>
<div class="container">
		<div class="row">
		<h4>QnA</h4>		

<!-- 댓글달기 -->

		
		</div>
</div>

</section>	<!-- recent-list -->			


