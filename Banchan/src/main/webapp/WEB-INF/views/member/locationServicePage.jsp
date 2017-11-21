<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- services와 clusterer, drawing 라이브러리 불러오기 : MAP sdk -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98caf95ee9ce0f476e2beb58b89d2a54&libraries=services,clusterer,drawing">
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98caf95ee9ce0f476e2beb58b89d2a54"></script>  
 <!-- 우편번호 api -->
 <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
	
	
});//$(document).ready
</script>



<section id="recent-list" style="margin-top: 250px;">
	<div class="container">
			<div class="row">
				<div class="col-sm-2"><!-- left -->
				
				</div>
					<div class="col-sm-8">
						<div class="blog-list blog-detail">
							<h3 class="title-form"><i class="icon fa fa-comment" style="margin-right: 5px"></i>위치기반</h3>
		
		
								<div id="map" style="width:400px;height:270px;"></div>
							

	<br>
	<div id="tableDiv">
		<table class="searchTable" >
		<tbody >	
		<c:forEach items="${list}" var="s">
				<tr>
				<th rowspan="4" class="searchImgTh">
				<a href="">
				<img class="searchImg" src="">
				</a>
				</th>
				<td> <a href="">타이틀</a> </td>
				</tr>				
				<tr><td>${s.memId}  | ${s.addressVO.addressNo}  |  ${s.sellerInfo} </td></tr>
				<tr><td>${s.addressDe}  |  출연:${s.tel} |  등급: ${s.memName}</td></tr>	
				<tr><td>
				<%-- <c:if test="${sessionScope.membervo.authority eq '관리자'}">
				<form action="DispatcherServlet">
						<input type="hidden" name="command" value="cmdMeetingRegisterForm">
						<input type="hidden" name="mNo" value="ㄹㄹㄹ">	
						<input type="hidden" name="title" value="ㄹㄹ">					
						<input type="submit" value="모임등록">
				</form>
				</c:if> --%>
 				</td></tr>	
		</c:forEach>				
		</tbody>					
		</table>
	</div>
						</div>
					</div>	
							
							
					<div class="col-sm-2"><!-- right -->

					</div>
				</div>
	</div>
</section>








<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(${list[0].addressVO.latitude}, ${list[0].addressVO.longitude}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	////////////////////////////
	
	var imageSrc = 'http://cfile29.uf.tistory.com/image/26141842593FFAC702AAF0', // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new daum.maps.LatLng(${list[0].addressVO.latitude}, ${list[0].addressVO.longitude}); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition, 
	    image: markerImage // 마커이미지 설정 
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);  
	
	var iwContent = '<div style="padding:5px;">Hello World! <br><a href="http://map.daum.net/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">존맛</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new daum.maps.LatLng(${list[0].addressVO.latitude}, ${list[0].addressVO.longitude}); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커에 클릭이벤트를 등록합니다
	daum.maps.event.addListener(marker, 'click', function() {
	      // 마커 위에 인포윈도우를 표시합니다
	      infowindow.open(map, marker); 
	      $("#tableDiv").html("<td>dddd</td>");
	});
</script>
