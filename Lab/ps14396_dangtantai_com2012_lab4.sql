create database QLBDS;
use ps14396_dangtantai_lab4;
create table vanphong(
	maVP	int,
    diadiem	varchar(255),
    NvTp	int,
    primary key (maVP),
    unique (NvTp)
);
create table nhanvien(
	maNV	varchar(20),
    tenNhanVien	varchar(50),
    maVP	int,
    gioiTinh	varchar(30),
    primary key (maNV),
    constraint fk_VP_NV foreign key (mavp)
	references vanphong(mavp)
    
);
create table THANNHAN(
	maThanNhan	int	,
    tenThanNhan	varchar(50),
    moiQuanHe	varchar(50),
    maNV	varchar(20),
    primary key (maThanNhan),
    constraint fk_NhanVien_ThanNHan foreign key (maNV)
	references nhanvien(maNV)
);
create table ChuSoHuu(
	maChuSH	int,
    tenChuSH	varchar(50),
    sDT	int,
    email	varchar(255),
    primary key(maChuSH),
    unique (email)
    
);
create table BatDongSan(
	maBDS	int,
    diaChiBDS	varchar(50),
    maVP	int,
    maChuSH	int,
    primary key (maBDS),
    constraint fk_bds_vp foreign key (maVP)
	references vanphong(maVP),
    constraint fk_bds_ChuSH foreign key (maChuSH)
	references chusohuu(maChuSH)
    
);