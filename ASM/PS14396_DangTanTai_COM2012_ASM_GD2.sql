create table mssv(
maSV varchar(10) not null,
tenSV varchar(50) not null,
ngayHH date not null,
chuyenNghanh varchar(50) not null,
email varchar(100) not null,
phone varchar(20) not null,
primary key (maSV)
);
create table loaiSach(
maLoai varchar(50) not null,
tenLoai varchar(50) not null,
primary key (maLoai)
);
create table bangsach(
maSach varchar(20) not null,
tenSach varchar(50) not null,
nhaXB varchar(50) not null,
soluong int not null,
tacGia varchar(50) not null,
gia float not null,
vitri varchar(50) not null,
maLoai varchar(50) not null,
primary key (maSach),
foreign key (maLoai) references loaisach.sinhvien(maLoai)
);
create table phieumuon(
maPM varchar(50) not null,
ngayMuon varchar(50) not null,
ngayTra varchar(50) not null,
maSV varchar(10) not null,
primary key(maPM),
foreign key (maSV) references mssv.sinhvien(maSV)
);
create table chitiet(
maPM varchar(10) not null,
maSach varchar(20) not null,
note varchar(255) not null,
primary key(maPM,maSach),
foreign key (maPM) references phieumuon.sinhvien(maPM),
foreign key (maSach) references bangsach.sinhvien(maSach)
 );
 insert into mssv(maSV,tenSV) values('Chào bạn','Chào');
 select * from mssv;