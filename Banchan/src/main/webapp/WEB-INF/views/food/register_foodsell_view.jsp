<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<section id="recent-list" style="margin-top: 350px">
	<%-- <form action="${pageContext.request.contextPath}/registerFoodSell.do" method="post">
	<sec:csrfInput/>
		<h3>갓김치</h3>
		거래일자 <input type="date" name="trDate"><br><br>
		마감일자 <input type="date" name="closeDate"><br><br>		
		거래장소 <input type="text" name="loc">	<br><br>
		가격 <input type="number" name="price"><br><br>
		준비수량 <input type="number" name="preQuantity"><br><br>
		양 정보 <input type="text" name="unit"><br><br>
		상세정보 <input type="text" name="sellDetail"><br><br>
		<input type="hidden" name="foodVO.foodNo" value="1001"><br><br>
		<input type="submit" value="판매등록하기">
	</form> --%>
	
	
	
	
<div class="container">
	<div class="row">
		<div class="col-sm-1"><!-- left --></div>
		
		<div class="col-sm-10" >
			<div class="blog-list blog-detail">
		<h3 class="title-form"><i class="icon fa fa-comment" style="margin-right: 5px"></i>갓김치</h3>

		<form class="form-large grey-color" action="${pageContext.request.contextPath}/registerFoodSell.do" method="post" id="regForm">
		<sec:csrfInput/><%-- csrf 토큰 --%>
		<div class="row">
			<div  class="col-xs-6" style="float: right">
				<label for="id"> <i class="fa fa-user user" style="margin-right: 5px"></i>거래일자</label>
				<input type="date" name="trDate" id="trDate"  class="margin-bottom form-control" placeholder="거래일자" >											
			</div>
		</div>		
		<div class="row">
			<div  class="col-xs-6" style="float: right">
					<label for="date"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>마감일자</label>
					<input type="date" name="closeDate" id="closeDate" class="margin-bottom form-control" placeholder="마감일자">
			</div>
		</div>
		<div class="row">
	 		<div  class="col-xs-6" style="float: right">										
				<label for="loc"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>거래장소 </label>
				<input type="text"	 name="loc"  id="loc" class="margin-bottom form-control" >
			</div>
		</div>
		<div class="row" >
	 		<div  class="col-xs-6" style="float: right">										
				<label for="price"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>가격 </label>
				<input type="number" name="price"  id="price" class="margin-bottom form-control" >
			</div>
		</div>
		<div class="row" >
	 		<div  class="col-xs-6" style="float: right">										
				<label for="preQuantity"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>준비수량</label>
				<input type="number" name="preQuantity"  id="preQuantity" class="margin-bottom form-control" >
			</div>
		</div>
		<div class="row" >
	 		<div  class="col-xs-6" style="float: right">										
				<label for="unit"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>수량 당 정보</label>
				<input type="text" name="unit"  id="unit" class="margin-bottom form-control" >
			</div>
		</div>
		<div class="row">
	 		<div  class="container-fluid">										
				<label for="sellDetail"><i class="fa fa-ellipsis-h" style="margin-right: 5px"></i>상세정보</label><br>
				<textarea rows="10" cols="52" name="sellDetail" style="width: 100%">
				</textarea>
			</div>
		</div>
		<input type="hidden" name="foodNo" value="1001"><br><br>
				<br>
				<br>
			<div class="row">
				<div align="center">
				<input  type="submit" class="btn btn-reverse button-form"  value="판매등록하기">
				<button type="button" class="btn btn-default button-form"  id="returnBtn">돌아가기</button>
				</div>
			</div>
		</form>		
		</div>
		</div>	
		
		<div class="col-sm-1"><!-- right --></div>
		</div>
		</div>
</section>    
