<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="mvo" property="principal" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutAction").click(function() {
			$("#logoutForm").submit();
		});
	});
</script>		


<header class="menu-base" id="header-container-box"
	style="top: 0px !important;">
	<div class="info" style="height: 50px;">
		<!-- info -->
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<a href="${pageContext.request.contextPath}/home.do">
					<img src="${pageContext.request.contextPath}/resources/images/logo/header_logo4.png"
						style="margin-top: -2px; z-index: 1000; width: 200px"></a>  
				</div>
				<div class="col-md-3"> 
				</div>
				<div class="col-md-1">
					   <!-- 검색어 -->
				</div>
				<div id="login-pan" class="col-md-4">
					<sec:authorize access="!isAuthenticated()">
						<!-- 비회원 권한 설정 -->
						<a href="${pageContext.request.contextPath}/member/registerView.do"><i
							class="icon fa fa-pencil-square-o"></i> 회원가입</a>
						<a href="${pageContext.request.contextPath}/member/loginView.do"><i
							class="icon fa fa-user user"></i> 로그인</a>
					</sec:authorize>

					<sec:authorize access="hasRole('ROLE_BUYER') and !hasRole('ROLE_SELLER')">
						<!-- 오직 구매자 권한 설정 -->
						<a href="#" id="logoutAction" style="padding-left: 12px"><i class="fa fa-sign-out"></i>로그아웃</a>
						<form id="logoutForm"
							action="${pageContext.request.contextPath}/logout.do"
							method="post" style="display: none">
							<sec:csrfInput />
						</form>
						<a href="${pageContext.request.contextPath}/sellerRegisterForm.do?id=${mvo.memId}"><i
							class="icon fa fa-pencil-square-o"></i> 판매자 등록</a>
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown"
							style="color: #1a1a1a; background-color: #fff; font-size: 12px; border: 0px; margin-top: 5px; float: right">
							<i class="icon fa fa-pencil-square-o"></i>마이페이지<span
								class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/editMemberView.do?memId=${mvo.memId}&pwQnaNo=<sec:authentication property="principal.pwQnaNo" />"><i class="fa fa-wrench" aria-hidden="true" style="margin-right: 5px;"></i>회원정보수정</a></li>
							<li><a href="#">내거래내역</a></li>
							<li><a href="${pageContext.request.contextPath}/member/deleteMemberView.do"><i class="fa fa-user-times" aria-hidden="true" style="margin-right: 5px"></i>회원탈퇴</a></li>
						</ul>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_SELLER')">
						<!-- 판매자 권한 설정 -->
						<a href="#" id="logoutAction" style="padding-left: 12px"><i class="fa fa-sign-out" aria-hidden="true"></i>로그아웃</a>
						<form id="logoutForm"
							action="${pageContext.request.contextPath}/logout.do"
							method="post" style="display: none">
							<sec:csrfInput />
						</form>
						<a href="${pageContext.request.contextPath}/sellerPageInfo.do?memId=${mvo.memId}"><i
							class="icon fa fa-user user"></i> 판매자 페이지</a>
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown"
							style="color: #1a1a1a; background-color: #fff; font-size: 12px; border: 0px; margin-top: 5px; float: right">
							<i class="icon fa fa-pencil-square-o"></i>마이페이지 <span
								class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/editMemberView.do?memId=${mvo.memId}&pwQnaNo=<sec:authentication property="principal.pwQnaNo" />"><i class="fa fa-wrench" aria-hidden="true" style="margin-right: 5px;"></i>회원정보수정</a></li>
							<li><a href="#">내거래내역</a></li>
							<li><a href="${pageContext.request.contextPath}/member/deleteMemberView.do"><i class="fa fa-user-times" aria-hidden="true" style="margin-right: 5px"></i>회원탈퇴</a></li>
						</ul>
					</sec:authorize>
				</div>
			</div>
		</div>
	</div>
	<!-- /.info -->
	<div class="menu-navbar" style="z-index: -1;">
		<div class="container" id="menu-nav">
			<div class="col-sm-2">
			</div> 
			<div class="col-sm-7">
			<nav id="navigation" style="margin-left: 140px">    
				<ul>
					<li class="has_submenu"><a href="">Home</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/home.do">홈으로</a></li>
							<li><a href="">소개</a></li>
						</ul></li>
					<li class="has_submenu"><a href="">음식찾기</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/locationServicePage.do">위치중심으로
									찾기</a></li>
							<li><a href="">카테고리로 찾기</a></li>

						</ul></li>
					<li class="has_submenu"><a href="#">공지사항</a>
						<ul>
							<li><a href="">공지사항</a></li>
							<li><a href="">QnA</a></li>
						</ul></li>
				</ul> 
			</nav>
			</div>  
			<div class="col-sm-3">			
				<form action="searchByKeyword.do">
						<div class="" style="margin-top: 10px; padding: 3px;
    border: solid 1px #E4E4E4;
    border-radius: 6px;
    background-color: #fff;">
							<input type="text" style="    border: 0; width:85%; box-shadow: none; " placeholder="검색" name="kw"> 
							<span><button style="  margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 8px 0 10px;
    border-left: solid 1px #ccc;" class="" type="submit">
							<i class="fa fa-search" aria-hidden="true"></i></button></span>
						</div>
					</form>
			</div>
				
		</div>
	</div>
	<!-- /.menu -->

	<a href="#" class="fixed-button top"><i class="fa fa-chevron-up"></i></a>
	<!-- 탑버튼 -->
	<!-- <a href="#" class="hidden-xs fixed-button email" data-toggle="modal" data-target="#modal-contact" data-section="modal-contact"><i class="fa fa-envelope-o"></i></a> -->
</header>

