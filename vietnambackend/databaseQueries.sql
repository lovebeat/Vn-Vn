
CREATE DATABASE VietNam
GO
USE [VietNam]
GO

CREATE TABLE city(
	id int IDENTITY(1,1) not null,
	name nvarchar(100) null,
	code nvarchar(100) null,
	description nVARCHAR(1000) null,
	content ntext null,
	is_active bit default('1'),
	CONSTRAINT pk_city_id PRIMARY KEY (id)
);

CREATE TABLE place(
	
	id int IDENTITY(1,1) not null,
	name nvarchar(100) null,
	code nvarchar(100) null,
	description nVARCHAR(1000) null,
	content ntext null,
	is_active bit default('1'),
	city_id int
	CONSTRAINT pk_place_id PRIMARY KEY (id)
	CONSTRAINT fk_place_city_id FOREIGN KEY (city_id) REFERENCES city(id),
);

CREATE TABLE user_detail(
	
	id int IDENTITY(1,1) not null,
	first_name nvarchar(100) null,
	last_name nvarchar(100) null,
	role nvarchar(50) null,
	pass_word nvarchar(100) null,
	email nvarchar(100) null,
	is_active bit default('1'),
	CONSTRAINT pk_user_id PRIMARY KEY (id)
);

CREATE TABLE food(
	
	id int IDENTITY(1,1) not null,
	name nvarchar(100) null,
	code nvarchar(100) null,
	description nVARCHAR(1000) null,
	content ntext null,
	address nvarchar(100) null,
	price_min Decimal(10,2) null,
	price_max Decimal(10,2) null,
	hours_open time null,
	hours_close time null,
	contact nvarchar(100) null,
	is_active bit default('1'),
	city_id int,
	place_id int
	CONSTRAINT pk_food_id PRIMARY KEY (id)
	CONSTRAINT fk_food_city_id FOREIGN KEY (city_id) REFERENCES city(id),
	CONSTRAINT fk_food_place_id FOREIGN KEY (place_id) REFERENCES place(id),
);

INSERT INTO city(name,code,description,content,is_active)
VALUES ('Bình Định','CITY0001','Miền đất võ đầy nắng gió','Bình Định là một tỉnh thuộc vùng duyên hải Nam Trung Bộ Việt Nam. Tỉnh lỵ của Bình Định là thành phố cảng Quy Nhơn nằm cách thủ đô Hà Nội 1.070 km về phía Nam và cách Thành phố Hồ Chí Minh 652 km về phía Bắc theo đường Quốc lộ 1A. Bình Định là quê hương của các loại hình nghệ thuật như tuồng, bài chòi... với bờ biển dài, nhiều vũng vịnh với những bãi tắm đẹp và danh lam thắng cảnh như:Quy Nhơn, Tam Quan, Tân Thanh, Vĩnh Hội, Trung Lương, Hải Giang, Đảo Yến, bãi tắm Hoàng Hậu, Quy Hòa, Bãi Dại, Tân Phụng, Vĩnh Lợi...','1')

INSERT INTO city(name,code,description,content,is_active)
VALUES ('Khánh Hoà','CITY0002','Thành phố biển du lịch','Khánh Hòa là một tỉnh duyên hải Nam Trung Bộ Việt Nam, giáp với tỉnh Phú Yên về phía Bắc, tỉnh Đắk Lắk về phía Tây Bắc, tỉnh Lâm Đồng về phía Tây Nam, tỉnh Ninh Thuận về phía Nam, và Biển Đông về phía Đông. Ngoài vị thế là một trung tâm du lịch lớn Nha Trang đã trở thành điểm đến của nhiều sư kiện lớn của Việt Nam và Thế giới như: Hoa hậu Việt Nam, Hoa hậu Thế giới người Việt 2007 và 2009, Hoa hậu Hoàn vũ 2008, Hoa hậu Trái Đất 2010... cùng với Festival Biển (Nha Trang) được tổ chức 2 năm một lần đã góp phần quảng bá du lịch Khánh Hòa với thế giới.','1')

INSERT INTO city(name,code,description,content,is_active)
VALUES ('Sâp','CITY0003','Sapa haha','Sapa là một tỉnh thuộc Việt Nam. Sapa là điểm đến nổi tiếng với nhiều danh lam thắng cảnh độc đáo mà không phải nơi nào cũng có','1')


INSERT INTO place(name, code, description, content, is_active, city_id)
VALUES ('Biển Nha Trang ','PL0001','Thiên đường du lịch biển của Việt Nam','Những ai đã từng có dịp đặt chân đến phố biển Nha Trang đắm mình trong làn nước biển xanh ngắt, nằm dài trên bờ cát phẳng mịn ngắm cảnh mây trời hay đón những khoảnh khắc thiên nhiên đẹp diệu kỳ thì hẳn sẽ không thể nào quên được mảnh đất xinh đẹp này. Qua bao năm tháng, phố biển Nha Trang ngày càng thay da đổi thịt, hòa cùng nhịp sống trẻ trung, hiện đại và năng động, đổi mới và phát triển từng ngày. Thế nhưng, vẻ đẹp của biển Nha Trang vẫn luôn khiến bao người mê mẩn và say đắm.','1','2')

INSERT INTO place(name, code, description, content, is_active, city_id)
VALUES ('Khu dã ngoại Trung Lương ','PL0002','Khu dã ngoại hot nhất Bình Định','Không chỉ được cắm trại, tắm biển, lặn ngắm san hô, nhiều bạn trẻ háo hức rủ nhau đến khu dã ngoại Trung Lương (Bình Định) còn để ghi lại những khung cảnh lãng mạn như trời Tây. Điểm mới mẻ nhất của khu dã ngoại Trung Lương chính là nơi vui chơi, cắm trại những mái lều xanh đỏ nhấp nhô, hay những hàng ghế nghỉ đủ màu với tầm mắt hướng ngay về phía biển. Nắng vàng, cỏ xanh, xung quanh là những tảng đá vôi lớn và thứ không khí trong lành thổi về từ vùng đất vốn đã ít bon chen, hối hả đảm bảo sẽ khiến bạn chỉ muốn dừng chân tại đây hàng tiếng đồng hồ. ','1','1')

INSERT INTO Food(name,code,description,content, address, price_min, price_max, hours_open, hours_close, contact, is_active,city_id, place_id) 
VALUES ('Surf Bar','FOOD00001','Vietnamese in Quy Nhơn',
'Khác với những quán bar bãi biển khác của Việt Nam, Surf Bar mang đến cho bạn một không gian khá nhẹ nhàng nằm trên ven biển Xuân Diệu thuộc thành phố Quy Nhơn. à một địa chỉ mới nổi đối với giới trẻ Quy Nhơn và khách du lịch, tuy vậy nơi đây đã nhanh chóng chiếm được cảm tình nhờ không gian quán tuy đơn giản nhưng hòa hợp với bờ biển đầy tinh tế và lãng mạn. Đặt chân đến Surf Bar, chắc chắn bạn sẽ bị thu hút ngay bởi không gian thoáng mát hòa hợp với thiên nhiên, cùng các vật trang trí vô cùng bắt mắt.',
'Bờ biển Quy Nhơn - Bình Định','25000', '150000','08:00', '21:00','0969952616','1','1','2')


INSERT INTO Food(name,code,description,content, address, price_min, price_max, hours_open, hours_close, contact, is_active,city_id, place_id) 
VALUES ('Nature View','FOOD00002','Vietnamese in Sapa',
'Youve got to love the photos of the owners kids on the walls at this friendly spot with great valley views. Look forward to decent Vietnamese and European food and just maybe Sapa best fruit smoothies. Those who arent fans of tofu should try the sizzling tofu with lemongrass and be converted. Dont worry – its not all vegetarian food.','51 Ð Phan Si - Sapa, Vietnam','25000', '150000','08:00', '21:00','0969952616','1','1','2')

INSERT INTO Food(name,code,description,content, address, price_min, price_max, hours_open, hours_close, contact, is_active,city_id, place_id) 
VALUES ('Nem nuong Thanh Van','FOOD00003','Top choice vietnamese in Can Tho',
'The only dish this locally acclaimed little spot does is the best nem nuong in town. Roll your own rice rolls using the ingredients provided: pork sausage, rice paper, green banana, star fruit (carambola), cucumber and a riot of fresh herbs, then dip into the peanut-and-something-else sauce, its secret jealously guarded. Simple and fantastic!','Can Tho','45000', '100000','08:00', '21:00','0969952616','1','1','2')


INSERT INTO Food(name,code,description,content, address, price_min, price_max, hours_open, hours_close, contact, is_active,city_id, place_id) 
VALUES ('Com Tay Cam Cung Dinh','FOOD00004','Vietnamese in Danang',
'This simple place is good for local dishes, including hoanh thanh – a wonton-like combination of minced pork and shrimp. It’s down a little alley.', 'K254/2 Ð Hoang Dieu - Danang, Vietnam' ,'20000', '50000','11:00', '20:00','0969952616','1','1','2')

INSERT INTO Food(name,code,description,content, address, price_min, price_max, hours_open, hours_close, contact, is_active,city_id, place_id) 
VALUES ('Lac Canh Restaurant','FOOD00005','Top choice vietnamese in Nha Trang',
'This bustling, smoky, scruffy and highly enjoyable place is crammed most nights with groups firing up the tabletop barbecues (beef, richly marinated with spices, is the speciality, but there are other meats and seafood, too). It closes quite early.', '44 Ð Nguyen Binh Khiem - Nha Trang, Vietnam' ,'30000', '250000','11:00', '21:45','0969952616','1','1','2')