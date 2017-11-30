<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
    background-color: #4CAF50;
    color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>    
    
    
<section id="recent-list" style="margin-top: 150px;">
	<div class="container">
		<div class="row">
				<div class="col-md-9">
				<h4><i class="fa fa-search" aria-hidden="true"></i><b>주부 검색 결과</b></h4>
	<c:choose>
		<c:when test="${fn:length(slist)==0 }">
			&nbsp;&nbsp;&nbsp;<font color="grey">┗ 검색결과없음</font>
			<div style="margin-top: 20px;"></div>
			
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${fn:length(slist)<=2 }">
					<c:forEach items="${slist }" var="seller">
						<div class="row" style="vertical-align: middle">
							<div class="col-sm-8 col-md-8 col-sm-push-4">
								<div class="bs-callout callout-success" style="width: 800px">
								<h2 class="title">
								<a href="sellerPageInfo.do?memId=${seller.memId }">${seller.memName}</a>
								</h2>						
								  <span class="description" style="color:black;font-size:14px;margin-top: 15px;">							  
								  	<i class="fa fa-ticket" style="font-weight: bold">판매자 소개:&nbsp;</i>${seller.sellerInfo}<br>
									<i style="font-weight: bold">평점:&nbsp;</i>${seller.sellerScore}<br>
									<i style="font-weight: bold">판매자 연락처:&nbsp;</i>${seller.tel }	
								  </span>
								</div><!-- bs-callout callout-success -->
							</div><!-- /.col-md-8 -->
							<div class="col-sm-4 col-md-4 col-sm-pull-8" style="padding-top: 15px;" >
							<!-- . Agent Box -->
							<div class="tab2img" >
								<img alt="Sample images" width="200" height="150" src="${pageContext.request.contextPath }/resources/images/${seller.sellerImg}"> 
							</div>
							</div><!-- /.col-md-4 -->		
						</div><!-- /.row -->
					</c:forEach>
				</c:when>
			<c:otherwise>
				<c:forEach items="${slist }" begin="1" end="3" var="seller">
					<div class="row" style="vertical-align: middle">
						<div class="col-sm-8 col-md-8 col-sm-push-4">
							<div class="bs-callout callout-success" style="width: 800px">
							<h2 class="title">
								<a href="sellerPageInfo.do?memId=${seller.memId }">${seller.memName}</a>
							</h2>						
							  <span class="description" style="color:black;font-size:13px;margin-top: 15px;">
							  	<i class="fa fa-ticket" style="font-weight: bold">판매자 소개:&nbsp;</i>${seller.sellerInfo}<br>
								<i style="font-weight: bold">평점:&nbsp;</i>${seller.sellerScore}<br>
								<i style="font-weight: bold">판매자 연락처:&nbsp;</i>${seller.tel }	
							  </span>
							</div><!-- bs-callout callout-success -->
						</div><!-- /.col-md-8 -->
						<div class="col-sm-4 col-md-4 col-sm-pull-8" style="padding-top: 15px;" >
						<!-- . Agent Box -->
						<div class="tab2img" >
							<img alt="Sample images" width="200" height="150" src="${pageContext.request.contextPath }/resources/images/${seller.sellerImg}"> 
						</div>
						</div><!-- /.col-md-4 -->		
					</div><!-- /.row -->
				</c:forEach>
					<a href="sellerSearchMore.do?kw=${keyword }">검색 결과 더보기..</a>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
</c:choose>
</div>
<hr width="95%" align="left">
<div class="col-md-9">
		<h4><b><i class="fa fa-search" aria-hidden="true"></i>음식 검색 결과</b></h4>
		<c:choose>
			<c:when test="${fn:length(fslist)==0 }">
				&nbsp;&nbsp;&nbsp;<font color="grey">┗ 검색결과없음</font>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${fn:length(fslist)<=2 }">
					<c:forEach items="${fslist }" var="foodSell">
						<div class="row" style="vertical-align: middle">
							<div class="col-sm-8 col-md-8 col-sm-push-4">
								<div class="bs-callout callout-success" style="width: 800px;">
									<h3 class="title">
										<a href="getFoodSellDetail.do?foodSellNo=${foodSell.foodSellNo }">
										${foodSell.foodName}
										</a>				
									</h3>		
							<span class="description" style="color:black;font-size:13px;">
								<i class="fa fa-ticket" style="font-weight: bold">음식 소개:&nbsp;</i>${foodSell.foodDe}	<br>					    
							    <i style="font-weight: bold">음식 평점:&nbsp;</i>${foodSell.foodScore}<br>
								<i style="font-weight: bold">판매자 아이디:&nbsp;</i>	
								<a href="sellerPageInfo.do?memId=${foodSell.memId }">${foodSell.memId }</a><br>
								<i style="font-weight: bold">예약 마감일:&nbsp;</i>${foodSell.closeDate}<br>
								<i style="font-weight: bold">거래 일:&nbsp;</i>${foodSell.trDate}<br>
								<i style="font-weight: bold">판매 추가 정보:&nbsp;</i>${foodSell.sellDetail}<br>
							</span>
								</div><!-- bs-callout callout-success -->
							</div><!-- /.col-md-8 -->
							<div class="col-sm-4 col-md-4 col-sm-pull-8" style="padding-top: 15px;" >
								<!-- . Agent Box -->
								<div class="tab2img" >
									<img alt="Sample images" width="200" height="200" src="${pageContext.request.contextPath }/resources/images/${foodSell.foodMainImg}"> 
								</div>
							</div><!-- /.col-md-4 -->
						</div><!-- /.row -->
					</c:forEach>
				</c:when>
				<c:otherwise>
				<c:forEach items="${fslist }" begin="1" end="3" var="foodSell">
					<div class="row" style="vertical-align: middle">
						<div class="col-sm-8 col-md-8 col-sm-push-4">
							<div class="bs-callout callout-success" style="width: 800px;">
								<h3 class="title">
									<a href="getFoodSellDetail.do?foodSellNo=${foodSell.foodSellNo }">
									${foodSell.foodName}
									</a>				
								</h3>		
							<span class="description" style="color:black;font-size:13px;">
								<i class="fa fa-ticket" style="font-weight: bold">음식 소개:&nbsp;</i>${foodSell.foodDe}<br>					    
							    <i style="font-weight: bold">음식 평점:&nbsp;</i>${foodSell.foodScore}<br>
								<i style="font-weight: bold">판매자 아이디:&nbsp;</i>	
								<a href="sellerPageInfo.do?memId=${foodSell.memId }">${foodSell.memId }</a><br>
								<i style="font-weight: bold">예약 마감일:&nbsp;</i>${foodSell.closeDate}<br>
								<i style="font-weight: bold">거래 일:&nbsp;</i>${foodSell.trDate}<br>
								<i style="font-weight: bold">판매 추가 정보:&nbsp;</i>${foodSell.sellDetail}<br>
							</span>
							</div><!-- bs-callout callout-success -->
						</div><!-- /.col-md-8 -->
						<div class="col-sm-4 col-md-4 col-sm-pull-8" style="padding-top: 15px;" >
							<!-- . Agent Box -->
							<div class="tab2img" >
								<img alt="Sample images" width="200" height="200" src="${pageContext.request.contextPath }/resources/images/${foodSell.foodMainImg}"> 
							</div>
						</div><!-- /.col-md-4 -->
					</div><!-- /.row -->
				</c:forEach>
					<a href="foodSearchMore.do?kw=${keyword }">검색 결과 더보기..</a>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
			</div><!-- col-md-9 -->
		</div><!-- row -->
	</div><!-- container -->
</section>
