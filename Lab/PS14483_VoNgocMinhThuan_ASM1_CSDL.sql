
-- Bảng SinhVien
	create table sinhvien(
		MaSV varchar(10),
        HoTen varchar(50),
        NgayHetHan date,
        Email varchar(50),
        SoDT varchar(20),
        ChuyenNganh varchar(255),
        -- khóa chính
			constraint pk_sinhvien primary key(MaSV)
	);
    
-- Bảng LoaiSach
	create table loaisach(
		MaLoai varchar(10),
        TenLoai varchar(255),
        -- khóa chính
			constraint pk_loaisach primary key(MaLoai)        
	);

-- Bảng Sach
	create table sach(
		MaSach varchar(10),
        TieuDe varchar(255),
        TacGia varchar(255),
        NhaXuatBan varchar(255),
        MaLoai varchar(10),
        SoTrang int,
        SoLuongBS int,
        GiaTien float,
        NgayNhapKho date,
        -- khóa chính
			constraint pk_sach primary key(MaSach)        
    );
    
-- Bảng PhieuMuon
	create table phieumuon(
		MaPhieuMuon varchar(10),
        NgayMuon date,
        NgayTra date,
        MaSV varchar(10),
        -- khóa chính
			constraint pk_phieumuon primary key(MaPhieuMuon)        
    );
    
-- Bảng CT_PhieuMuon
	create table ct_phieumuon(
		MaPhieuMuon varchar(10),
        MaSach varchar(10),
        GhiChu varchar(255),
		-- khóa chính
			constraint pk_ct_phieumuon primary key(MaPhieuMuon,MaSach)
    );
    
-- Cập nhật thêm khóa ngoại
	-- MaLoai của @t_sach vs @t_loaisach
		alter table sach 
        add constraint fk_s_ls foreign key (MaLoai) references loaisach(MaLoai);
        
	-- MaSV của @t_phieumuon vs @t_sinhvien
		alter table phieumuon 
        add constraint fk_pm_sv foreign key (MaSV) references sinhvien(MaSV);
        
    -- MaPhieuMuon của @t_ct_phieumuon vs @t_phieumuon
		alter table ct_phieumuon 
        add constraint fk_ctpm_pm foreign key (MaPhieuMuon) references phieumuon(MaPhieuMuon);
 
	-- MaSach của @t_ct_phieumuon vs @t_sach
		alter table ct_phieumuon 
        add constraint fk_ctpm_s foreign key (MaSach) references sach(MaSach);
        select*from sinhvien;
        insert into sinhvien values ('PS14396','Đặng Tấn Tài','2023-01-06','taidtps14396@fpt.edu.vn','0355581557','Lập trình IOT');