<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	
	var str = "";
	str = '${cookie['click'].value}';
	//alert("${cookie['click'].value}");
	var arr = str.split('/');
	//alert(arr); 
	var strHtml='';
	for (var i = 0; i < arr.length-1; i++) { //-1은 ""빈공간 때문.
	//	alert(arr[i]);
		var index = arr[i].indexOf(':');
		var foodSellNo = arr[i].substr(0, index);
		var foodMainImg = arr[i].substr(7,arr[i].length);	
		strHtml+= 
			'<a href="${pageContext.request.contextPath}/getFoodSellDetail.do?foodSellNo='+foodSellNo+'" style="size:inherit;">'+ 
		'<img alt="" src="${pageContext.request.contextPath}/resources/images/'+foodMainImg+'" style="width:50px; height:50px; padding:1px;">'+
		'</a>';
		
	}
	$("#clickDiv").html(strHtml);
});
</script>
   <div class="col-md-1 list-group" style="float:right; margin-left:10px; margin-top: 150px; position: fixed; width: 100px; ">
   		<p style="font-size: small;">최근 클릭 <br>클릭 상품</p>
   		<div class="list-group-item list-group-item" id="clickDiv" style="size:inherit; ">
		
		</div> 
   </div>