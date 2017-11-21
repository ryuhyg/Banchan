<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section id="recent-list" class="agency" style="margin-top: 350px">
<h2>판매상세정보</h2>

${sellfood}

	<div id="page-container">
		<section id="agent-page">
			<div class="container">
				<div class="col-md-2">
					<div class="agent-box-card grey">
						<div class="image-content">
							<div class="image image-fill">
								<img alt="Image Sample" src="http://placehold.it/512/bbbbbb/ffffff">
							</div>						
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<h1 class="name">${sellfood.foodName}</h1>
						<span class="text">
								예약마감일: ${sellfood.closeDate}<br>
								거래일: ${sellfood.trDate }<br>
								거래장소(상세): ${sellfood.loc}<br>
								가격:  ${sellfood.price}<br>
								준비수량:  ${sellfood.preQuantity} 개<br>
								수량당 양 : ${sellfood.unit}<br>
								
								음식소개:  ${sellfood.foodDe}<br>
								음식평점: ${sellfood.foodScore}<br>
						</span>
						<div class="bs-callout callout-success">
						  <h4 class="title">상세정보</h4>
						  <p class="text">${sellfood.sellDetail}</p>
					
						</div>
						<div class="row">
							<div class="col-md-4 space-div" style="float: right">
								<label>구매수량</label>
								<input class="form-control" type="number" name="quantity" id="quantity" value="1" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 space-div" style="float: center">
								<button type="button" class="btn btn-default">구매하기</button>
						</div>
				</div>
				</div>
			</div>
		</section>
	</div>
</section>				
<%-- 				<!-- /////////////////////////////////////////////////////////// -->
					<!-- <div class="col-md-9"> -->
						<div class="row">
							<div class="col-sm-4 col-md-4 col-sm-pull-8">
								<!-- . Agent Box -->
								<div class="agent-box-card grey">
									<div class="image-content">
										<div class="image image-fill">
											<img alt="Image Sample" src="http://placehold.it/512/bbbbbb/ffffff">
										</div>						
									</div>
								</div>
							</div><!-- /.col-md-4 -->
						
							<div class="col-sm-8 col-md-8 col-sm-push-4">
								<h1 class="name">${sellfood.foodName}</h1>
								<span class="text" >
									
								예약마감일: ${sellfood.closeDate}<br>
								거래일: ${sellfood.trDate }<br>
								거래장소(상세): ${sellfood.loc}<br>
								가격:  ${sellfood.price}<br>
								준비수량:  ${sellfood.preQuantity} 개<br>
								수량당 양 : ${sellfood.unit}<br>
								
								음식소개:  ${sellfood.foodDe}<br>
								음식평점: ${sellfood.foodScore}<br>
								
								</span>
								<div class="bs-callout callout-success">
									
								  <h4 class="title">상세정보</h4>
								  <p class="text">${sellfood.sellDetail}</p>
							
								</div>
								<div class="row">
									
									<div class="col-md-4 space-div" style="float: right">
										<label>구매수량</label>
										<input class="form-control" type="number" name="quantity" id="quantity" value="1" />
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 space-div" style="float: center">
										<button type="button" class="btn btn-default">구매하기</button>
									</div><!-- ./footer -->
								</div>
							</div><!-- /.col-md-8 -->
							
						</div><!-- /.row -->

					<!-- </div> -->
				</div><!-- ./row -->


			</div><!-- ./container -->
		</section><!-- /#about-us -->

	</div><!-- /#page-container -->
</section> --%>