<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="recent-list" style="margin-top: 150px;">
			<div class="container">
				<div class="row">
				<div class="col-sm-4"><!-- left -->
				
				</div>
					<div class="col-sm-4">
						<div class="blog-list blog-detail">
		<h3 class="title-form"><i class="icon fa fa-comment" style="margin-right: 5px; font-weight: bold;"></i>비밀번호 찾기 답변</h3>
							<form class="form-large grey-color" id="findPassForm" name="findPassForm" action="${pageContext.request.contextPath }/findPasswordCheck.do" method="get">
										
										<label for="id" style="font-weight: bold;"> <i class="fa fa-user user" style="margin-right: 5px"></i>아이디</label>
												
										<label for="password" style="font-weight: bold;"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>이름</label>
										<input type="text" placeholder="이름" name="name" id="name" class="margin-bottom form-control">
								<br>
								<div align="center"> 
								<button type="submit" class="btn btn-reverse button-form"  id="findPassBtn" >확인</button>
								<a href="${pageContext.request.contextPath}/home.do"><button type="button"  class="btn btn-reverse button-form" style="margin-left: 20px" id="findBtn" >홈으로</button></a>
								</div>
							</form>		
							</div>
							</div>	
							<div class="col-sm-4"><!-- right -->
							
							</div>
							</div>
							</div>
		</section>