
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
	is_active bit null,
	CONSTRAINT pk_city_id PRIMARY KEY (id)
);

CREATE TABLE place(
	
	id int IDENTITY(1,1) not null,
	name nvarchar(100) null,
	code nvarchar(100) null,
	description nVARCHAR(1000) null,
	content ntext null,
	is_active bit null,
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
	is_active bit null,
	CONSTRAINT pk_user_id PRIMARY KEY (id)
);