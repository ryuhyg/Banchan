<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- services와 clusterer, drawing 라이브러리 불러오기 : MAP sdk -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98caf95ee9ce0f476e2beb58b89d2a54&libraries=services,clusterer,drawing">
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98caf95ee9ce0f476e2beb58b89d2a54"></script>  
 <!-- 우편번호 api -->
 <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>


<section id="recent-list" style="margin-top: 250px;">
	<div class="container">
			<div class="row">
				<div class="col-sm-2"><!-- left -->
				
				</div>
					<div class="col-sm-8">
						<div class="blog-list blog-detail">
							<h3 class="title-form"><i class="icon fa fa-comment" style="margin-right: 5px"></i>위치기반</h3>
		
		
								<div id="map" style="width:400px;height:270px;"></div>
							
							
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
	        center: new daum.maps.LatLng(33.45757984985129, 126.55277187967573), // 지도의 중심좌표
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
	
</script>
