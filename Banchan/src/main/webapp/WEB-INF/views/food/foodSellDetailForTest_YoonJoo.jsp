<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
   <!-- String memId = y3qpmm /ban_mem table
   String foodSellNo;=101010 /food_sell table
   String foodNo = 1001 /food table
   int preQuantity =10 준비수량/food_sell table 
   int trQuantity = 2 주문수량 / trade table

CREATE TABLE TR_STATUS
(
   TR_STATUS_NO NUMBER  PRIMARY KEY ,
   TR_STATUS VARCHAR2(100)  NOT NULL 
);
insert into tr_status(tr_status_no, tr_status) values(1,'거래중');      
insert into tr_status(tr_status_no, tr_status) values(2,'거래완료'); 
   -->
    <sec:authentication var="mvo" property="principal" />
<section id="recent-list" style="margin-top: 350px;">
	<div class="container">
	<form action="orderFoodForm.do">
	<input type="hidden" name="memId" value="java"><!-- java를 세션아이디로 넘김 -->
	판매가격:<input type="text" name="price" value=6000 readonly="readonly">원 <br>
	준비수량:<input type="number" name="preQuantity" value=10 readonly="readonly"><br>
	주문수량:<input type="number" name="trQuantity"><br>
	<span id="totalPrice"></span><br>
	<input type="submit" value="바로구매">
	</form>
	</div>
</section>