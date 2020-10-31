create database TEST_3;
USE TEST_3;
CREATE TABLE DMPB(
MaPB varchar(2),
TenPB varchar(50),
primary key(MaPB)
);
CREATE TABLE DMCV(
MaCV varchar(2),
TenCV varchar(50),
HeSoCV float,
primary key(MaCV),
foreign key(MaCV) references DMNV(MaCV)
);
CREATE TABLE DMNV(
MaNV varchar(4),
HoNV varchar(50),
TenNV varchar(29),
MaCV varchar(2),
MaPB varchar(2),
NgayBatDau datetime,
primary key(MaNV),
foreign key (MaCV) references DMCV(MaCV),
foreign key (MaPB) references DMPB(MaPB)
);
insert into DMPB values('01','Room Giám đốc');
insert into DMPB values('02','Room Tổ Chức HC');
insert into DMPB values('03','Room Kế Toán');
insert into DMPB values('04' , 'Đội Xây Dựng');
insert into DMCV values('NV' , 'Nhân viên' , 1.1);
insert into DMCV values('TP' , 'Trưởng phòng' , 2.2);
insert into DMCV values('GD' , 'Giám đốc' , 3.6);
insert into DMCV values('PG' , 'Phó giám đốc' , 3.2);
insert into DMNV values('NV01' , 'Lê Thảo','Nguyên' , 'NV', '02' , '2000-08-15');
insert into DMNV values('NV02' , 'Nguyễn Hải','Yến' , 'NV', '03' , '2002-10-20');
insert into DMNV values('NV03' , 'Trần Từ','Hải' , 'GD' , '04' , '1996-01-09');
insert into DMNV values('NV04' , 'Nguyễn','Bảo' , 'TP' , '02' , '1998-01-07');
-- a
select MaCV,TenCV  
from DMCV
where MaCV!='Nhân Viên'
order by MaCV asc;
-- b
select MaNV , concat(HoNV,' ',TenNV) as 'Họ và Tên',TenCV
from DMNV join DMCV on DMCV.MaCV=DMNV.MaCV;
-- c
select count(*) as ' Tổng số Nhân Viên' 
,DMPB.MaPB as 'Mã Phòng Ban',
DMPB.TenPB as 'Tên Phòng Ban'
from DMPB left join DMNV on DMNV.MaPB=DMPB.MaPB
group by DMPB.MaPB;
-- d
update DMNV
set TenNV='Room Kế Toán'
where TenNV='01';
select*from DMPB;
-- e
delete from DMPB
where DMPB.MaPB=null;
-- f
alter table DMNV
add Thamnien int;
-- g
update DMNV
set Thamnien=year(NOW())-year(NgayBatDau);
select*from DMNV;