INSERT INTO shop(id, name, image, address, phone_number) VALUES(101, '석촌호수',
'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_%EC%84%9D%EC%B4%8C%ED%98%B8%EC%88%98.jpg?raw=true',
'서울특별시 송파구 석촌호수로 262 (송파동)', '02-758-8693');

INSERT INTO shop(id, name, image, address, phone_number) VALUES(102, '송파나루역DT',
'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_%EC%86%A1%ED%8C%8C%EA%B5%AC%EC%B2%AD.jpeg?raw=true',
'서울특별시 송파구 오금로 142 (송파동)','02-421-3622');

INSERT INTO shop(id, name, image, address, phone_number) VALUES(103, '송파구청',
'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_%EC%86%A1%ED%8C%8C%EB%82%98%EB%A3%A8%EC%97%ADDT.jpg?raw=true',
'서울특별시 송파구 오금로 87 (방이동)','02-421-3622');

INSERT INTO shop(id, name, image, address, phone_number) VALUES(104, '잠실시그마타워',
'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_%EC%9E%A0%EC%8B%A4%EC%8B%9C%EA%B7%B8%EB%A7%88%ED%83%80%EC%9B%8C.jpg?raw=true',
'서울특별시 송파구 올림픽로 289 (신천동)','02-421-3622');

INSERT INTO shop(id, name, image, address, phone_number) VALUES(105, '잠실푸르지오월드',
'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_%EC%9E%A0%EC%8B%A4%ED%91%B8%EB%A5%B4%EC%A7%80%EC%98%A4%EC%9B%94%EB%93%9C.jpg?raw=true',
'서울특별시 송파구 올림픽로35가길 9, 잠실푸르지오월드마크 1층 (신천동)','02-758-8652');


INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(1,'프리미엄 바나나','Preminum Banana','짱 맛있어용',1500,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_banana.jpeg?raw=true','food',101);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(2,'아메리카노','Americano','짱 맛있어용',4100,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_americano.jpg?raw=true','beverage',101);

INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(3,'아이스 아메리카노','Ice Americano','짱 맛있어용',4100,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_americano.jpg?raw=true','beverage',101);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(4,'카페 라떼','Caffe Latte','짱 맛있어용',4600,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_latte.jpg?raw=true','beverage',101);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(5,'아이스 카페 라떼','Ice Caffe Latte','짱 맛있어용',4600,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_latte.jpg?raw=true','beverage',101);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(6,'카라멜 마키아또','Caramel Macchiato','짱 맛있어용',5600,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_caramel_macchiato.jpg?raw=true','beverage',101);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(7,'카라멜 마키아또','Ice Caramel Macchiato','짱 맛있어용',5600,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_caramel_macchiato.jpg?raw=true','beverage',101);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(8,'자몽 허니 블랙 티','Grapefruit Honey Black Tea','짱 맛있어용',5300,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_grapefruit_honey_black_tea.jpg?raw=true','beverage',101);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(9,'아이스 자몽 허니 블랙 티','Ice Grapefruit Honey Black Tea','짱 맛있어용',5300,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_grapefruit_honey_black_tea.jpg?raw=true','beverage',101);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(10,'그린 티 라떼','Green Tea Latte','짱 맛있어용',5900,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_green_tea_latte.jpg?raw=true','beverage',101);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(11,'아이스 그린 티 라떼','Ice Green Tea Latte','짱 맛있어용',5900,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_green_tea_latte.jpg?raw=true','beverage',101);
--
--
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(201,'프리미엄 바나나','Preminum Banana','짱 맛있어용',1500,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_banana.jpeg?raw=true','food',102);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(202,'카라멜 마키아또','Caramel Macchiato','짱 맛있어용',5600,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_caramel_macchiato.jpg?raw=true','beverage',102);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(203,'카라멜 마키아또','Ice Caramel Macchiato','짱 맛있어용',5600,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_caramel_macchiato.jpg?raw=true','beverage',102);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(204,'자몽 허니 블랙 티','Grapefruit Honey Black Tea','짱 맛있어용',5300,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_grapefruit_honey_black_tea.jpg?raw=true','beverage',102);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(205,'아이스 자몽 허니 블랙 티','Ice Grapefruit Honey Black Tea','짱 맛있어용',5300,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_grapefruit_honey_black_tea.jpg?raw=true','beverage',102);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(206,'그린 티 라떼','Green Tea Latte','짱 맛있어용',5900,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_green_tea_latte.jpg?raw=true','beverage',102);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(207,'아이스 그린 티 라떼','Ice Green Tea Latte','짱 맛있어용',5900,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_green_tea_latte.jpg?raw=true','beverage',102);
--
--
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(301,'아메리카노','Americano','짱 맛있어용',4100,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_americano.jpg?raw=true','beverage',103);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(302,'카라멜 마키아또','Caramel Macchiato','짱 맛있어용',5600,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_caramel_macchiato.jpg?raw=true','beverage',103);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(303,'아이스 그린 티 라떼','Ice Green Tea Latte','짱 맛있어용',5900,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_green_tea_latte.jpg?raw=true','beverage',103);
--
--
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(401,'아메리카노','Americano','짱 맛있어용',4100,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_americano.jpg?raw=true','beverage',104);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(402,'아이스 아메리카노','Ice Americano','짱 맛있어용',4100,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_americano.jpg?raw=true','beverage',104);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(403,'카라멜 마키아또','Ice Caramel Macchiato','짱 맛있어용',5600,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_caramel_macchiato.jpg?raw=true','beverage',104);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(404,'자몽 허니 블랙 티','Grapefruit Honey Black Tea','짱 맛있어용',5300,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_grapefruit_honey_black_tea.jpg?raw=true','beverage',104);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(405,'그린 티 라떼','Green Tea Latte','짱 맛있어용',5900,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_hot_green_tea_latte.jpg?raw=true','beverage',104);
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(406,'아이스 그린 티 라떼','Ice Green Tea Latte','짱 맛있어용',5900,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_ice_green_tea_latte.jpg?raw=true','beverage',104);
--
INSERT INTO menu_item(id, name, name_in_english, description, price, img_url, category, shop_id) VALUES(501,'프리미엄 바나나','Preminum Banana','짱 맛있어용',1500,'https://github.com/eunsukko/TIL/blob/master/201912/caffeine/pictures/starbucks_banana.jpeg?raw=true','food',105);
-- --

INSERT INTO orders(id, menu_id, order_status) VALUES(987654311L, 1L, 'PENDING');
INSERT INTO orders(id, menu_id, order_status) VALUES(987654312L, 2L, 'PENDING');
INSERT INTO orders(id, menu_id, order_status) VALUES(987654313L, 1L, 'IN_PROGRESS');
INSERT INTO orders(id, menu_id, order_status) VALUES(987654314L, 2L, 'IN_PROGRESS');
INSERT INTO orders(id, menu_id, order_status) VALUES(987654315L, 1L, 'FINISHED');
INSERT INTO orders(id, menu_id, order_status) VALUES(987654316L, 2L, 'FINISHED');

INSERT INTO orders(id, menu_id, order_status) VALUES(987654317L, 1L, 'PENDING');
INSERT INTO orders(id, menu_id, order_status) VALUES(987654318L, 2L, 'IN_PROGRESS');


