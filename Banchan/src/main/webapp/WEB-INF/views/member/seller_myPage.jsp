<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="mvo" property="principal" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	//음식 삭제, 수정
	$("button[name='update']").click(function(){
		location.href="${pageContext.request.contextPath}/updateRegViewFood.do?foodNo="+$(this).val();
	});
	$("button[name='delete']").click(function(){
		location.href="${pageContext.request.contextPath}/deleteRegFood.do?foodNo="+$(this).val()+"&memId="+$("#sellerId").val();
		});
	$("button[name='seller']").click(function(){
		location.href="${pageContext.request.contextPath}/registerFoodView.do?foodNo="+$(this).val();	
	});
	
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
    $("#sellFood").click(function(){
    	//처음 판매중 음식 탭을 눌렀을 떄의 ajax
    	$.ajax({
    		type:"get",
        	url:"${pageContext.request.contextPath}/sellerPagePagingAjax.do",
        	data:"memId="+$("#sellerId").val(),
        	dataType:"json",
        	success:function(data){	
        		var sellInfo="";
        		for(var i=0;i<data.list.length;i++){
        			var foodSellNo=data.list[i].foodSellNo;
        			sellInfo+="<div class='row' style='vertical-align: middle'>";
        			sellInfo+="<div class='col-sm-8 col-md-8 col-sm-push-4'>";
        			sellInfo+="<div class='bs-callout callout-success' style='width: 800px'>";
        			sellInfo+="<a href='${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=";
        			sellInfo+=data.list[i].foodSellNo+"'>";
    				sellInfo+="<h4 class='title'>"+data.list[i].foodName+"</h4></a>";
    				sellInfo+="<span class='description' style='color:black;font-size:12px;'>";
    				sellInfo+="<i class='fa fa-ticket' style='font-weight: bold'> 남은 수량:</i>"+ data.list[i].price+"<br>";
        			sellInfo+="<i class='fa fa-calendar' style='font-weight: bold'> 거래 날짜:</i>"+data.list[i].trDate+"<br>";	
        			sellInfo+=" <i class='fa fa-close' aria-hidden='true' style='font-weight: bold'> 판매 종료 날짜:</i>"+ data.list[i].closeDate;
        			sellInfo+="<sec:authorize access='isAuthenticated()'>";
        			if($("#sellerId").val()==$("#loginId").val()){
        				sellInfo+=" <a  style='display:inline-block;float: right;'";
        				sellInfo+="class='btn btn-default' href='${pageContext.request.contextPath}/getSellerTradeListByFoodSellNo.do?foodSellNo="+data.list[i].foodSellNo+"&pageNo=1'>거래 내역 보기</a>";
        			}
        			sellInfo+="</sec:authorize>";
        			sellInfo+="</span>";
        			sellInfo+="</div>";
        			sellInfo+="</div>";
        			sellInfo+="<div class='col-sm-4 col-md-4 col-sm-pull-8' style='padding-top: 15px;' >";
        			sellInfo+="<div class='tab2img' >";
        			sellInfo+="<a style='size: inherit;' href='${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo="+data.list[i].foodSellNo+"'><img alt='Sample images' width='250px' height='150px' src='${pageContext.request.contextPath}/resources/images/"+data.list[i].foodMainImg+"'></a>";  
        			sellInfo+="</div>";
        			sellInfo+="</div>";
        			sellInfo+="</div>";
        			}
        			
        		$("#foodSellInfo").html(sellInfo);
        		
        		//alert(data.pb.previousPageGroup);
        		var startPageOfPageGroupMinus=data.pb.startPageOfPageGroup-1;
        		var endPageOfPageGroupPlus=data.pb.endPageOfPageGroup+1;
        		var startPageOfPageGroup=data.pb.startPageOfPageGroup;
        		var endPageOfPageGroup=data.pb.endPageOfPageGroup;
        		var nowPage=data.pb.nowPage;
        		var info=" <div class='pagination'>";
    			if(data.pb.previousPageGroup){
    				info+="<a id="+startPageOfPageGroupMinus+">&laquo;</a>";
    			}
    			for(var i=startPageOfPageGroup;i<endPageOfPageGroup+1;i++){
    				if(nowPage!=i){
    					info+="<a id="+i+">"+i+"</a>";
    					
    				}
    				else{
    					info+="<a id='-1' class='active'>"+i+"</a> &nbsp;";
    				}
    			}
    			if(data.pb.nextPageGroup){
    				info+="<a id="+endPageOfPageGroupPlus+">&raquo;</a>";
    			}		
    			info+="</div>";
    			
    			$("#paginationAjax").html(info);			
    	} 
    		
    	});//ajax
    	var offset=$("")
    	
    });//sellfood click
    
	//동적으로 생성되는 페이징 번호에 대한 event
	//페이징 숫자를 눌렀을 때의 ajax
$("#paginationAjax").on("click",".pagination a",function(){
		if($(this).attr('id')!="-1"){
		 $.ajax({
		type:"get",
    	url:"${pageContext.request.contextPath}/sellerPagePagingAjax.do",
    	data:"memId="+$("#sellerId").val()+"&pageNo="+$(this).attr('id'),
    	dataType:"json",
    	success:function(data){
    		var sellInfo="";
    		for(var i=0;i<data.list.length;i++){
    			sellInfo+="<div class='row' style='vertical-align: middle'>";
    			sellInfo+="<div class='col-sm-8 col-md-8 col-sm-push-4'>";
    			sellInfo+="<div class='bs-callout callout-success' style='width: 800px'>";
    			sellInfo+="<a href='${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo="+data.list[i].foodSellNo+"'>";
				sellInfo+="<h4 class='title'>"+data.list[i].foodName+"</h4></a>";
				sellInfo+="<span class='description' style='color:black;font-size:12px;'>";
				sellInfo+="<i class='fa fa-ticket' style='font-weight: bold'> 남은 수량:</i>"+ data.list[i].price+"<br>";
    			sellInfo+="<i class='fa fa-calendar' style='font-weight: bold'> 거래 날짜:</i>"+data.list[i].trDate+"<br>";	
    			sellInfo+=" <i class='fa fa-close' aria-hidden='true' style='font-weight: bold'> 판매 종료 날짜:</i>"+ data.list[i].closeDate;
    			sellInfo+="<sec:authorize access='isAuthenticated()'>";
    			if($("#sellerId").val()==$("#loginId").val()){
    				sellInfo+=" <a  style='display:inline-block;float: right;'";
    				sellInfo+="class='btn btn-default' href='${pageContext.request.contextPath}/getSellerTradeListByFoodSellNo.do?foodSellNo="+data.list[i].foodSellNo+"&pageNo=1'>거래 내역 보기</a>";
    			}
    			sellInfo+="</sec:authorize>";
    			sellInfo+="</span>";
    			sellInfo+="</div>";
    			sellInfo+="</div>";
    			sellInfo+="<div class='col-sm-4 col-md-4 col-sm-pull-8' style='padding-top: 15px;' >";
    			sellInfo+="<div class='tab2img' >";
    			sellInfo+="<a style='size: inherit;' href='${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo="+data.list[i].foodSellNo+"'><img alt='Sample images'  width='250px' height='150px' src='${pageContext.request.contextPath}/resources/images/"+data.list[i].foodMainImg+"'></a>";
    			sellInfo+="</div>";
    			sellInfo+="</div>";
    			sellInfo+="</div>";
    			}
    			
    		$("#foodSellInfo").html(sellInfo);
    		var startPageOfPageGroupMinus=data.pb.startPageOfPageGroup-1;
    		var endPageOfPageGroupPlus=data.pb.endPageOfPageGroup+1;
    		var startPageOfPageGroup=data.pb.startPageOfPageGroup;
    		var endPageOfPageGroup=data.pb.endPageOfPageGroup;
    		var nowPage=data.pb.nowPage;
    		var info=" <div class='pagination' style='text-align:center'>";
			if(data.pb.previousPageGroup){
				info+="<a  id="+startPageOfPageGroupMinus+">&laquo;</a>";
			}
			for(var i=startPageOfPageGroup;i<endPageOfPageGroup+1;i++){
				if(nowPage!=i){
					info+="<a id="+i+">"+i+"</a>";
				}
				else{
					info+="<a id='-1' class='active'>"+i+"</a> &nbsp;";
				}
			}
			if(data.pb.nextPageGroup){
				info+="<a  id="+endPageOfPageGroupPlus+">&raquo;</a>";
			}		
			info+="</div>";
			
			$("#paginationAjax").html(info);			
	} 
		
	});//ajax 

	//ajax실행시 스크롤 위치 올리기
	 var offset = $("#pagingScroll").offset();
	 $('html, body').animate({scrollTop : offset.top}, 1000);
	
	
	}
	});//click function
   
});
</script> 
<style type="text/css">
/*tab*/
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
/*페이징*/
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
    background-color: #000 ;
    color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

#paginationContainer{
	text-align: center;
}

/*별점*/
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



<section id="agent-page" style="margin-top: 150px;">
<br>

			<div class="container">
				<div class="row">
				<div class="col-md-1" ></div>
					<div class="col-md-9">
						<div class="row">
							<div class="col-sm-8 col-md-8 col-sm-push-4">
									<input type="hidden" id="sellerId" value="${svo.memId }">
										<sec:authorize access="isAuthenticated()">
											<input type="hidden" id="loginId" value="${mvo.memId }">
										</sec:authorize>
									<h1 class="name" >${svo.memName } </h1>
								<span id="pagingScroll"class="text">
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
											<img alt="Image Sample" style="size: inherit;" src="${pageContext.request.contextPath}/resources/images/${svo.sellerImg }">
										</div>						
									</div>
									<div class="info-agent">
										<div class="text" style="text-align:center">
												<b>주부님 별점:</b>
												<span class="star_rating">  <!-- 별점 표현 -->
					      							<c:forEach begin="1" end="${svo.sellerScore}">
					    								 <a class="on">★</a>
													</c:forEach>
				       							</span>
											<%-- <b>별점:${svo.sellerScore}</b> --%>
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
					 	<a href="getAllSellerTradeList.do?sellerId=${mvo.memId }&pageNo=1" class="btn btn-default" style="width: 70%;" >판매내역보기</a>
						</div>
						<a  href="${pageContext.request.contextPath}/foodRegisterForm.do" class="btn btn-default" style="width: 70%" >음식 등록</a>
					</c:if> 
					</sec:authorize>
					</div>
				</div><!-- ./row --> 
				
			
				
		<div id="tabcontainer">		
				<ul class="tab">
			        <li class="active"><a href="#tab1">내음식</a></li>
			        <li><a href="#tab2" id="sellFood">판매중 음식</a></li>
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
										<img alt="Sample images"  style="size: inherit;" src="${pageContext.request.contextPath }/resources/images/${food.foodMainImg}"> 
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
										
										<%-- <a  style="display:inline-block" class="btn btn-default" hre	f="${pageContext.request.contextPath}/registerFoodView.do?foodNo=${food.foodNo}">판매등록</a> --%>
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
			
				<div class="tab2Container">
				
				<div class="col-md-9">
					<div id="foodSellInfo">
					
					</div>
				<!-- 여기서 부터 ajax 시작 -->
				
					
					<!-- 여기가 ajax 끝 -->
				</div>
				<div class="col-md-12">
					<div class="paginationContainer" >
						<div id="paginationAjax" style="text-align: center ;">  
						
						</div>
					</div><!-- paginationContainer -->
				</div>
					</div>
						
				</div>
				
			</div><!-- tab_container -->
		</div><!-- tabcontainer -->
					 
			</div><!-- ./container -->
		</section><!-- /#about-us -->
