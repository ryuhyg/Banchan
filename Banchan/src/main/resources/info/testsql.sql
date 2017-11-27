--table 삭제
drop table review;
--table 생성
CREATE TABLE REVIEW
(
   REV_NO NUMBER  PRIMARY KEY,
   SCORE NUMBER  NULL ,
   REV_CONTENT CLOB  NOT NULL ,
   REV_POSTDATE DATE  NOT NULL ,
   FOOD_NO NUMBER  NOT NULL,
    constraint REVIEW_FK foreign key(FOOD_NO) references FOOD(FOOD_NO)
);
--sequence 삭제
drop sequence review_seq;
--sequence 생성
create sequence review_seq nocache;
--insert review data   (food_no는 각자 사용하는  음식 번호를 집어 넣으세요)
insert into review(rev_no, score, rev_postdate, rev_content, food_no) 
values(review_seq.nextval, 5 ,sysdate, '진짜 맛있었어요 주부님짱짱 또 구매하고 싶네요~~!^^', 1001);

insert into review(rev_no, score, rev_postdate, rev_content, food_no) 
values(review_seq.nextval, 2, sysdate, '별로 제 입맛에는 맞지 않았지만 다른분들은 좋아하실수도 있겠네요', 1001);

insert into review(rev_no, score, rev_postdate, rev_content, food_no) 
values(review_seq.nextval, 4, sysdate, '다시 구매하고 싶어요!ㅇㅇ주부님 감사해요~~', 1001);

	
select * from seller
	


select m.mem_id, m.mem_name, a.address_api, s.seller_img, s.seller_info, s.seller_score 
from (select mem_id, seller_score, seller_info, seller_img, rank() over(order by seller_score desc) as rank from seller)
s, ban_mem m, address a 
where m.mem_id=s.mem_id and m.address_no=a.address_no and rownum<=3



select * from (
			 select  m.mem_id, m.mem_name, a.address_api, s.seller_img, s.seller_info, s.seller_score, 
			 		  rank() over (order by seller_score desc) as rank,
			 from seller s, ban_mem m, address a
			 )
where rownum <= 5
					
					
					
					
					
					