CREATE TABLE carts_by_user (
	user_id BIGINT,
	cart_id BIGINT,
	state BOOLEAN,
	total DECIMAL,
	PRIMARY KEY ((user_id), cart_id)
) WITH CLUSTERING ORDER BY (cart_id ASC);

CREATE TABLE items_by_cart (
	cart_id BIGINT,
	inserted_date TIMESTAMP,
	item_id BIGINT,
	item_name TEXT,
	item_description TEXT,
	item_price DECIMAL,
	item_quantity INT,
	type_id BIGINT,
	cart_total DECIMAL,
	PRIMARY KEY ((cart_id), item_id, inserted_date)
) WITH CLUSTERING ORDER BY (item_id ASC, inserted_date DESC);

CREATE TABLE types_by_name (
	name TEXT,
	id BIGINT,
	description TEXT,
	PRIMARY KEY ((name), id)
) WITH CLUSTERING ORDER BY (id ASC);

CREATE MATERIALIZED VIEW types_by_name 
  AS 
    SELECT * FROM types_by_id
    WHERE name IS NOT NULL 
      AND id IS NOT NULL
  PRIMARY KEY ((name), id);

CREATE TABLE types_by_id (
	id BIGINT,
	name TEXT,
	description TEXT,
PRIMARY KEY (id)
);

CREATE TABLE items_by_type (
	type_id BIGINT,
	item_id BIGINT,
	item_description TEXT,
	item_price DECIMAL,
	PRIMARY KEY ((type_id), item_id)
) WITH CLUSTERING ORDER BY (item_id ASC);

CREATE TABLE cart_by_user_by_date  (
user_id BIGINT, 
	date TIMESTAMP,
	cart_id BIGINT,
	cart_total DECIMAL,
	PRIMARY KEY ((user_id, date))
);

CREATE TABLE items_by_id (
	item_id BIGINT, 
	item_name TEXT,
	item_description TEXT,
	item_price DECIMAL,
	PRIMARY KEY ((item_id))
);

CREATE TABLE items_by_name (
	item_name TEXT, 
	item_id BIGINT,
	item_description TEXT,
	item_price DECIMAL,
	PRIMARY KEY ((item_name),item_id)
);

CREATE MATERIALIZED VIEW items_by_name 
AS 
SELECT * FROM items_by_id
WHERE name IS NOT NULL AND id IS NOT NULL
PRIMARY KEY ((item_name),item_id));


INSERT INTO dbdemo.carts_by_user(user_id, cart_id, state) VALUES (1, 1, false);
INSERT INTO dbdemo.carts_by_user(user_id, cart_id, state) VALUES (1, 2, true);
INSERT INTO dbdemo.carts_by_user(user_id, cart_id, state) VALUES (2, 3, false);
INSERT INTO dbdemo.carts_by_user(user_id, cart_id, state) VALUES (2, 4, false);
INSERT INTO dbdemo.carts_by_user(user_id, cart_id, state) VALUES (2, 5, false);
INSERT INTO items_by_cart (cart_id, item_id, item_name, item_description, item_price, item_quantity, type_id, inserted_date)
	VALUES (1, 1, 'sach giao khoa lop 1', 'sach giao khoa duoc bo giao duc san xuat', 100000, 2, 1, '2017-04-01');
INSERT INTO items_by_cart (cart_id, item_id, item_name, item_description, item_price, item_quantity, type_id , inserted_date)
	VALUES (1, 2, 'sach dao duc lop 1', 'sach dao duc ren dua dao duc tre em', 100000, 1, 1,'2017-04-01');
INSERT INTO items_by_cart (cart_id, item_id, item_name, item_description, item_price, item_quantity, type_id , inserted_date)
	VALUES (1, 3, 'sach toan lop 1', 'sach toan giup tre phat trien tri nao gap ba lan', 100000, 1, 1, '2017-04-01');
INSERT INTO items_by_cart (cart_id, item_id, item_name, item_description, item_price, item_quantity, type_id , inserted_date) 
	VALUES (1, 4, 'Quan kaki danh cho nam', 'Ton len ve dep cua nam gioi', 100000, 1, 2, '2017-04-01');
INSERT INTO items_by_cart (cart_id, item_id, item_name, item_description, item_price, item_quantity, type_id , inserted_date) 
	VALUES (1, 5, 'Ao mac voi quan kaki danh cho nam', 'Dep het xay', 100000, 1, 3, '2017-04-01');
INSERT INTO types_by_name(id, name, description) VALUES (1, 'Sach', 'Ngan hang sach da dang');
INSERT INTO types_by_name(id, name, description) VALUES (2, 'Quan', 'Mau ma da dang, hop thoi trang');
INSERT INTO types_by_name(id, name, description) VALUES (3, 'Ao', 'Ao rat dep, maizdo, maizdo');
INSERT INTO types_by_name(id, name, description) VALUES (4, 'Giay', 'Mau ma da dang');
INSERT INTO types_by_name(id, name, description) VALUES (5, 'Non', 'Mau ma da dang');
INSERT INTO types_by_id(id, name, description) VALUES (1, 'Sach', 'Ngan hang sach da dang');
INSERT INTO types_by_id(id, name, description) VALUES (2, 'Quan', 'Mau ma da dang, hop thoi trang');
INSERT INTO types_by_id(id, name, description) VALUES (3, 'Ao', 'Ao rat dep, maizdo, maizdo');
INSERT INTO types_by_id(id, name, description) VALUES (4, 'Giay', 'Mau ma da dang');
INSERT INTO types_by_id(id, name, description) VALUES (5, 'Non', 'Mau ma da dang');
INSERT INTO items_by_type (type_id, item_id, item_description, item_price) values (1,1, 'sach giao khoa duoc bo giao duc san xuat', 90000);
INSERT INTO items_by_type (type_id, item_id, item_description, item_price) values (1,2, 'sach dao duc ren dua dao duc tre em', 80000);
INSERT INTO items_by_type (type_id, item_id, item_description, item_price) values (1,3, 'sach toan giup tre phat trien tri nao gap ba lan', 100000);
INSERT INTO items_by_type (type_id, item_id, item_description, item_price) values (2,4, 'Ton len ve dep cua nam gioi', 110000);
INSERT INTO items_by_type (type_id, item_id, item_description, item_price) values (2,5, 'Dep het xay', 150000);
INSERT INTO cart_by_user_by_date (user_id,date,cart_id) values (1, '2017-04-01', 1 );
INSERT INTO cart_by_user_by_date (user_id,date,cart_id) values (2, '2015-02-15', 2 );
INSERT INTO cart_by_user_by_date (user_id,date,cart_id) values (1, '2001-02-15', 3 );
INSERT INTO cart_by_user_by_date (user_id,date,cart_id) values (2, '2017-03-02', 4 );
INSERT INTO cart_by_user_by_date (user_id,date,cart_id) values (1, '2017-04-10', 5 );
INSERT INTO items_by_id (item_id,item_name,item_description,item_price) values (1, 'sach giao khoa lop 1', 'sach giao khoa duoc bo giao duc san xuat', 90000 );
INSERT INTO items_by_id (item_id,item_name,item_description,item_price) values (2, 'sach dao duc lop 1', 'sach dao duc ren dua dao duc tre em', 80000 );
INSERT INTO items_by_id (item_id,item_name,item_description,item_price) values (3, 'sach toan lop 1', 'sach toan giup tre phat trien tri nao gap ba lan', 100000 );
INSERT INTO items_by_id (item_id,item_name,item_description,item_price) values (4, 'Quan kaki danh cho nam', 'Ton len ve dep cua nam gioi', 110000 );
INSERT INTO items_by_id (item_id,item_name,item_description,item_price) values (5, 'Ao mac voi quan kaki danh cho nam', 'Dep het xay', 150000 );
INSERT INTO items_by_name (item_name, item_id, item_description, item_price) values ( 'Sach giao khoa lop 1', 1, 'sach giao khoa duoc bo giao duc san xuat', 90000);
INSERT INTO items_by_name (item_nameitem_id,,item_description,item_price) values ('sach dao duc lop 1', 2, 'sach giao khoa duoc bo giao duc san xuat', 80000 );
INSERT INTO items_by_name (item_name,item_id,item_description,item_price) values ( 'sach toan lop 1', 3, 'sach toan giup tre phat trien tri nao gap ba lan', 100000 );
INSERT INTO items_by_name (item_name,item_id,item_description,item_price) values ('Quan kaki danh cho nam', 4, 'Ton len ve dep cua nam gioi', 110000);
INSERT INTO items_by_name (item_name,item_id,item_description,item_price) values ('Ao mac voi quan kaki danh cho nam',5,  'Dep het xay', 150000 );


--Hiển thị giỏ hàng của người dùng
SELECT * FROM carts_by_user WHERE user_id=2 AND cart_id=4;
SELECT * FROM carts_by_user WHERE user_id=4;

--Hiển thị các sản phẩm trong giỏ hàng
SELECT * FROM items_by_cart WHERE cart_id=1;

--Hiển thị danh sách loại sản phẩm theo tên loại sản phẩm
SELECT * FROM types_by_name WHERE name=”Non”;

--Hiển thị danh sách loại sản phẩm theo id loại sản phẩm
SELECT * FROM types_by_id WHERE id=1;

--Hiển thị danh sách các sản phẩm trong một loại sản phẩm
SELECT * FROM items_by_type WHERE type_id=1;

--Hiển thị tất cả giỏ hàng của một người dùng theo ngày
SELECT * FROM cart_by_user_by_date WHERE user_id=2 AND date='2017-02-15';

--Tìm kiếm sản phẩm theo id sản phẩm
SELECT * FROM items_by_id WHERE item_id=1;

--Tìm kiếm sản phẩm theo tên sản phẩm
SELECT * FROM types_by_name WHERE name=”Ao mac voi quan kaki danh cho nam”;


--demo Index: giả sử chúng ta muốn tìm kiếm một sản phẩm có giá năm trong một khoảng xác định, vì Price không nằm trong primary key, nên để thực hiện được câu truy vấn này ta cần thực hiện tạo một chỉ mục cho cột price trong bảng items_by_id
CREATE INDEX priceFilter ON TABLE items_by_id (price);
--Thực hiện query sản phẩm trong khoảng giá 80000 - 100000
SELECT * FROM items_by_id WHERE price>80000 and price<100000

--demo Lightweight transaction: Lightweight transaction được sử dụng trong câu lệnh insert và update trong Cassandra.
INSERT INTO items_by_name (item_name,item_id,item_description,item_price) values ('Ao mac voi quan kaki danh cho nam',5,  'Dep het xay', 150000 ) IF NOT EXISTS;
UPDATE items_by_name SET item_name='Sach giao khoa lop 2' WHERE item_id=1 IF item_name='Sach giao khoa lop 1'

--demo BATCH statament:
--U1: cập nhật một giỏ hàng đang hoạt động thành giỏ hàng được lưu, hoặc một giỏ hàng đang được lưu thành một giỏ hàng đang hoạt động.
BEGIN BATCH
UPDATE carts_by_user 
SET cart_is_active = false
WHERE user_id = 1 AND cart_id = 2
IF cart_is_active = true;
UPDATE carts_by_user 
SET cart_is_active = true
WHERE user_id = 1 AND cart_id =1;
APPLY BATCH;

SELECT *
FROM carts_by_user
WHERE user_id =1;

--U2: thêm một item vào giỏ hàng.
BEGIN BATCH
INSERT INTO items_by_cart (cart_id, item_id, item_name, item_description, item_price, item_quantity, type_id , inserted_date)
(1, 1, 'sach giao khoa lop 1', 'sach giao khoa duoc bo giao duc san xuat', 100000, 2, 1, '2017-04-01')
  VALUES ((1, 1, 'sach giao khoa lop 1', 'sach giao khoa duoc bo giao duc san xuat', 100000, 2, 1, TOTIMESTAMP(NOW()))
    
  UPDATE items_by_cart 
  SET cart_subtotal = 111.50
  WHERE cart_id = 19925cc1-4f8b-4a44-b893-2a49a8434fc8
  IF cart_subtotal = 51.50;
APPLY BATCH;

SELECT timestamp, item_id, item_price, 
       quantity, cart_subtotal 
FROM items_by_cart
WHERE cart_id = 19925cc1-4f8b-4a44-b893-2a49a8434fc8;
