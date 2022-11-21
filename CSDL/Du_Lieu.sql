USE WebSite_DocBao

-- bảng chức vụ
INSERT INTO dbo.Chuc_Vu VALUES( N'Nhân Viên')
INSERT INTO dbo.Chuc_Vu VALUES( N'Admin')
SELECT * FROM dbo.Chuc_Vu

-- bảng lĩnh vực
INSERT INTO dbo.Linh_Vuc VALUES( N'Khoa Học')
INSERT INTO dbo.Linh_Vuc VALUES( N'Sự Kiện')
INSERT INTO dbo.Linh_Vuc VALUES( N'Xã Hội')
INSERT INTO dbo.Linh_Vuc VALUES( N'Thế Giới')
INSERT INTO dbo.Linh_Vuc VALUES( N'Kinh Doanh')
INSERT INTO dbo.Linh_Vuc VALUES( N'Thể Thao')
SELECT * FROM dbo.Linh_Vuc

-- bảng đọc giả
INSERT INTO dbo.Doc_Gia VALUES(   'DG001', N'Nguyễn Van A', 'NguyenVanA@gmail.com', 1, '12345678', N'Hải Dương')
INSERT INTO dbo.Doc_Gia VALUES(   'DG002', N'Nguyễn Van B', 'NguyenVanB@gmail.com', 0, '12345678', N'Hà Nội')
INSERT INTO dbo.Doc_Gia VALUES(   'DG003', N'Nguyễn Van C', 'NguyenVanC@gmail.com', 1, '12345678', N'Hải Phòng')
INSERT INTO dbo.Doc_Gia VALUES(   'DG004', N'Nguyễn Van D', 'NguyenVanD@gmail.com', 1, '12345678', N'Nha Trang')
SELECT UsernameDG AS N'Tài Khoản', tenDocGia AS N'Tên Đọc Giả', email AS N'Email', trangThai AS N'Trạng Thai', Password AS N'Mật Khẩu', diaChi AS N'Địa Chỉ' FROM dbo.Doc_Gia

UPDATE dbo.Doc_Gia SET tenDocGia = N'Nguyễn Đức Phong', email = N'nguyenducphong@gmail.com', trangThai = 0, Password = '123456789', diaChi = N'HĐ' WHERE UsernameDG = 'DG001'
-- bảng nhân viên
INSERT INTO dbo.Nhan_Vien VALUES(1, N'NguyenA', 'nguuyena@gmail.com', 1, N'HN')
INSERT INTO dbo.Nhan_Vien VALUES(2, N'NguyenB', 'nguuyenb@gmail.com', 1, N'HN')
INSERT INTO dbo.Nhan_Vien VALUES(1, N'NguyenC', 'nguuyenc@gmail.com', 0, N'HD')
INSERT INTO dbo.Nhan_Vien VALUES(2, N'NguyenD', 'nguuyend@gmail.com', 1, N'ND')
INSERT INTO dbo.Nhan_Vien VALUES(1, N'NguyenE', 'nguuyene@gmail.com', 1, N'HN')
SELECT maNhanVien AS N'Mã Nhân Viên',maChucVu AS N'Mã Chức Vụ', tenNhanVien AS N'Tên Nhân Viên', Email, trangThai AS N'Trạng Thái', diaChi AS N'Địa Chỉ' FROM dbo.Nhan_Vien
SELECT tenNhanVien AS N'Tên Nhân Viên', maChucVu AS N'Chức Vụ', Username AS N'Tài Khoản', Password AS N'Mật Khẩu', Email, diaChi AS N'Địa Chỉ', trangThai AS N'Trạng Thái' FROM dbo.Nhan_Vien, dbo.Tai_Khoan WHERE Nhan_Vien.maNhanVien = dbo.Tai_Khoan.maNhanVien
SELECT * FROM dbo.Chuc_Vu

UPDATE dbo.Nhan_Vien SET maChucVu = 2, tenNhanVien = N'Nguyeenx van X', Email = 'nguyenvanll', trangThai = 0, diaChi = N'HN' WHERE maNhanVien = 1

-- bảng phóng viên
INSERT INTO dbo.Phong_Vien VALUES('PV001', 1, N'PV-Nguyen Van A', 'pvnguyenvana', 1, N'HD', '1234567', '111000111')
INSERT INTO dbo.Phong_Vien VALUES('PV002', 2, N'PV-Nguyen Van B', 'pvnguyenvanb', 1, N'HN', '1234567', '111000111')
INSERT INTO dbo.Phong_Vien VALUES('PV003', 3, N'PV-Nguyen Van C', 'pvnguyenvanc', 1, N'HN', '1234567', '111000111')
INSERT INTO dbo.Phong_Vien VALUES('PV004', 1, N'PV-Nguyen Van D', 'pvnguyenvand', 1, N'HD', '1234567', '111000111')
INSERT INTO dbo.Phong_Vien VALUES('PV005', 4, N'PV-Nguyen Van E', 'pvnguyenvane', 1, N'HD', '1234567', '111000111')

SELECT UsernamePV AS N'Tài Khoản', maNhanVien AS N'Mã Nhân Viên', tenPhongVien AS N'Tên Phóng Viên', Email, trangThai AS N'Trạng Thái', diaChi AS N'Địa Chỉ', Password AS N'Mật Khẩu', soCMND AS N'Số CMND' FROM Phong_Vien
SELECT * FROM Phong_Vien

SELECT maNhanVien FROM dbo.Tai_Khoan WHERE Username = 'Phong'
UPDATE dbo.Phong_Vien SET UsernamePV = 'PV0020', tenPhongVien = N'PV-Nguyen Van a', Email = 'pv-nguyenvana@gmail.com', trangThai = 0, diaChi = N'HD',  Password = '12345678', soCMND = '10101010101' WHERE maPV = 1
-- bảng bài viết
INSERT INTO dbo.Bai_Viet VALUES (1, 'Hôm nay là một ngày tuyệt vời', 99, GETDATE(), N'Hôm nay bạn thế nào', 'anh')
INSERT INTO dbo.Bai_Viet VALUES (2, 'Hôm nay là một ngày tuyệt vời', 99, GETDATE(), N'Hôm nay bạn thế nào', 'anh')
INSERT INTO dbo.Bai_Viet VALUES (3, 'Hôm nay là một ngày tuyệt vời', 99, GETDATE(), N'Hôm nay bạn thế nào', 'anh')

SELECT * FROM dbo.Bai_Viet
SELECT * FROM dbo.Phong_Vien
SELECT maBaiVien AS N'Mã Bài Viết', maPhongVien AS N'Mã Phóng Viên', soLuongLuotThich AS N'Số Lượt Thích', ngayDang AS N'Ngày Đăng Bài', tieuDe AS N'Tiêu Đề Bài Viết' FROM dbo.Bai_Viet

-- bảng tài khoản
INSERT INTO dbo.Tai_Khoan VALUES(1,'NV001','12345678')
INSERT INTO dbo.Tai_Khoan VALUES(2,'AD001','12345678')
INSERT INTO dbo.Tai_Khoan VALUES(3,'NV002','12345678')
INSERT INTO dbo.Tai_Khoan VALUES(4,'AD002','12345678')
INSERT INTO dbo.Tai_Khoan VALUES(5,'NV003','12345678')
SELECT * FROM dbo.Tai_Khoan

UPDATE dbo.Tai_Khoan SET Username = 'NV001B', Password = '12345678' WHERE maNhanVien = 1
--SELECT Password FROM dbo.Tai_Khoan WHERE Username = 'NV001'
SELECT dbo.Nhan_Vien.maChucVu FROM dbo.Tai_Khoan, dbo.Nhan_Vien WHERE Username = 'AD001' AND dbo.Tai_Khoan.maNhanVien = dbo.Nhan_Vien.maNhanVien
-- bảng lĩnh vực bài viết
INSERT INTO dbo.LinhVuc_BaiViet VALUES(1 ,1)
INSERT INTO dbo.LinhVuc_BaiViet VALUES(1 ,2)
INSERT INTO dbo.LinhVuc_BaiViet VALUES(1 ,3)
INSERT INTO dbo.LinhVuc_BaiViet VALUES(2 ,1)
INSERT INTO dbo.LinhVuc_BaiViet VALUES(3 ,1)
INSERT INTO dbo.LinhVuc_BaiViet VALUES(2 ,2)
SELECT * FROM dbo.LinhVuc_BaiViet

-- bảng bình luận
INSERT INTO dbo.Binh_Luan VALUES(1, 'day la binh luan', 'DG001' )
INSERT INTO dbo.Binh_Luan VALUES(1, 'day la binh luan', 'DG002' )
INSERT INTO dbo.Binh_Luan VALUES(2, 'day la binh luan', 'DG003' )
INSERT INTO dbo.Binh_Luan VALUES(2, 'day la binh luan', 'DG001' )
INSERT INTO dbo.Binh_Luan VALUES(3, 'day la binh luan', 'DG001' )
SELECT * FROM dbo.Binh_Luan

-- bảng thích
INSERT INTO dbo.Thich VALUES('DG001', 1)
INSERT INTO dbo.Thich VALUES('DG002', 2)
INSERT INTO dbo.Thich VALUES('DG003', 1)
INSERT INTO dbo.Thich VALUES('DG004', 3)
SELECT * FROM dbo.Thich

-- bảng báo cáo
INSERT INTO dbo.Bao_Cao VALUES('1',N'Quá Hay','DG001')

SELECT * FROM dbo.Nhan_Vien
SELECT * FROM dbo.Tai_Khoan

SELECT dbo.Nhan_Vien.trangThai FROM dbo.Tai_Khoan, dbo.Nhan_Vien WHERE Username = 'AD001' AND Nhan_Vien.maNhanVien = dbo.Tai_Khoan.maNhanVien