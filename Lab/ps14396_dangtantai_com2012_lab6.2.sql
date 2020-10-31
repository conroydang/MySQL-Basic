-- Lab 6.2
-- a
select * from khachhang
where MaKH not in  ( select MaKH
from hoadon
where NgayLapHD>='2016-01-01')
-- b
select sanpham.masp , tensp , count(*) as soluotmua
from sanpham join hoadonchitiet on sanpham.masp=hoadonchitiet.masp
group by masp
having count(*)=(select max(luotmua) from(select count(*) as luotmua from hoadon join hoadonchitiet on hoadon.mahd=hoadonchitiet.mahd)
-- c
select khachhang.*,sum(soluongmua*giasp) as tongtien
from khachhang join hoadon on khachhang.makh=hoadon.makh
join hoadonchitiet on hoadon.mahd=hoadon.makh
join sanpham on sanpham.masp=hoadonchitiet.masp
where year(ngaylapHD)=2016
group by makh
order by tongtien desc 
limit 5;
-- e
select sanpham.*,count(*) as soluotmua from  sanpham join hoadonchitiet on sanpham.mahd=hoadonchitiet 
group by masp
having soluotmua<(
select avg(luotmua) from (
select sanpham.masp,count(*) as luotmua
from sanpham join hoadonchitiet on sanpham.masp=hoadonchitiet.masp
group by masp) as temp);