<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
    
		<section id="recent-list" style="margin-top: 350px;">
	<div class="container">
				<div class="row">
				<div class="col-sm-4"><!-- left -->
				
				</div>
					<div class="col-sm-4">
						<div class="blog-list blog-detail">
		<h3 class="title-form"><i class="icon fa fa-comment" style="margin-right: 5px; font-weight: bold;"></i>로그인</h3>
							<form class="form-large grey-color" action="login.do" method="post">
							
										<sec:csrfInput/><%-- csrf 토큰 --%>
									
										<label for="id" style="font-weight: bold;"> <i class="fa fa-user user" style="margin-right: 5px"></i>아이디</label>
										<input type="text" placeholder="아이디" name="id" id="id" class="margin-bottom form-control">
								
									
								
										<label for="password" style="font-weight: bold;"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>비밀번호</label>
										<input type="password" placeholder="비밀번호" name="password" id="password" class="margin-bottom form-control">
								
								<br>
								<button type="submit" class="btn btn-reverse button-form" style="float: left" id="loginBtn" >로그인</button>
								<a href="${pageContext.request.contextPath}/member/registerView.do"><button type="button"  class="btn btn-reverse button-form" style="margin-left: 25px" id="registerBtn" >회원가입</button></a>
								<button type="button" class="btn btn-default button-form" style="float: right" id="findPasswordBtn">비밀번호찾기</button>
							</form>		
							</div>
							</div>	
							<div class="col-sm-4"><!-- right -->
							
							</div>
							</div>
							</div>
	</section>
	<section>
	</section>
	
