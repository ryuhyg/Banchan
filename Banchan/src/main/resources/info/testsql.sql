----table 삭제
--drop table review;
----table 생성
--CREATE TABLE REVIEW
--(
--   REV_NO NUMBER  PRIMARY KEY,
--   SCORE NUMBER  NULL ,
--   REV_CONTENT CLOB  NOT NULL ,
--   REV_POSTDATE DATE  NOT NULL ,
--   FOOD_NO NUMBER  NOT NULL,
--    constraint REVIEW_FK foreign key(FOOD_NO) references FOOD(FOOD_NO)
--);
----sequence 삭제
--drop sequence review_seq;
----sequence 생성
--create sequence review_seq nocache;
----insert review data   (food_no는 각자 사용하는  음식 번호를 집어 넣으세요)
--insert into review(rev_no, score, rev_postdate, rev_content, food_no) 
--values(review_seq.nextval, 5 ,sysdate, '진짜 맛있었어요 주부님짱짱 또 구매하고 싶네요~~!^^', 1001);
--
--insert into review(rev_no, score, rev_postdate, rev_content, food_no) 
--values(review_seq.nextval, 2, sysdate, '별로 제 입맛에는 맞지 않았지만 다른분들은 좋아하실수도 있겠네요', 1001);
--
--insert into review(rev_no, score, rev_postdate, rev_content, food_no) 
--values(review_seq.nextval, 4, sysdate, '다시 구매하고 싶어요!ㅇㅇ주부님 감사해요~~', 1001);
--
--select * from seller

update trade set tr_status_no=2;

select * from food where mem_id='uuuu1'
select * from food where mem_id='aaaa1'


update food set food_score='2' where food_no='1081' and mem_id='uuuu1'
update food set food_score='3' where food_no='1082' and mem_id='uuuu1'
update food set food_score='4' where food_no='1084' and mem_id='uuuu1'
update food set food_score='1' where food_no='1091' and mem_id='uuuu1'

update food set food_score='5' where food_no='1079' and mem_id='aaaa1'

select * from ban_mem;

		SELECT bm.mem_name, f.food_name, f.food_de, f.food_score, f.food_main_img
		FROM ban_mem bm, seller s, food f, food_sell fs
		WHERE bm.mem_id=s.mem_id and s.mem_id=f.mem_id and f.food_no=fs.food_no and bm.mem_id='uuuu1' order by food_score desc;
		
		
		select bm.mem_name, f.food_no, f.food_name, f.food_de, f.food_score, f.food_main_img, f.rank from
		(select food_no, food_name, mem_id, food_de, food_score, food_main_img, rank() over (order by food_score desc) as rank 
		from food) f, ban_mem bm, seller s
		where bm.mem_id=s.mem_id and s.mem_id=f.mem_id and rank<=3


select mem_id from ban_mem where mem_name='손나은'


	

	update  seller set seller_score=5 where mem_id='aaaa1'
	


select m.mem_id, m.mem_name, a.address_api, s.seller_img, s.seller_info, s.seller_score 
from (select mem_id, seller_score, seller_info, seller_img, rank() over(order by seller_score desc) as rank from seller)
s, ban_mem m, address a 
where m.mem_id=s.mem_id and m.address_no=a.address_no and rank<=3


select * from QUESTION
select * from (
			 select  m.mem_id, m.mem_name, a.address_api, s.seller_img, s.seller_info, s.seller_score, 
			 		 ROW_NUMBER() over (order by seller_score desc) as rank
			 from seller s, ban_mem m, address a 
			 )

where m.mem_id=s.mem_id and rownum <= 3 

select * from ban_mem where mem_id='test'
update seller set seller_score='5' where mem_id='test' 
			


insert into question(quest_no, quest_content, quest_postdate,food_sell_no, mem_id) 
values(question_seq.nextval,'되라', sysdate, 101010, 'java')    


insert into question(quest_no, quest_content, quest_postdate, food_sell_no, mem_id)
values(question_seq.nextval, '많이 맵나요?', sysdate, 101010, 'java');
select * from sequence question_seq nocache;

select * from question_seq;

select quest_no, quest_content, food_sell_no, to_char(to_date(quest_postdate), 'yyyy-mm-dd')as quest_postdate, mem_id
from question
where mem_id='java'
		
select * from question

select quest_no, quest_content, food_sell_no, to_char(to_date(quest_postdate), 'yyyy-mm-dd')as quest_postdate, mem_id
FROM question
WHERE mem_id='java' ORDER BY quest_postdate ASC




select  * from question


where rownum <= 5
					

select * from seller
update seller set seller_score='5' where mem_id='freejh2003';
					
					

-- 인기 Top3 주부님 --
select m.mem_id, m.mem_name, a.address_api, s.seller_img, s.seller_info, s.seller_score , rnum
from (select mem_id, seller_score, seller_info, seller_img, row_number() over(order by seller_score desc) as rnum from seller)
s, ban_mem m, address a 
where m.mem_id=s.mem_id and m.address_no=a.address_no and rnum<=3

-- 인기 Top3 인기음식 --
SELECT bm.mem_name, bm.mem_id, f.food_no, f.food_name, f.food_de, f.food_score, f.food_main_img, f.rnum 
from (select food_no, food_name, mem_id, food_de, food_score, food_main_img, row_number() over (order by food_score desc) as rnum FROM food) 
f, ban_mem bm, seller s
WHERE bm.mem_id=s.mem_id and s.mem_id=f.mem_id and f.rnum<=3

select seller_img, seller_info from seller where
		mem_id='ddddd'

select * from mem_auth


select * from ban_mem where mem_name='ddssss'
update from BAN_MEM where mem_name='ddssss'
delete from ban_mem where mem_name='ddssss'
select * from ENABLE

select * from question
insert into ANSWER(ans_no, ans_content, ans_postdate, mem_id, quest_no) values(answer_seq.nextval, '안녕하세요 답글잘되요', sysdate, 'java', 4);
insert into ANSWER(ans_no, ans_content, ans_postdate, mem_id, quest_no) values(answer_seq.nextval, '배고파', sysdate, 'java', 4);

insert into ANSWER(ans_no, ans_content, ans_postdate, mem_id, quest_no) values(answer_seq.nextval, '윤주예뻐', sysdate, 'java', 4);


select * from seller 
select * from BAN_MEM 
select * from address where address_no=1012

insert into ANSWER(ans_no, ans_content, ans_postdate, mem_id, quest_no) values(answer_seq.nextval, '윤주예뻐', sysdate, 'java', 4);


update trade set tr_status_no='2';

delete from question
select * from question
create sequence question_seq nocache;
drop sequence question_seq
insert into question values(question_seq.nextval,'101014','java2','양파가 들어가나요~?',sysdate)
select * from answer; 
select * from FOOD_SELL;
select * from food
update food set food_score=4.5 where food_no=1003
select * from food_sell
select * from review
delete from review where rev_no='22'
update food_sell set close_date= to_date('2017.12.20 13:44:30','yyyy.MM.DD HH24:MI:SS')
commit
select * from FOOD_SELL;

update seller set seller_score=1.0 where mem_id='jjjjj'
update food set food_score=1.0 where food_no='1017'


select t.tr_no, t.tr_quantity, t.tr_req_date, t.tr_fin_date,
		t.mem_id,
		ts.tr_status,
		fs.tr_date, fs.loc, fs.price,
		f.food_name, f.food_main_img
		from (select row_number() over(order by tr_no desc) as
		rnum, tr_no, tr_quantity, tr_req_date, tr_fin_date, mem_id,
		tr_status_no, food_sell_no from trade) t, tr_status ts, food_sell fs,
		food f, seller s, ban_mem bm
		where s.mem_id='kymkyj' and
		bm.mem_id=s.mem_id and s.mem_id=f.mem_id
		and t.tr_status_no=ts.tr_status_no
		and t.food_sell_no=fs.food_sell_no
		and fs.food_no=f.food_no
		and t.rnum between 1 and 8
		order by t.tr_no desc


select * from seller
select * from BAN_MEM
insert into seller(mem_id, seller_img, seller_info, seller_score) values('dddd','이미지경로','혜자스러운 반찬을 전해드립니다!',4.5 );
insert into seller(mem_id, seller_img, seller_info, seller_score) values('eeee','이미지경로','혜자스러운 반찬을 전해드립니다!',4.5 );
insert into seller(mem_id, seller_img, seller_info, seller_score) values('abcde','이미지경로','혜자스러운 반찬을 전해드립니다!',4.5 );
insert into seller(mem_id, seller_img, seller_info, seller_score) values('freejh20','이미지경로','혜자스러운 반찬을 전해드립니다!',4.5 );
update seller set seller_score=4.5 where mem_id='dddd';
update seller set seller_score=4.5 where mem_id='eeee';
update seller set seller_score=4.5 where mem_id='abcde';
update seller set seller_score=4.5 where mem_id='freejh20';

select m.mem_id, m.mem_name, a.address_api, s.seller_img, s.seller_info, s.seller_score , rank
				from (select mem_id, seller_score, seller_info, seller_img, rank() over(order by seller_score desc) as rank from seller)
						s, ban_mem m, address a 
						where m.mem_id=s.mem_id and m.address_no=a.address_no and rank<=3

select f.mem_id, count(*), fs.close_date from food_sell fs,food f where f.food_no=fs.food_no 
group by f.mem_id
order by count(*) desc;

select f.mem_id, fs.close_date as 판매중음식 from food f,food_sell fs where close_date>sysdate and f.food_no=fs.food_no


SELECT seq,ca_uid,ca_number,ca_sido,ca_name,ca_sex,ca_work,total_p,total_pc,total_f,total_fc,last_scoer,ca_passyn,tovar_day,prevar_day,ca_birth,rank
FROM (
 
  SELECT m.mem_id, m.mem_name, a.address_api, s.seller_img, s.seller_info, s.seller_score , rank(
    from (select mem_id, seller_score, seller_info, seller_img, rank() over(order by seller_score desc) as rank from seller
    )
FROM volunt_last AS t
WHERE trial_seq =  '4'
ORDER BY  ca_passyn ASC,last_scoer DESC,total_p DESC,tovar_day DESC,prevar_day DESC,ca_birth ASC
) AS CNT


select s.mem_id, a.foodSellCount, s.mem_id, s.seller_img, s.seller_info, s.seller_score, 
         rank() over(order by s.seller_score desc) as rank,  m.mem_name, ad.address_api
   from(
      select s.mem_id, count(*) as foodSellCount
      from food f, food_sell fs, seller s
      where s.mem_id=f.mem_id
         and f.food_no=fs.food_no
      group by s.mem_id order by foodSellCount desc ) a 
         right outer join seller s on a.mem_id=s.mem_id
         inner join ban_mem m on s.mem_id=m.mem_id 
            inner join address ad on m.address_no=ad.address_no
            
select * from food_sell
--top3 rank구하는 쿼리 대단...
select b.mem_id, b.foodSellCount, b.seller_img, b.seller_info, b.seller_score, b.rank, b. mem_name, b.address_api
from 
(   select s.mem_id, a.foodSellCount, s.seller_img, s.seller_info, s.seller_score, 
         rank() over(order by s.seller_score desc) as rank,  m.mem_name, ad.address_api
   from(
      select s.mem_id, count(*) as foodSellCount
      from food f, food_sell fs, seller s
      where s.mem_id=f.mem_id
         and f.food_no=fs.food_no
      group by s.mem_id order by foodSellCount desc ) a 
         right outer join seller s on a.mem_id=s.mem_id
         inner join ban_mem m on s.mem_id=m.mem_id 
            inner join address ad on m.address_no=ad.address_no) b
where NOT b.foodSellCount is NULL AND b.rank<=3 order by b.foodSellCount desc;



