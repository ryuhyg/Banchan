<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="mvo" property="principal" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script> 
	$(document).ready(function(){
		$("button[name='update']").click(function(){
			//alert($(this).val());
			location.href="${pageContext.request.contextPath}/updateRegViewFood.do?foodNo="+$(this).val();
		});
		$("button[name='delete']").click(function(){
			location.href="${pageContext.request.contextPath}/deleteRegFood.do?foodNo="+$(this).val();
			});
		$("button[name='seller']").click(function(){
			location.href="${pageContext.request.contextPath}/registerFoodView.do?foodNo="+$(this).val();	
		});
	});
</script>
<style type="text/css">
ul.tab {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height:  32px;
    border-bottom: 1px solid #999;
    border-left: 1px solid #999;
    width: 100%;
}
ul.tab li {
    float: left;
    margin: 0;
    padding: 0;
    height: 31px;
    line-height: 31px;
    border: 1px solid #999;
    border-left: none;
    margin-bottom: -1px;
    overflow: hidden;
    position: relative;
    background:#000;
}
ul.tab li a {
    /* text-decoration: none; */
    color: #e0e0e0;
    display: block;
    font-size: 1.0em;
    padding: 0 20px;
    border: 1px solid #fff;
    outline: none;
}
ul.tab li a:hover {
    background: #ccc;
}
html ul.tab li.active, html ul.tab li.active a:hover  {
    background: #000;
    border-bottom: 1px solid #000;
}
#tabcontainer {
    border: 1px solid #999;
    border-top: none;
    overflow: hidden;
    clear: both;
    float: left; width: 100%;
    background: #fff;
}
.tab_content {
    padding: 20px;
    font-size: 1.2em;
} 
#tab2Container{

    padding: 10px;
    border: 5px solid gray;
    margin: 0; 
}

</style>

<script type="text/javascript">
$(document).ready(function() {
    $(".tab_content").hide();
    $("ul.tab li:first").addClass("active").show();
    $(".tab_content:first").show();
    $("ul.tab li").click(function() {
        $("ul.tab li").removeClass("active");
        $(this).addClass("active");
        $(".tab_content").hide();
        var activeTab = $(this).find("a").attr("href");
        $(activeTab).fadeIn();
        return false;
    });
});
</script>



<section id="agent-page" style="margin-top: 350px;">
<br>

			<div class="container">
				<div class="row">
				<div class="col-md-1"></div>
					<div class="col-md-9">
						<div class="row">
							<div class="col-sm-8 col-md-8 col-sm-push-4">
									<h1 class="name">${svo.memName } </h1>
								<span class="text">
								주부님 소개
								</span>
								<div class="bs-callout callout-success">
								  <h4 class="title">믿고먹는 주부님</h4>
								  <span class="address"><i class="fa fa-map-marker"></i>&nbsp;${svo.addressVO.addressAPI}</span>
								  <p class="text">${svo.sellerInfo }</p>
								</div>
							</div><!-- /.col-md-8 -->
							<div class="col-sm-4 col-md-4 col-sm-pull-8">
								<!-- . Agent Box -->
								<div class="agent-box-card grey">
									<div class="image-content">
										<div class="image image-fill">
											<!-- <img alt="Image Sample" src="resources/images/${svo.sellerImg }"> -->
											<img alt="Image Sample"  width="300px" height="250px"  src="resources/images/${svo.sellerImg }">
										</div>						
									</div>
									<div class="info-agent">
										<div class="text" style="text-align:center">
											<b>주부님별점:${svo.sellerScore}</b>
										</div>
										<ul class="contact">
											<li><a class="icon" href="#"><i class="fa fa-facebook"></i></a></li>
											<li><a class="icon" href="#"><i class="fa fa-google-plus"></i></a></li>
											<li><a class="icon" href="#"><i class="fa fa-twitter"></i></a></li>
											<li><a class="icon" href="#"><i class="fa fa-envelope-o"></i></a></li>
											<li><a class="icon" href="agent-detail.html"><i class="fa fa-info-circle"></i></a></li>
										</ul>
									</div>
								</div>

							</div><!-- /.col-md-4 -->
						</div><!-- /.row -->
					</div><!-- col-md-9 -->
					<div class="col-md-2">  

					<sec:authorize access="isAuthenticated()">
				<c:if test="${mvo.memId==svo.memId}">
						<div style="margin-bottom: 2px"> 
					 	<a href="getAllSellerTradeList.do?sellerId=${mvo.memId }" class="btn btn-default" style="width: 70%;" >판매내역보기</a>
						</div>
						<a  href="${pageContext.request.contextPath}/foodRegisterForm.do" class="btn btn-default" style="width: 70%" >음식 등록</a>
					</c:if> 
					</sec:authorize>
					</div>
				</div><!-- ./row --> 
				
			
				
		<div id="tabcontainer">		
				<ul class="tab">
			        <li class="active"><a href="#tab1">내음식</a></li>
			        <li><a href="#tab2">판매중 음식</a></li>
			    </ul>

				
			<div class="tab_container">
				
			<!-- tab1 -->
				<div id="tab1" class="tab_content" style="display: block;">
						<!-- 받아온 음식 반복 구간 -->
						<div class="my-property" data-navigation=".my-property-nav">
						<div class="crsl-wrap">
						<c:forEach items="${flist}" var="food">
							<figure class="crsl-item">
								<div class="box-ads box-grid">
									<a class="hover-effect image image-fill" href="${pageContext.request.contextPath}/foodDetailView.do?foodNo=${food.foodNo}">	
									<%-- 	<input type="hidden" id="foodNo" value="${food.foodNo }"> --%>
										
										<span class="cover"></span>
										<img alt="Sample images"  width="300px" height="200px" src="${pageContext.request.contextPath }/resources/images/${food.foodMainImg}"> 
										<h3 class="title">${food.foodName}</h3>
									</a>								
									<span class="description" >${food.foodDe}</span>
									<!-- <dl style="display:inline-block; height:60px"  class="detail" > -->
									<dl class="detail" > 
										<dt class="status">별점:</dt><dd><span>${food.foodScore}</span></dd>
									</dl> 
								<sec:authorize access="isAuthenticated()">
									<c:if test="${mvo.memId==svo.memId}">
									<div class="footer" style="height:50px">
										<!-- <a class="btn btn-default" href="#"></a>
										<a class="btn btn-default" href="#"></a> -->
										
										<%-- <a  style="display:inline-block" class="btn btn-default" href="${pageContext.request.contextPath}/registerFoodView.do?foodNo=${food.foodNo}">판매등록</a> --%>
										<button type="button" name="update" value="${food.foodNo }" style="margin-top:60px; margin-left: 5px" class="btn btn-default btn-xs">수정</button>
										<button type="button" name="delete" value="${food.foodNo }" style="margin-top:60px" class="btn btn-default btn-xs">삭제</button> 
										<button type="button" name="seller" value="${food.foodNo }" style="margin-top:60px; margin-left: 50px" class="btn btn-default btn-xs">판매등록</button>
									</div>
									</c:if>
									</sec:authorize>
								</div>
							</figure>
						</c:forEach>
					</div>	
						<div class="my-property-nav">
							<p class="button-container">
								<a href="#" class="next">next</a>
								<a href="#" class="previous">previous</a>
							</p>
						</div>
					</div><!-- myproperty -->
					
				</div><!--tab1 -->
				
				<!-- tab2 -->
				<div id="tab2" class="tab_content" style="display: none;">
						<!-- 받아온 음식 반복 구간 -->
			
				<c:forEach items="${fslist}" var="foodSell">
					<div class="tab2Container">
					<div class="col-md-9">
						<div class="row" style="vertical-align: middle">
							<div class="col-sm-8 col-md-8 col-sm-push-4">
								<div class="bs-callout callout-success" style="width: 800px">
								  <h4 class="title">${foodSell.foodName}</h4>
								  <span class="description" style="color:black;font-size:13px">
									  <i class="fa fa-ticket" style="font-weight: bold"> 남은 수량:</i>  ${foodSell.price}<br>
									  <i class="fa fa-calendar" style="font-weight: bold"> 거래 날짜:</i>  ${foodSell.trDate}<br>
									  <i class="fa fa-close" aria-hidden="true" style="font-weight: bold"> 판매 종료 날짜:</i>  ${foodSell.closeDate}
									<sec:authorize access="isAuthenticated()">
										<c:if test="${mvo.memId==svo.memId}">
									 	 <a  style="display:inline-block;float: right;" class="btn btn-default" href="${pageContext.request.contextPath}/getSellerTradeListByFoodSellNo.do?foodSellNo=${foodSell.foodSellNo}">거래 내역 보기</a>
										</c:if>
									</sec:authorize>		
								  </span>
								</div><!-- bs-callout callout-success -->
							</div><!-- /.col-md-8 -->
							<div class="col-sm-4 col-md-4 col-sm-pull-8" style="padding-top: 15px;" >
								<!-- . Agent Box -->
								<div class="tab2img" >
									<a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=${foodSell.foodSellNo}"><img alt="Sample images"  width="250px" height="150px" src="resources/images/${foodSell.foodMainImg}"></a>
								</div>
							</div><!-- /.col-md-4 -->
						
						</div><!-- /.row -->

					</div>
					</div>
						</c:forEach>
						<!-- paging 처리
							 <div class="pagingInfo">
								<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
								
								<ul class="pagination">
								<c:if test="${pb.previousPageGroup}">	
								<li><a href="${pageContext.request.contextPath}/list.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
								</c:if>
								<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
								end="${pb.endPageOfPageGroup}">
								<c:choose>
								<c:when test="${pb.nowPage!=i}">
								<li><a href="${pageContext.request.contextPath}/list.do?pageNo=${i}">${i}</a></li> 
								</c:when>
								<c:otherwise>
								<li class="active"><a href="#" >${i}</a></li>
								</c:otherwise>
								</c:choose>
								&nbsp;
								</c:forEach>
								<c:if test="${pb.nextPageGroup}">	
								<li><a href="${pageContext.request.contextPath}/list.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
								</c:if>
								</ul>	 		
							</div> 	 -->	
							
						
				
				</div>
				
			</div><!-- tab_container -->
		</div><!-- tabcontainer -->
					
			</div><!-- ./container -->
		</section><!-- /#about-us -->
