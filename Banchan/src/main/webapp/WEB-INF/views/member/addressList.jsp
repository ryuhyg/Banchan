<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>   
<script type="text/javascript">
	$(document).ready(function(){		
		$("#address").change(function(){				
			$("#memberListView").empty();
			if($("#address").val()==""){
				return;
			}
			$.ajax({
				type:"post",
				url:"findMemberListByAddress.do",
				data:"address="+$("#address").val(),
				dataType:"json",
				success:function(json){					
						var data="<table border='1' cellpadding='5'>";
						for(var i=0;i<json.length;i++){
							data+="<tr>";
							data+="<td>"+json[i].id+"</td>";
							data+="<td>"+json[i].name+"</td>";
							data+="</tr>";
						}
						data+="</table>";
						$("#memberListView").html(data);				
				}//function
			});//ajax
		});//click
	});//jquery
</script>
</head>
<body>
<select id="address">
	<option value="">--주소--</option>
	<c:forEach items="${list}" var="addr">
	<option value="${addr}">${addr}</option>
	</c:forEach>
</select>  
<br><br><br><br>
<div id="memberListView"></div>
<%--		주소를 선택하면 ajax 방식으로 
			div 영역에 테이블형식으로 
			아이디 이름을 보여준다 
 --%>














