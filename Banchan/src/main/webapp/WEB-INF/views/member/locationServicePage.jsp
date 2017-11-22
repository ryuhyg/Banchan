<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- services와 clusterer, drawing 라이브러리 불러오기 : MAP sdk -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98caf95ee9ce0f476e2beb58b89d2a54&libraries=services,clusterer,drawing">
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98caf95ee9ce0f476e2beb58b89d2a54"></script>  
 <!-- 우편번호 api -->
 <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	
	$("#searchaddress").click(function() {
		  new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               // document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
	              //  document.getElementById('sample4_roadAddress').value = fullRoadAddr;
	               // document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
	                $("#jibunAddress").val(data.jibunAddress);
	                $("#jibunAddress").trigger("change");
	            }
	        }).open();
	});//$("#searchaddress").click
	
	$("#jibunAddress").change(function() {
		//alert($(this).val());
		// 주소-좌표 변환 객체를 생성합니다  
		var geocoder = new daum.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($(this).val(), function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:100px;text-align:center;padding:6px 0;">검색위치</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    }
		});   
	});//$("#jibunAddress").change 
	
	
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
								
							<input class="btn btn-default" type="button" id="searchaddress" value="주소 찾기">
							<br>
							<input type="text" id="jibunAddress" class="margin-bottom form-control" placeholder="검색 주소"  readonly="readonly">
							<br>	
							<div id="map" style="width:400px;height:270px;"></div>
							

	<br>
	<div >
		<table class="table table-striped" >
		<tbody id="tbodyList">	
		<c:forEach items="${list}" var="s">
				<tr><td><a href="#">${s.memId}</a>  | ${s.addressVO.addressNo}  |  ${s.sellerInfo} </td></tr>
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
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [	
		<c:forEach items="${list}" var="s" >
			{
		        title: '${s.addressVO.addressNo}', 
		        latlng: new daum.maps.LatLng(${s.addressVO.latitude}, ${s.addressVO.longitude})
		    },
		</c:forEach>
	];
	
	
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	    var iwContent = '<div style="padding:5px;"></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new daum.maps.InfoWindow({
	        content: iwContent // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	    daum.maps.event.addListener(marker, 'click', makeClickListener(positions[i].title));
	}

	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	// 마커 클릭시 이벤트 입니다
	function makeClickListener(title) {
	    return function() {
	    	 var strTemp="";
	    			 <c:forEach items="${list}" var="s" >
	    			 	if (title=='${s.addressVO.addressNo}') {
	    		strTemp +="<tr><td rowspan='3'>"+
				"<a href='#'>"+
				"<img src='/banchan/resources/images/김래원.jpg' style='width: 100px;height:100px;'>"+
				"</a>"+
				"</td>"+
				"<td> <a href='#'>"+"???여긴 뭐다냐 ??"+"</a> </td>"+
				"</tr>"+			
				"<tr><td>"+"별점 :  "+"</td></tr>"+
				"<tr><td>"+"판매자 소개: ${s.sellerInfo}"+"</td></tr>";
	    		}
	    			 </c:forEach>
	    			 alert(strTemp);
	    			 $("#tbodyList").html(strTemp); 
	    };
	}
</script>
