
create table KhachHang(
maKH varchar(10),
hoTen varchar(50),
ten varchar(10),
diaChi varchar(599),
email varchar(10000),
dienThoai varchar(500),
primary key (maKH)
);
insert into KhachHang(maKH,hoTen,ten,diaChi,email,dienThoai) values ('KH001', 'Nguyễn Thị', 'Nga', '15 Quang Trung, TP Đà Nẵng', 'ngant@gmail.com', '0912345670');
insert into KhachHang(maKH,hoTen,ten,diaChi,email,dienThoai) values ('KH002', 'Trần Công', 'Thành', '234 Lê Lợi, Quảng Nam', 'thanhtc@gmail.com', '01610942343');
insert into KhachHang(maKH,hoTen,ten,diaChi,email,dienThoai) values ('KH003', 'Lê Hoàng', 'Nam', '23 Trần Phú, TP Huế', 'namlt@yahoo.com', '0989354556');
insert into KhachHang(maKH,hoTen,ten,diaChi,email,dienThoai) values('KH004', 'Vũ Ngọc', 'Hiền', '37 Nguyễn Thị Thập, TP Đà Nẵng', 'hienvn@gmail.com', '0894545435');
select*from KhachHang;
select * from SanPham;
create table SanPham(
maSP int auto_increment,
moTa varchar(255),
soLuong varchar(255),
donGia varchar(255),
tenSP varchar(255),
primary key (maSP)
);
insert into SanPham values
(1, 'Samsung Galaxy J7 Pro', 6600000, 800, 'Samsung Galaxy J7 Pro là một chiếc smartphone phù hợp với những người yêu thích một sản phẩm pin tốt, thích hệ điều hành mới cùng những tính năng đi kèm độc quyền'),
(2, 'iPhone 6 32GB', 8990000, 500, 'iPhone 6 là một trong những smartphone được yêu thích nhất. Lắng nghe nhu cầu về thiết kế, khả năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất "Hot"'),
(3, 'Laptop Dell Inspiron 3467', 11290000, 507, 'Dell Inspiron 3467 i3 7100U/4GB/1TB/Win10/(M20NR21)'),
(4, 'Pin sạc dự phòng', 200000, 600, 'Pin sạc dự phòng Polymer 5.000 mAh eSaver JP85'),
(5, 'Nokia 3100', 700000, 100, 'Nokia 3100 phù hợp với SINH VIÊN');
create table bill (
    MaHD varchar(10) not null,
    NgayLapHD date not null,
    TrangThai varchar(20) not null,
    MaKH varchar(10) not null,
    primary key (MaHD)
);
insert into bill values
('120954', '2016-03-23', 'Đã thanh toán', 'KH001'),
('120955', '2016-02-04', 'Đã thanh toán', 'KH002'),
('120956', '2016-12-07', 'Chưa thanh toán', 'KH001'),
('125957', '2016-04-12', 'Chưa thanh toán', 'KH004');
select*from bill;
CREATE TABLE billDeatls(

    MaHDCT int not null AUTO_INCREMENT PRIMARY KEY,
    MaHD varchar(10) not null,
    MaSP int not null,
    SoLuongMua int not null
);
insert into billDeatls(MaHD,MaSP,SoLuongMua) values
('120954', 3, 40),
('120954', 1, 20),
('120955', 2, 100),
('120956', 4, 6),
('120956', 2, 60),
('120956', 1, 10),
('125957', 2, 50);
select*from billDeatls;