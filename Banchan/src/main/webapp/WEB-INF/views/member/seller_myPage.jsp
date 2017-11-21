<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<section id="agent-page" style="margin-top: 350px;">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div class="row">
							<div class="col-sm-8 col-md-8 col-sm-push-4">
								<h1 class="name">${svo.memName } </h1>
								<span class="text">
								주부님 소개
								</span>
								<div class="bs-callout callout-success">
								  <h4 class="title">믿고먹는 주부님</h4>
								  <p class="text">${svo.sellerInfo }</p>
								</div>
							</div><!-- /.col-md-8 -->
							<div class="col-sm-4 col-md-4 col-sm-pull-8">
								<!-- . Agent Box -->
								<div class="agent-box-card grey">
									<div class="image-content">
										<div class="image image-fill">
											<!-- <img alt="Image Sample" src="resources/images/${svo.sellerImg }"> -->
											<img alt="Image Sample" src="resources/images/${svo.sellerImg }">
										</div>						
									</div>
									<div class="info-agent">
										<div class="text" style="text-align:center">
											<b>별점:${svo.sellerScore}</b>
										</div>
										<ul class="contact">
											<li><a class="icon" href="#"><i class="fa fa-facebook"></i></a></li>
											<li><a class="icon" href="#"><i class="fa fa-google-plus"></i></a></li>
											<li><a class="icon" href="#"><i class="fa fa-twitter"></i></a></li>
											<li><a class="icon" href="#"><i class="fa fa-envelope-o"></i></a></li>
											<li><a class="icon" href="agent-detail.html"><i class="fa fa-info-circle"></i></a></li>
										</ul>
									</div>
								</div>

							</div><!-- /.col-md-4 -->
						</div><!-- /.row -->

					</div>
					<input type="button" value="판매내역보기">
				</div><!-- ./row -->

				<div class="section-title line-style no-margin">
					<h3 class="title">내 음식</h3>
				</div>

				<div class="my-property" data-navigation=".my-property-nav">
					<div class="crsl-wrap">
					<!-- 받아온 음식 반복 구간 -->
					<c:forEach items="${flist}" var="food">
						<figure class="crsl-item">
							<div class="box-ads box-grid">
								<a class="hover-effect image image-fill" href="property-detail.html">
									<span class="cover"></span>
									<img alt="Sample images" src="http://placehold.it/1240x745/bbbbbb/ffffff">
									<h3 class="title">${food.foodName}</h3>
								</a>								
								<span class="description">${food.foodDe}</span>
								<dl class="detail">
									<dt class="status">기타:</dt><dd><span>테스트1</span></dd>
									<dt class="bed">기타:</dt><dd><span>테스트2</span></dd>
									<dt class="bath">기타:</dt><dd><span>테스트3</span></dd>
								</dl>
								<div class="footer">
									<a class="btn btn-default" href="property-detail.html">판매등록</a>
								</div>
							</div>
						</figure>
					</c:forEach>
						
					<div class="my-property-nav">
						<p class="button-container">
							<a href="#" class="next">next</a>
							<a href="#" class="previous">previous</a>
						</p>
					</div>

				</div><!-- /.my-property slide -->

			</div><!-- ./container -->
		</section><!-- /#about-us -->
