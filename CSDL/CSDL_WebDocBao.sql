CREATE DATABASE WebSite_DocBao
USE WebSite_DocBao
DROP DATABASE WebSite_DocBao

CREATE TABLE Chuc_Vu(
	maChucVu INT PRIMARY KEY IDENTITY(1,1),
	tenChucVu NVARCHAR(30)
)

CREATE TABLE Linh_Vuc(
	maLinhVuc INT PRIMARY KEY IDENTITY(1,1),
	tenLinhVuc NVARCHAR(30)
)
CREATE TABLE Doc_Gia(
	UsernameDG varchar(50) primary key,
	tenDocGia nvarchar(255),
	email varchar(255) unique,
	trangThai bit default(1),
	Password varchar(255),
	diaChi NVARCHAR(50),
)


CREATE TABLE Nhan_Vien(
	maNhanVien INT PRIMARY KEY IDENTITY(1,1),
	maChucVu INT,
	tenNhanVien NVARCHAR(30),
	Email VARCHAR(40) UNIQUE,
	trangThai bit default(1),
	diaChi NVARCHAR(50),

	FOREIGN KEY(maChucVu) REFERENCES dbo.Chuc_Vu(maChucVu),
)

CREATE TABLE Phong_Vien(
	maPV INT PRIMARY KEY IDENTITY(1,1),
	UsernamePV VARCHAR(15) UNIQUE,
	maNhanVien INT,
	tenPhongVien NVARCHAR(30),
	Email VARCHAR(40),
	trangThai bit default(1),
	diaChi NVARCHAR(50),
	Password VARCHAR(50),
	soCMND VARCHAR(20),

	FOREIGN KEY(maNhanVien) REFERENCES dbo.Nhan_Vien(maNhanVien)
)



CREATE TABLE Bai_Viet(
	maBaiVien INT PRIMARY KEY IDENTITY(1,1),
	maPhongVien INT,
	noiDungBaiViet TEXT,
	soLuongLuotThich INT,
	ngayDang DATE,
	--duongDan VARCHAR(150),
	tieuDe NVARCHAR(250),
	anhDaiDien VARCHAR(150),

	FOREIGN KEY(maPhongVien) REFERENCES dbo.Phong_Vien(maPV)
)
CREATE TABLE Tai_Khoan(
	maTaiKhoan INT PRIMARY KEY IDENTITY(1,1),
	maNhanVien INT,
	Username VARCHAR(20),
	Password VARCHAR(30),

	FOREIGN KEY(maNhanVien) REFERENCES dbo.Nhan_Vien(maNhanVien)
)


CREATE TABLE LinhVuc_BaiViet(
	maBaiViet INT,
	maLinhVuc INT,

	FOREIGN KEY(maBaiViet) REFERENCES dbo.Bai_Viet(maBaiVien),
	FOREIGN KEY(maLinhVuc) REFERENCES dbo.Linh_Vuc(maLinhVuc),

	PRIMARY KEY(maBaiViet, maLinhVuc)
)

CREATE TABLE Binh_Luan(
	maBinhLuan INT PRIMARY KEY IDENTITY(1,1),
	maBaiViet INT,
	noiDungBinhLuan TEXT,
	UsernameDG VARCHAR(50),

	FOREIGN KEY (maBaiViet) REFERENCES dbo.Bai_Viet(maBaiVien),
	FOREIGN KEY (UsernameDG) REFERENCES dbo.Doc_Gia(UsernameDG)
)

CREATE TABLE Thich(
	UsernameDG VARCHAR(50),
	maBaiViet INT,

	FOREIGN KEY (maBaiViet) REFERENCES dbo.Bai_Viet(maBaiVien),
	FOREIGN KEY (UsernameDG) REFERENCES dbo.Doc_Gia(UsernameDG),

	PRIMARY KEY(maBaiViet, UsernameDG)
)

CREATE TABLE Bao_Cao(
	maBaoCao INT PRIMARY KEY IDENTITY(1,1),
	maBaiViet INT,
	noiDungBC NVARCHAR(450),
	UsernameDG VARCHAR(50),

	FOREIGN KEY (maBaiViet) REFERENCES dbo.Bai_Viet(maBaiVien),
	FOREIGN KEY (UsernameDG) REFERENCES dbo.Doc_Gia(UsernameDG)
)

-- Xoa bai viet
SELECT * FROM dbo.Bai_Viet
DELETE FROM dbo.Binh_Luan WHERE maBaiViet = 3
DELETE FROM dbo.Bao_Cao WHERE maBaiViet = 3
DELETE FROM dbo.Thich WHERE maBaiViet = 3
DELETE FROM dbo.LinhVuc_BaiViet WHERE maBaiViet = 3
DELETE FROM dbo.Bai_Viet WHERE maBaiVien = 3