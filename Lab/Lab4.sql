-- tạo Database
CREATE database LT16101_Lab4_QuanLyBDS;
use LT16101_Labnhanvien4_QuanLyBDS;

-- tạo table
create table vanphong(
	Mavp	int,
    Diadiem	varchar(255),
    Nv_Tp	int,
    
    primary key (Mavp),
    unique (Nv_Tp)
    -- CONSTRAINT fk_nv_tp foreign key (nv_tp)
--     REFERENCES vanphong(nv_Tp)

	
    
    
);
create table nhanvien(
	MaNV	varchar(20),
    TenNhanVien	varchar(50),
    MaVP	int,
    GioiTinh	varchar(30),
    primary key (MaNV),
    constraint fk_VP_NV foreign key (mavp)
	references vanphong(mavp)
    
);
create table THANNHAN(
	MaThanNhan	int	,
    TenThanNhan	varchar(50),
    MoiQuanHe	varchar(50),
    MaNV	varchar(20),
    primary key (MaThanNhan),
    constraint fk_NhanVien_ThanNHan foreign key (MaNV)
	references nhanvien(MaNV)
);
create table ChuSoHuu(
	MaChuSH	int,
    TenChuSH	varchar(50),
    SoDT	int,
    Email	varchar(255),
    primary key(MachuSH),
    unique (email)
    
);
create table BatDongSan(
	MaBDS	int,
    DiaChiBDS	varchar(50),
    MaVP	int,
    MaChuSH	int,
    primary key (mabds),
    constraint fk_bds_vp foreign key (mavp)
	references vanphong(mavp),
    constraint fk_bds_ChuSH foreign key (MaChuSH)
	references chusohuu(MaChuSH)
    
);
 
 -- các lệnh drop (drop==remove)
-- drop table vanphong;
-- drop table nhanvien;
-- drop table thannhan;
-- drop table batdongsan;
-- drop table chusohuu;

-- drop database LT16101_Lab4_QuanLyBDS;
