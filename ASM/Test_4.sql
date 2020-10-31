drop database TEST_4;
CREATE DATABASE TEST_4;
USE TEST_4;

CREATE TABLE MONHOC(
MaMH varchar(7) primary key,
TenMH varchar(50),
SoTC int 
);
CREATE TABLE SINHVIEN(
MaSV varchar(7) primary key,
HoSV varchar(50),
TenSV varchar(20),
NgaySinh date
);
CREATE TABLE KETQUA(
MaSV varchar(7) ,
MaMH varchar(7) ,
DiemThi float,
primary key(MaSV,MaMH),
foreign key (MaSV) references SINHVIEN(MaSV),
foreign key (MaMH) references MONHOC(MaMH)
);
insert into MONHOC values('COM1024','Tin Học Văn Phòng',not null);
insert into MONHOC values('COM2012','Cơ Sở Dữ Liệu',not null);
insert into MONHOC values('MOB1013','Lập trình java 1',not null);

insert into SINHVIEN values('PS02942' , 'Lê Thảo' , 'Nguyên' , '2000-08-15');
insert into SINHVIEN values('PS04510' , 'Nguyễn Hải' , 'Yến' , '2002-10-20');
insert into SINHVIEN values('PS10106' , 'Trần Từ' , 'Hải' , '1996-01-09');
insert into SINHVIEN values('PS10250' , 'Nguyễn' , 'Bảo' , '1998-01-07');

insert into KETQUA values('PS02942' , 'COM1024' , 8.5);
insert into KETQUA values('PS02942' , 'COM2012' , 7);
insert into KETQUA values('PS02942' , 'MOB1013' , 9);
insert into KETQUA values('PS10106' , 'COM1024' , 6);
insert into KETQUA values('PS10106' , 'COM2012' , 3.5);

-- a
select*from SINHVIEN
where month(NgaySinh)=01;
-- b
select * from SINHVIEN 
where year(NgaySinh)>2000;
-- c
select ID.MaSV,concat(HoSV,' ',TenSV) as 'Họ Tên',MaMH,DiemThi
from SINHVIEN ID join KETQUA on ID.MaSV=KETQUA.MaSV
order by DiemThi desc;
-- d
update KETQUA
set DiemThi=DiemThi+0.5
where MaMH='COM2012';
-- e
select avg(diemthi) diemtb , ketqua.mamh, tenmh
from monhoc join ketqua on monhoc.mamh = ketqua.mamh
group by mamh
having avg(diemthi) >=5 and avg(diemthi) <7;
-- f
select * from monhoc where MaMH like 'COM%';
-- g
select count(*) as 'Tổng SV Môn Học',
monhoc.mamh as 'Mã môn học',
monhoc.tenmh as 'Tên môn học'
from monhoc
group by monhoc.mamh;
-- 8
select MaSV,concat(HoSV,' ',TenSV) as 'FUll name'
from SINHVIEN
where MaSV not in (select MaSV from KETQUA);