SELECT f.food_no, f.food_de, f.food_score, f.food_main_img, f.food_postdate
FROM food f, food_sell fs
WHERE f.food_no=fs.food_no and f.food_no='1045'

delete from food where food_no='1047'

delete from food_sell where food_no='1045'

select * from food;
select * from food_sell;

insert into food(food_no, food_name, food_de, food_score, food_main_img, food_postdate, category_no, mem_id)
values(food_seq.nextval, #{foodName}, #{foodDe}, 0, #{foodMainImg}, sysdate, #{categoryNo}, #{memId})
	
update food set 	food_name='김치', food_de='김치', food_main_img='김치.jpg', category_no='10102'
where mem_id='aaaa1' and food_no='1054'

select * from category

select * from ban_mem
select * from seller
select * from address

	
	