create database PS14396_DangTanTai_Lab8;
use PS14396_DangTanTai_Lab8;
-- lab 8
-- phần 1
-- a
create unique index uni_id_dt_kh on khachhang(DienThoai);
-- b
create unique index uni_id_email_kh on khachhang(DienThoai);
select * from khachhang;
-- phần 2
-- tạo user 
create user 'taihandsome'@'%' identified by 'taihandsomemoiloginduoc';
GRANT ALL PRIVILEGES ON * . * TO 'taihandsome'@'%';
FLUSH PRIVILEGES;
