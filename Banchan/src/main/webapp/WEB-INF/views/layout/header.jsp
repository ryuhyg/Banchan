<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
		<header class="menu-base" id="header-container-box">
			<div class="info"><!-- info -->
				<div class="container">
					<div class="row">
						<div class="col-md-6">
						</div>
						<sec:authorize access="!hasRole('ROLE_MEMBER')"><!-- 권한 설정 -->
						<div id="login-pan" class="col-md-6">
							<a href="${pageContext.request.contextPath}/member/registerView.do" ><i class="icon fa fa-pencil-square-o"></i> 회원가입</a>
							<a href="${pageContext.request.contextPath}/member/loginView.do"  ><i class="icon fa fa-user user"></i> 로그인</a>
							<a href="${pageContext.request.contextPath}/member/loginView.do"  ><i class="icon fa fa-user user"></i> 기타</a>
						</div>
						</sec:authorize>
			<%-- 			<sec:authentication property="principal.name" />님 <br>
						<a href="${pageContext.request.contextPath}/enterCafe.do">카페가기</a> --%>
					</div>
				</div>			
			</div><!-- /.info -->
			<div class="logo hidden-xs">
				<a href="${pageContext.request.contextPath}/home.do"><img id="logo-header" src="${pageContext.request.contextPath}/resources/images/반창고.png" alt="Logo" /></a>
			</div><!-- /.logo -->
			<div class="menu-navbar">
				<div class="container" id="menu-nav">
					<nav id="navigation">
						<ul>
							<li class="has_submenu">
								<a href="">Home</a>
								<ul>
									<li><a href="">홈페이지 소개</a></li>
									<li><a href="">기타예비</a></li>
								</ul>
							</li>
							<li class="has_submenu">
								<a href="">음식찾기</a>
								<ul>
									<li><a href="">위치중심으로 찾기</a></li>
									<li><a href="">카테고리로 찾기</a></li>
									
								</ul>
							</li>
							<li class="has_submenu"><a href="#">공지사항</a>
								<ul>
									<li><a href="">공지사항</a></li>
									<li><a href="">QnA</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div><!-- /.menu -->
				<a href="#" class="fixed-button top"><i class="fa fa-chevron-up"></i></a>
		</header>
		

		
	

