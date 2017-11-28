<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	margin-top: 108px; 
	margin-left: -30px;
	width: 1355px;
}
.nexthome{
	margin-top: -50px;
}
</style> 
  
    
 <!-- 슬라이드 부분 *************************** -->
 	
	<section id="home-slide" class="home-top" >
			<div class="home-slider"  style="margin-left: -90px; width: 100%" data-navigation=".home-slider-nav" >
				<div class="crsl-wrap">
						<div class="crsl-item" style="background-image: url('resources/images/img/main_img_00.jpg');">
						<div class="container slider-box">
						</div>
					</div>
					<div class="crsl-item" style="background-image: url('resources/images/img/main_img_01.jpg');">
						<div class="container slider-box">
						</div>
					</div>
					<div class="crsl-item" style="background-image: url('resources/images/img/main_img_02.jpg');">
						<div class="container slider-box">
						</div>
					</div>
				</div>
				<p class="home-slider-nav previus">
					<a href="#" class="previous">previous</a>
				</p>
				<p class="home-slider-nav next">
					<a href="#" class="next">next</a>
				</p>
			</div>
		</section>
<!-- 슬라이드 부분끝 *************************** -->


<!--  링크 테스트 섹션 -->
	<%-- <section id="recent-list">
			<div class="section-detail" style="border: 1px solid red">
		
			
			<a href="">테스트2//</a>
			<a href="">테스트3//</a>
			<!-- 우정 링크 테스트 -->
			<a href="${pageContext.request.contextPath}/sellerPageInfo.do?memId=aaaa"  >판매자 페이지</a>
			<!-- 윤주 링크 테스트 -->
			<sec:authorize access="hasRole('ROLE_BUYER')"><!-- 구매자 권한 설정 -->
				<h3><a href="${pageContext.request.contextPath}/sellerPageInfo.do?memId=${mvo.memId}"  >
								판매자 페이지</a></h3>			
			<a href="${pageContext.request.contextPath}/myTradeList.do?memId=${mvo.memId }">나의구매내역테스트_윤주//</a>

			</sec:authorize>
			<!-- 지원 링크 테스트 -->
			<a href="${pageContext.request.contextPath}/registerFoodView.do">판매음식등록 테스트//</a>
			<a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=101010">판매음식 상세정보//</a>
			<a href="${pageContext.request.contextPath}/getSellerTradeListByFoodSellNo.do?foodSellNo=101019&pageNo=1">[판매자]판매음식당 거래요청리스트//</a>
			<sec:authorize access="hasRole('ROLE_SELLER')">
				<a href="${pageContext.request.contextPath}/getAllSellerTradeList.do?sellerId=${mvo.memId}">[판매자]전체 거래요청리스트//</a>
			</sec:authorize>
			
		</div>
	</section> --%>
<!--  링크 섹션끝 -->


		<section id="recent-list" class="nexthome">
			<div class="section-detail">
				<h1>
				  <span>오늘은 </span>
				  <span id="spinner-show"  style="color: red; font-weight: bold;">
					  <em class="current" style="color: red; font-weight: bold;">순대국</em>
					  <span class="next"><span></span></span>
				  </span>
				  <span> 먹을까?</span>
				</h1>
				<ul id="spinner">
					 <li>제육볶음</li>
					 <li>김치찌개</li>
					 <li>갈비찜</li>
					 <li>닭 볶음탕</li>
					 <li>낙지젓갈</li>
				</ul>
				<h4  style="color: black;">주부님들의 반찬으로 인스턴스 식품에 찌든 여러분을 정화 시키는 맛</h4>		
			</div>
			
<c:if test="${fn:length(list)!=0}">
<!-- 인기 주부님 목록 -->
			<div class="container" style="margin-left: -20px">
				<div class="list-box-title">
					<span><i class=""></i>인기 주부님 TOP 3</span>
				</div>
				<div class="row"> 
				<!-- 주부님 리스트 -->
				<c:forEach items="${list}" var="list">
					<div class="col-md-4">
						<div class="box-ads box-home" style="height: 425px">
							<a class="hover-effect image image-fill" href="${pageContext.request.contextPath}/sellerPageInfo.do?memId=${list.getMemId()}">
								<span class="cover"></span>
								<img alt="Sample images" style="width:380px;height:270px" src="${pageContext.request.contextPath}/resources/images/${list.getSellerImg()}">
								<h3 class="title">${list.getMemName()} &nbsp;주부님</h3>
							</a><!-- /.hover-effect -->
							<span class="address"><i class="fa fa-map-marker"></i>&nbsp;${list.getAddressVO().getAddressAPI()}</span>
							<span class="description">${list.getSellerInfo()}</span>
							
							<dl class="detail">
							<div>
								<dt class="">판매자평점</dt><br><br>
								<span class="star_rating">  <!-- 별점 표현 -->
      							<c:forEach begin="1" end="${list.getSellerScore()}">
    							<a class="on">★</a>
								</c:forEach>
								<c:forEach begin="1" end="${5-list.getSellerScore()}">
    							<a>★</a>
   								</c:forEach>
       							</span>
       							 &nbsp;${list.getSellerScore()}
       						</div>
       						</dl><!-- /.detail -->
						</div><!-- /.box-home .box-ads -->
					</div><!-- ./col-md-4 -->
				</c:forEach>
					
				</div>
	<!-- 인기 음식 -->
				<div class="list-box-title">
					<span><i class=""></i>인기 음식</span>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="box-ads box-home">
							<a class="hover-effect image image-fill" href="property-detail.html">
								<span class="cover"></span>
								<img alt="Sample images" src="">
								<h3 class="title">음식이름</h3>
							</a><!-- /.hover-effect -->
							
							<span class="address"><i class="fa fa-map-marker"></i> 해당 주부님 </span>
							<span class="description">음식 소개</span>
							<dl class="detail">
								<dt class="">별점</dt>
							</dl><!-- /.detail -->
								
						</div><!-- /.box-home .box-ads -->
					</div><!-- ./col-md-4 -->
					<div class="col-md-4">
						<div class="box-ads box-home">
							<a class="hover-effect image image-fill" href="property-detail.html">
								<span class="cover"></span>
								<img alt="Sample images" src="">
								<h3 class="title">음식이름</h3>
							</a><!-- /.hover-effect -->
							
							<span class="address"><i class="fa fa-map-marker"></i> 해당 주부님 </span>
							<span class="description">음식 소개</span>
							<dl class="detail">
								<dt class="">별점</dt>
							</dl><!-- /.detail -->
							
						</div><!-- /.box-home .box-ads -->
					</div><!-- ./col-md-4 -->
					<div class="col-md-4">
						<div class="box-ads box-home">
							<a class="hover-effect image image-fill" href="property-detail.html">
								<span class="cover"></span>
								<img alt="Sample images" src="">
								<h3 class="title">음식이름</h3>
							</a><!-- /.hover-effect -->
							
							<span class="address"><i class="fa fa-map-marker"></i> 해당 주부님 </span>
							<span class="description">음식 소개</span>
							<dl class="detail">
								<dt class="">별점</dt>
							</dl><!-- /.detail -->
							
						</div><!-- /.box-home .box-ads -->
					</div><!-- ./col-md-4 -->
				</div>
			</div>
</c:if>	 
		</section>
		
		<section id="submit-property" data-parallax-speed="0" align="center">
			 
			<span class="overlay"></span>
			<div class="container">
				<div class="section-detail">
					<h1 style="color: #1a1a1a; font-weight: bold;">여러분이 주인공입니다.</h1>
					<h2 style="color: #1a1a1a">직접 만든 음식을 주변 사람들과 나누며 수익을 창출해 보세요.</h2>	
				</div>
				<div class="row text-center">
			<sec:authorize access="!isAuthenticated()"><!-- 비회원 권한 설정 -->
					<a href="#" class="btn btn-reverse button-large">판매자 등록하기</a>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_BUYER')"><!-- 구매자 권한 설정 -->
					<a href="${pageContext.request.contextPath}/sellerRegisterForm.do?id=${mvo.memId}" class="btn btn-reverse button-large">판매자 등록하기</a>
			</sec:authorize>
				</div>
			</div>
		</section>


		

