<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<sec:authorize access="isAuthenticated()">
<sec:authentication var="mvo" property="principal" />
</sec:authorize>
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
	margin-top: 100px;
}
</style>     
    
<script type="text/javascript">

$(document).ready(function () {
   var foodSellNo = $("#foodSellNo").val(); //게시글 번호 
   
   $("#trQuantity").change(function () {
      //구매수량이 준비수량보다 적은지 확인
      var leftQuantity=$("#leftQuantity").text();
      if(parseInt($(this).val()) > parseInt(leftQuantity)){
         alert("준비수량이 부족합니다!");
         $("#trQuantity").val(1); 
      }
      var orderPrice=$(this).val()*$("#price").text();
      $("#orderPrice").text(orderPrice);
   }); //trQuantity change
   
   $("#commentDelete").on("click",".commentInfo a",function(){
      alert(1);
   });//commentDelete
   
   /*판매 음식 삭제하기*/
   $("#deleteFood").click(function() {
      if(deleteFlag=confirm("삭제하시겠습니까?")){
         $.ajax({
             type:"get",
              url:"${pageContext.request.contextPath}/deleteConfirmAjax.do",
              data:"foodSellNo="+foodSellNo,
              success:function(data){
                 if(data>1)
                    alert("판매중인 상품이 있어 삭제할 수 없습니다.");
                 else{
                    alert("상품이 삭제되었습니다.");
                    location.href="${pageContext.request.contextPath}/deleteFoodSell.do?foodSellNo="+foodSellNo+"&sellerId="+$("#sellerId").val();
                 }
              }  
         }); //ajax   
      }
   }); //delFood click

   /* 판매음식 수정하기  */
   $("#editFoodSell").click(function() {
      if(deleteFlag=confirm("수정하시겠습니까?")){
         $.ajax({
             type:"get",
              url:"${pageContext.request.contextPath}/deleteConfirmAjax.do",
              data:"foodSellNo="+foodSellNo,
              success:function(data){
                 if(data>1){
                    alert("판매중인 상품이 있어 수정할 수 없습니다.");
                 }
                 else{
                  /* location.href="${pageContext.request.contextPath}/editFoodSellView.do?foodSellNo="+$("#foodSellNo").val(); */
                  location.href="${pageContext.request.contextPath}/editFoodSellView.do?foodSellNo="+foodSellNo;
                 }
              } 
         }); //ajax   
      }
   }); //click


   //////////////////////ANSWER_윤주////////////////
   $("#answerBnt").click(function(){
      var answer = $("#ansContent");
      var memId=$("#memId2");
       $.ajax({
         type:"get",
         url:"${pageContext.request.contextPath}/answerRegister.do",
         data:"questNo=1&memId2="+memId.val()+"&ansContent="+answer.val(),
         dataType:"json",
         success:function(data){
             var info="<tr>";
            info+="<td>"+data.ansNo+"</td>";
            info+="<td>"+data.ansContent+"</td>";
            info+="<td>"+data.memId+"</td>";
            info+="<td>"+data.ansPostdate+"</td>";
            info+="<td><button name=deletecomment class=btn btn-default>x</button></td>";   
            info+="</tr>";
         
            //테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
            if($('#commentTable tr').contents().size()==0){
                     $('#commentTable').append(info);
              }else{
                     $('#commentTable tr:last').after(info);
              }
                     $("#ansContent").val("");
         } 
      });//ajax   
   });//answerSubmit click

   


   $("#loginAndOrder").click(function() {
      if(confirm("로그인 페이지로 이동합니다."))
         location.href="${pageContext.request.contextPath}/loginView.do";
   }); //loginAndOrder click

   commentList(); 
}); //ready
   
   //댓글달기!      
   /* var foodSellNo = "${foodSell.foodSellNo}"; //게시글 번호
   alert(foodSellNo); */
      
   /////////////////////////////end윤주////////////////////////////
      
   //댓글달기!      
   $("[name=commentInsertBtn]").click(function(){ //댓글 등록 버튼 클릭시
      var insertData = $("[name=commentInsertForm]").serialize(); //commentInsertForm의 내용을 가져옴
      commentInsert(insertData); //Insert 함수호출(아래)
   });
    
    //댓글 목록 
   function commentList(){
       $.ajax({
           url : "${pageContext.request.contextPath}/commentList.do",
           type : "get",
           data : {"foodSellNo":foodSellNo},
           success : function(data){
               var a =""; 
               $.each(data, function(key, value){ 
                   a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                   a += '<div class="commentInfo'+value.questNo+'">'+'댓글번호 : '+value.questNo+' / 작성자 : '+value.memId;
                   a += '<a onclick="commentUpdate('+value.questNo+'\''+value.questContent+'\')"> 수정 </a>';
                  /*  a += '<a onclick="commentDelete('+value.questNo+');"> 삭제 </a> '; */
                     a += '<a id="commentDelete"> 삭제 </a> ';
                   a += '<div class="commentContent'+value.questNo+'"> <p> 내용 : '+value.questContent +'</p>'+'</div>';
                   a += '</div></div>';
             });

             
               $(".commentList").html(a);
           }
       });
   }
   //댓글 등록
   
   function commentInsert(insertData){
      alert(1);
       $.ajax({
           type : "get",
           url : "${pageContext.request.contextPath}/commentInsert.do",
           data : insertData,
           success : function(data){
                if(data== 1) {
                   commentList(); //댓글 작성 후 댓글 목록 reload
                   $("[name=content]").val("");
                }//if
           }//success
       }); //ajax
   }//function

   //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
   function commentUpdate(questNo, questContent){
       var a ="";
       
       a += '<div class="input-group">';
       a += '<input type="text" class="form-control" name="content_'+questNo+'" value="'+questContent+'"/>';
       a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+questNo+');">수정</button> </span>';
       a += '</div>';
       
       $('.commentContent'+questNo).html(a);
       
   }
    
   //댓글 수정
   function commentUpdateProc(questNo){
       var updateContent = $("[name=content_"+questNo+"]").val();
       
       
       $.ajax({
           url : "${pageContext.request.contextPath}/commentUpdate.do",
           type : "get",
           data : {"content" : updateContent, "questNo" : questNo},
           success : function(data){
               if(data == 1) commentList(questNo); //댓글 수정후 목록 출력 
           }
       });
   }
    
   //댓글 삭제 
   function commentDelete(questNo){
      alert("1");
       $.ajax({
           url : "${pageContext.request.contextPath}/commentUpdate.do?questNo="+questNo,
           type : "get",
           success : function(data){
               if(data == 1) commentList(foodSellNo); //댓글 삭제후 목록 출력 
           }
       });
   }

   function orderFoodConfirm(){ //윤주
      var isLogin = $("#checkId").val();
      if(isLogin==null || isLogin==""){
         var flag = confirm("로그인하셔야 구매 가능합니다. 로그인하시겠습니까?");
         if(flag)
            location.href="loginView.do";
         else
            history.go(0);
      }
      else
         return confirm("구매하시겠습니까?");
      return false; 
   }
</script>

<section id="recent-list" class="agency" style="margin-top: 150px">
<div id="page-container">
	<div class="container">
		<div class="row">
			<h2>판매상세정보</h2>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="agent-box-card grey">
					<div class="image-content">
						<div class="image image-fill">
							<img alt="Image Sample" src="${pageContext.request.contextPath}/resources/images/${foodSell.foodMainImg}">
						</div>						
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<h1 class="name">${foodSell.foodName}</h1>
				<div class="row">
				<div class="col-md-11">
				<table class="table">
					<tr>
						<th>음식평점</th>
						<td colspan="3">${foodSell.foodScore}</td>
					</tr>
					<tr>
						<th>예약마감일</th>
						<td>${foodSell.closeDate}</td>
						<th>거래일</th>
						<td>${foodSell.trDate}</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><span id="price">${foodSell.price}</span> 원</td>
						<th>양(개당)</th>
						<td>${foodSell.unit}</td>
					</tr>
					<tr>
						<th>준비수량</th>
						<td><span id="preQuantity">${foodSell.preQuantity}</span>&nbsp;(${foodSell.unit })</td>
						<th>남은수량</th>
						<td><span id="leftQuantity">${leftQuantity}</span>&nbsp;(${foodSell.unit })</td>
					</tr>
					<tr>
						<th>거래장소</th>
						<td colspan="3">${foodSell.loc}</td>
					</tr>
					<tr>
						<th>음식소개</th>
						<td colspan="3">${foodSell.foodDe}</td>
					</tr>
					<tr>
						<th>판매추가정보</th>
						<td colspan="3">${foodSell.sellDetail}</td>
					</tr>						
				</table>
				</div> <!-- col-md-10 --> 
				</div> <!-- row  -->
				<div class="row col-md-11">
				<hr>
				
					<form action="${pageContext.request.contextPath}/orderFood.do" onsubmit="return orderFoodConfirm()" >
						<input type="hidden" name="foodSellVO.foodSellNo" value="${foodSell.foodSellNo}" id="foodSellNo"/>
						<input type="hidden" name="sellerId" value="${foodSell.memId}" id="sellerId"/>
					<div class="row"> 
						<input type="hidden" name="foodSellVO.foodSellNo" value="${foodSell.foodSellNo}" id="foodSellNo"/> 
						<input type="hidden" name="sellerId" value="${foodSell.memId}" id="sellerId"/>
					<c:choose>
					<c:when test="${foodSell.memId!=mvo.memId || mvo.memId=='' || mvo.memId==null}">
					 <div class="col-sm-2" style="text-align: right">구매수량:</div>
					  <div class="col-sm-2">
				        <input type="number" min="1" name="trQuantity" id="trQuantity" class="form-control" style="width: 100px"/>
				      </div>
					
						<sec:authorize access="hasRole('ROLE_BUYER')"><!--구매자 권한 설정 -->
 							<input type="hidden" name="memId" id="checkId" value="${mvo.memId }">
 						</sec:authorize>
				
 						
				      	<label class="control-label" for="거래가격">거래가격:
						<span id="orderPrice"></span>
						</label>
					</c:when>
					</c:choose>
					</div> <!-- row -->
 						
 						<div class="row" align="center">
	 						<c:choose>
		 						<c:when test="${foodSell.memId!=mvo.memId}">
									<input type="submit"  class="btn btn-default" style="margin-top: 20px;"  value="구매하기">
		 						</c:when>
								<c:otherwise>
									<input type="button"  class="btn btn-default" id="editFoodSell" style="margin-top: 20px;"  value="수정하기">
									<input type="button"  class="btn btn-default" id="deleteFood" style="margin-top: 20px;" value="삭제하기">
								</c:otherwise> 						
	 						</c:choose>
						</div>
					</form>
				</div>
			</div> <!-- col-md-9 -->	
		</div> <!-- row -->
		
	</div> <!-- container  -->
</div> <!-- page-container -->
<br><br>
<hr>
	<div class="container">
		<div class="row">
				<c:choose>
				<c:when test="${fn:length(rlist.list)==0}">
				<h4>작성된 후기가 없습니다</h4>
				</c:when>
				<c:otherwise>
			<table class="table table-hover" style="text-align: center;font-size: 12px;">
					<thead>
					<tr class="tr_visible">
						<td>NO</td>
						<td>별점</td>
						<td>내용</td>
						<td>작성자</td>
						<td>날짜</td> 
					</tr>
					</thead>
					<tbody>
				<c:forEach items="${rlist.list }" var="r">
					<tr>
						<td>${r.revNo }</td>
						<td align="left">
								<span class="star_rating">  <!-- 별점 표현 -->
      							<c:forEach begin="1" end="${r.score}">
    							<a class="on">★</a>
								</c:forEach>
       							</span>
						${r.score }
						</td>
						<td>${r.revContent }</td>
						<td>${r.memId }</td>
						<td>${r.revPostdate }</td>
					</tr>
				</c:forEach>
					</tbody>
			</table>
				</c:otherwise>
				</c:choose>
		</div>
		<c:set value="${rlist.pb }" var="pb"/>
	<div class="row center-block pagination"  align="center">
	  <ul class="pagination">
		<c:if test="${pb.previousPageGroup}">
		    <li><a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=${sellfood.foodSellNo }&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:if>

	  	<c:forEach var="pageNum"  begin="${pb.startPageOfPageGroup}"  end="${pb.endPageOfPageGroup}">
	  		<c:choose>
	  			<c:when test="${pageNum==pb.nowPage}">
			    	<li class="active"><a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=${foodSell.foodSellNo }&pageNo=${pageNum}">${pageNum}</a></li>
	  			</c:when>
	  			<c:otherwise>
			    	<li><a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=${foodSell.foodSellNo }&pageNo=${pageNum}">${pageNum}</a></li>
	  			</c:otherwise>
	  		</c:choose>
	  	</c:forEach>

		<c:if test="${pb.nextPageGroup}">
		    <li><a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo=${foodSell.foodSellNo }&pageNo=${pb.startPageOfPageGroup+1}">&raquo;</a></li>
		</c:if>
	  </ul>
	</div>
	</div>
	
	


<hr>
<!--  댓글  -->
    <div class="container">
        <label for="content">Q&A</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="foodSellNo" value="${foodSell.foodSellNo}"/>
               <input type="hidden" name="memId" value="${mvo.memId}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>


	<!-- QNA "ANSWER"-윤주 -->
	<hr>
	<sec:authorize access="isAuthenticated()">
	<div class="container">
		<div class="row">
		   <table class="table table-condensed">
		    <tr>
		        <td>
		        <%-- <form action="${pageContext.request.contextPath}/answerRegister.do"> --%>
			           <span class="form-inline" role="form">               
			              <textarea id="ansContent" name="ansContent" class="form-control col-lg-12" rows="4" style="resize: none; width:95%;height:35px" required="required"></textarea><br>
			           	  <input type="hidden" name="memId2" id="memId2" value="${mvo.memId }">
			           	 <%--<input type="hidden" name="questNo" value="1"> --%>
			           	  <span style="float:right;margin-top: 10px;margin-right: 58px;" >
			           	  	<input type="button" id="answerBnt" class="btn btn-danger" value="답변작성">
			           	  </span>
			           </span>
			<!-- 	</form>      -->     	 
 	        </td>
		    </tr>
		  </table><!-- 답변달기 -->
		</div><!-- row -->
	</div> <!-- container -->
	</sec:authorize>

</section>	<!-- recent-list -->			

