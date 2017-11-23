<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>반찬창고 - 내 주변의 엄마음식</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">                            <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/font-awesom/css/font-awesome.min.css">  <!-- Font Awesome -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/mmenu/jquery.mmenu.all.css" />          <!-- Menu Responsive -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/animate-wow/animate.css">               <!-- Animation WOW -->	
	
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/nouislider/nouislider.min.css">         <!-- Slider Price -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/easydropdown/easydropdown.css">         <!-- Select form Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/skill-bars/skill-bars.css">             <!-- Skill Bars -->
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ui-spinner.css">                               <!-- Spinner -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/labelauty/labelauty.css">               <!-- Checkbox form Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">                                     <!-- Include Menu stylesheet -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">                                   <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/media-query.css">                              <!-- Media Query -->
    
    

	<!-- Use Iconifyer to generate all the favicons and touch icons you need: http://iconifier.net -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon/icon.png" type="image/x-icon" /><!-- 아이콘 --> 
	
	<!-- <link rel="apple-touch-icon" href="resources/images/favicon/apple-touch-icon.png" />
	<link rel="apple-touch-icon" sizes="57x57" href="resources/images/favicon/apple-touch-icon-57x57.png" />
	<link rel="apple-touch-icon" sizes="72x72" href="resources/images/favicon/apple-touch-icon-72x72.png" />
	<link rel="apple-touch-icon" sizes="76x76" href="resources/images/favicon/apple-touch-icon-76x76.png" />
	<link rel="apple-touch-icon" sizes="114x114" href="resources/images/favicon/apple-touch-icon-114x114.png" />
	<link rel="apple-touch-icon" sizes="120x120" href="resources/images/favicon/apple-touch-icon-120x120.png" />
	<link rel="apple-touch-icon" sizes="144x144" href="images/favicon/apple-touch-icon-144x144.png" />
	<link rel="apple-touch-icon" sizes="152x152" href="resources/images/favicon/apple-touch-icon-152x152.png" /> -->

	<script src="${pageContext.request.contextPath}/resources/script/modernizr.min.js"></script>	


<title><tiles:insertAttribute name="title" ignore="true" /></title>
<script src="//code.jquery.com/jquery.min.js"></script>

  </head>
  
  <!-- Tiles 적용 부분 -->
  <body class="fixed-header">
<div id="container">

	<div id="header">
		<tiles:insertAttribute name="header" />
	</div><!-- 헤더 -->
	
	<div id="main">
		<tiles:insertAttribute name="main" />
	</div><!-- 메인 -->
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div><!-- 푸터 -->
	
</div>


	<script	src="${pageContext.request.contextPath}/resources/script/jquery.min.js"></script>		<!-- jQuery	(necessary for Bootstrap's JavaScript plugins) -->
	<script	src="${pageContext.request.contextPath}/resources/script/jquery-ui.min.js"></script>		<!-- jQuery	UI is a	curated	set	of user	interface interactions,	effects, widgets, and themes -->
	<script	src="${pageContext.request.contextPath}/resources/script/bootstrap.min.js"></script>		<!-- Include all compiled plugins (below), or include individual files as needed -->

	<script	src="${pageContext.request.contextPath}/resources/script/vendor/mmenu/mmenu.min.all.js"></script>					<!-- Menu Responsive -->
	<script	src="${pageContext.request.contextPath}/resources/script/vendor/animation-wow/wow.min.js"></script>					<!-- Animate Script	-->
	<script src="${pageContext.request.contextPath}/resources/script/vendor/labelauty/labelauty.min.js"></script>					<!-- Checkbox Script -->
	<script	src="${pageContext.request.contextPath}/resources/script/vendor/parallax/parallax.min.js"></script>						<!-- Parallax Script -->
	<script	src="${pageContext.request.contextPath}/resources/script/vendor/images-fill/imagesloaded.min.js"></script>			<!-- Loaded	image with ImageFill -->
	<script src="${pageContext.request.contextPath}/resources/script/vendor/images-fill/imagefill.min.js"></script>					<!-- ImageFill Script -->
	<script	src="${pageContext.request.contextPath}/resources/script/vendor/easydropdown/jquery.easydropdown.min.js"></script>	<!-- Select	list Script	-->
	
	<script	src="${pageContext.request.contextPath}/resources/script/vendor/carousel/responsiveCarousel.min.js"></script>		<!-- Carousel Script -->
	<script	src="${pageContext.request.contextPath}/resources/script/vendor/noui-slider/nouislider.all.min.js"></script>				<!-- Range Slider -->
	<script	src="${pageContext.request.contextPath}/resources/script/vendor/skill-bars/custom.js"></script>						<!-- Skill Bars	Script -->

	<script	src="${pageContext.request.contextPath}/resources/script/custom.js"></script>		<!-- Custom	Script -->

<!-- ************************************************************ -->
	<script>

		"use strict";

		$(function() {
			$("#accordion").accordion({
				heightStyle: "content"
			});
			$("#toggle h3").click(function() {
				$(this).hasClass('toggle-attive') ? 
				$(this).next().removeClass('toggle-attive') : 
				$(this).next().slideToggle({
					duration: 400,
					easing: 'linear'
				});
			});
		});

	</script>

  </body>
</html>