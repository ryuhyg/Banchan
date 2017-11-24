<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
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
</style>

<script type="text/javascript">
//별점기능 javascript
$(document).ready(function() {
	 $(".star_rating a").removeClass("on");
	 $( ".star_rating a" ).click(function() {
	     $(this).addClass("on").prevAll("a").addClass("on");
	     var star = $(this).prevAll("a").length+1;
	    
	     $("#pstar").text(star);
	     $("#pstarhidden").val(star);
	    
	     $( ".star_rating a" ).click(function() {
	     	if(($(this).prevAll("a").length+1)<star){
	     		$(".star_rating a").removeClass("on");    	
	     		$(this).addClass("on").prevAll("a").addClass("on");
	     	}
	     }); //click
	});//click
});//ready
</script>

<script type="text/javascript">
//후기작성 javascript & jquery/ajax
$(document).ready(function() {
    $("#commentParentSubmit").click(function() {
    	var pText = $("#commentParentText");
    	if($.trim(pText.val())==""){ //후기작성안하고 '후기작성'버튼 눌렀을 때 
    		 alert("내용을 입력하세요.");
	            pText.focus();
	            return;
    	}else{
			$.ajax({
			type:"get",
			url:"DispatcherServlet",
			data:"command=addcomment&pno=${pvo.pno}&mid=${sessionScope.mvo.mid}&comcontent="+pText.val(),
			dataType:"json",
			success:function(data){
				var info="<tr>";
				info+="<td>"+data.comno+"</td>";
				info+="<td>"+data.mid+"</td>";
				info+="<td>"+data.comcontent+"</td>";
				info+="<td align=right>"+data.comdate+"</td>";
				info+="<td><button name=deletecomment class=btn btn-default>x</button></td>";	
				info+="</tr>";
			
				//테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
				if($('#commentTable tr').contents().size()==0){
			            $('#commentTable').append(info);
			        }else{
			            $('#commentTable tr:last').after(info);
			        }
			   $("#commentParentText").val("");
			}
		});//ajax	
		}//else
    });//click
});//ready
</script>    
    
<section id="recent-list" style="margin-top: 350px;">
	<div class="container">
[후기작성]
<table id="commentTable" class="table table-condensed mytable">
<%-- 
	REVIEW TABLE에서 정보 가져와서 뿌려줄 예정_윤주
<c:forEach items="${requestScope.pvo.commentList }" var="comment">
	<tr>
		<td>${comment.comno }</td>
		<td>${comment.mid }</td><td>${comment.comcontent }</td><td align="right">${comment.comdate }</td>
		<c:if test="${sessionScope.mvo.mid == comment.mid }">
			<td>
			<button name="deletecomment" class="btn btn-default">x</button>
			</td>
		</c:if>
	</tr>
</c:forEach> --%>
</table>
   <table class="table table-condensed">
    <tr>
        <td>
           <span class="form-inline" role="form">               
              <textarea id="commentParentText" class="form-control col-lg-12" rows="4" style="resize: none; width:100%;height:30px" required="required"></textarea><br>
		              별점&nbsp;
				<span class="star_rating">
				    <a href="#" class="on">★</a>
				    <a href="#" class="on">★</a>
				    <a href="#" class="on">★</a>
				    <a href="#" class="on">★</a>
				    <a href="#" class="on">★</a>
				</span>
				<input type="hidden" name="pstar" value="" id="pstarhidden">
				<span id="pstar"></span><br>
              <br>
           	  <span style='float:right'><input type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-danger" value="후기작성"></span>
           </span>
        </td>
    </tr>
  </table>

	</div>
</section>