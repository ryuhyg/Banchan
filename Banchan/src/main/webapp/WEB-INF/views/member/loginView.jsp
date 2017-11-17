<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
		<section id="recent-list" style="margin-top: 300px;">
<div align="center">
<h3>LOGIN	</h3>
<form action="login.do" method="post" style="border: 2px;">
   						<div class="field" style="margin-bottom: 10px">
  								 <i class="fa fa-user user"></i>
								<input id="user-log" name="user-log" class="" type="text" placeholder="아이디">
								
						</div>
						<div class="field" style="margin-bottom: 10px">
								<i class="fa fa-ellipsis-h"></i>
								<input id="password-log" name="password-log" class="" type="password" placeholder="비밀번호">
								
						</div>
						<div align="center" style="margin-left: 16px">
    	<button type="submit" class="btn btn-reverse button-form" id="loginBtn" >로그인</button>
		<button type="button" class="btn btn-default button-form" style="margin-left: 4px" id="findPasswordBtn">비밀번호찾기</button>
		</div>
</form>
</div>
	</section>
