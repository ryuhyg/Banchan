<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
$(document).ready(function(){
	//비밀번호 체크
	$("#resetPassForm :input[id=password]").keyup(function() {
		var id=$(this).val().trim();
		if(id.length<4 || id.length>10){
			$("#passwordCheckView").html("비밀번호는 4자이상 10자 이하여야 합니다!").css(
					"color","pink");
			checkPassword="";
		}else{
			$("#passwordCheckView").html("비밀번호 사용가능!").css(
					"background","white");
			checkPassword="passwordOK";
		}
		$("#resetPassForm :input[id=passwordRe]").trigger("keyup");
		
	});//keyup
	
	//비밀번호 일치 체크
	$("#resetPassForm :input[id=passwordRe]").keyup(function() {
		if($("#resetPassForm :input[id=password]").val().trim()==""&& !checkPassword==""){
			
			$("#resetPassForm :input[id=passwordRe]").val("");
			$("#resetPassForm :input[id=password]").focus();
			alert("적정 비밀번호를 먼저 입력하세요!");
		}
		else{
			if($("#resetPassForm :input[id=password]").val().trim()!=$("#resetPassForm :input[id=passwordRe]").val().trim()){
				checkPasswordRe="";
				$("#passwordReCheckView").text("불일치!!").css("background","red");
			}
			else if($("#resetPassForm :input[id=password]").val().trim()==$("#resetPassForm :input[id=passwordRe]").val().trim()){
				checkPasswordRe="passwordOK";
				$("#passwordReCheckView").text("비밀번호 일치").css("background","white");
			}
		}
	});//keyup
	$("#resetPassBtn").click(function(){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/resetPassword.do",				
			data:  "id="+$("#id").val() +"&password="+$("#password").val(),	
			beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success:function(data){						
				alert("비밀번호가 변경되었습니다. 로그인 해주세요.");
				location.href="${pageContext.request.contextPath}/member/loginView.do" 
			}//callback			
		});//ajax
	})
})//ready
</script>
	
	
	
    <section id="recent-list" style="margin-top: 150px;">
			<div class="container">
				<div class="row">
				<div class="col-sm-4"><!-- left -->
				
				</div>
					<div class="col-sm-4">
						<div class="blog-list blog-detail">
		<h3 class="title-form"><i class="icon fa fa-comment" style="margin-right: 5px; font-weight: bold;"></i>비밀번호 재설정</h3>
							<form class="form-large grey-color" id="resetPassForm" name="resetPassForm">
										<sec:csrfInput/><%-- csrf 토큰 --%>
										<%-- <input type="hidden" name="id" id="id" value="${qnamvo.memId}"> --%>
										<input type="hidden" name="id" id="id" value="${memId}">
										<label for="password" style="font-weight: bold;"> <i class="fa fa-user user" style="margin-right: 5px"></i>비밀번호</label>
										<input type="text" placeholder="비밀번호" name="password" id="password" class="margin-bottom form-control">
											<span id="passwordCheckView"></span>	<br>		
										<label for="passwordRe" style="font-weight: bold;"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>비밀번호 확인</label>
										<input type="text" placeholder="비밀번호 확인" name="passwordRe" id="passwordRe" class="margin-bottom form-control">
											<span id="passwordReCheckView"></span>		<br>			
								<br>
								<div align="center"> 
								<button type="button" class="btn btn-reverse button-form"  id="resetPassBtn" >재설정</button>
								</div>
							</form>		
							</div>
							</div>	
							<div class="col-sm-4"><!-- right -->
							
							</div>
							</div>
							</div>
		</section>