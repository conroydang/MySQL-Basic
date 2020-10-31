
use ps14396_qly_banhang_ontap1;
create table Khach_hang(
maKH varchar(3),
hoTen varchar(50),
dc varchar(50),
primary key(maKH)
);
create table dat_hang(
maKH varchar(3),
soDH varchar(4),
ngay_dat datetime,
primary key(soDH),
foreign key(maKH) references Khach_hang(maKH)
);
create table CT
(
soDH varchar(4),
maSP varchar(5),
soluong int auto_increment,
dongia decimal,
primary key (soDH,maSP),
foreign key (soDH) references dat_hang(soDH)
);
insert into Khach_hang(maKH,hoTen,dc) values('A18','Tài','211 Nguyễn Trãi');
insert into Khach_hang(maKH,hoTen,dc) values('A11','Tàii','222 Nguyễn Trãi');
insert into Khach_hang(maKH,hoTen,dc) values('A15','Tàii','212 Nguyễn Trãi');
insert into Khach_hang(maKH,hoTen,dc) values('A22','Tài','213 Nguyễn Trãi');
insert into Khach_hang(maKH,hoTen,dc) values('A09','Tàiii','214 Nguyễn Trãi');
insert into Khach_hang(maKH,hoTen,dc) values('A99','thị','215 Nguyễn Trãi');
									
insert into dat_hang(soDH,ngay_dat,maKH) values('DH01','2020-01-12','A11');
insert into dat_hang(soDH,ngay_dat,maKH) values('DH02','2020-08-11','A09');
insert into dat_hang(soDH,ngay_dat,maKH) values('DH01','2020-09-01','A99');
insert into dat_hang(soDH,ngay_dat,maKH) values('DH04','2020-09-01','A15');



insert into CT(soDH,maSP,soluong,dongia) values('DH44','JAC02',1 ,1200000);
insert into CT(soDH,maSP,soluong,dongia) values('DH55','SMN0',2 ,180000);
insert into CT(soDH,maSP,soluong,dongia) values('DH66','VES02',1 ,700000);
select*from Khach_hang
where hoTen like '%thị%'
order by maKH desc;
select soDH,ngay_dat,khach_hang.maKH,hoTen,dc
from Khach_hang
inner join dat_hang on khach_hang.maKH=dat_hang.maKH;
-- câu 4
select KH.maKH,hoTen,dc,ngay_dat
from khach_hang KH  join dat_hang DDH on KH.maKH=DDH.maKH
where month(ngay_dat)=09 and year(ngay_dat)=2020;
-- câu 5
select KH.maKH as 'Mã KH',
        hoTen as 'Tên khách hàng',
        count(*) as 'Số lần ĐH'
        from dat_hang DDH join khach_hang KH on DDH.maKH=KH.maKH
        group by KH.maKH;
-- câu 6
	select DDH.soDH as 'Số ĐH',
        ngay_dat as 'Ngày đặt',
        hoTen as 'Tên khách hàng',
        sum(soluong) as 'Số SP',
        sum(soluong*dongia) as 'Tổng thành tiền'
        from dat_hang DDH join khach_hang KH on DDH.maKH=KH.maKH
						join CT CTDH on DDH.maKH=CTDH.soDH
        group by KH.maKH;