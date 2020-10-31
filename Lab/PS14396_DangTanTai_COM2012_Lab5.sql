-- Part 1
-- 1
select * from khachHang;

-- 2
select maKH, concat(hoVaTen," ",Ten) as 'Ho Va Ten', Email, DienThoai
from khachHang limit 10;

-- 3
select MaSP, TenSP, concat(GiaSP * SoLuong) as 'Tong Tien'
from sanpham;

-- 4
select maKH,concat(hoVaTen," ",Ten) as 'Ho Va Ten',DiaChi
from khachHang
where Ten like 'H%';

-- 5
select * from khachHang where DiaChi like '%Đà Nẵng%';

-- 6
select * from sanpham where SoLuong between 100 and 500;

-- 7
select * from hoaDon where trangThai = 'Chưa thanh toán' and year(NgayLapHD);

-- 8
select * from hoaDon where maKH in('KH1','KH3','KH6');
-- Part 2
-- 1
select count(*)
from khachhang; 

-- 2

select Max(GiaSP)
from sanpham;

-- 3 
select Min(SoLuong)
from sanpham;

-- 4
select Sum(SoLuong)
from sanpham;

-- 5
select count(*)
from hoadon
where TrangThai like '%CHưa Thanh Toán%' and month(NgayLapHD)=12 and year(NgayLapHD)=2016;

-- 6
select *
from hoadonchitiet;

select MaHD, count(*) as ' So loai san pham '
from hoadonchitiet
group by MaHD;

-- 7
-- chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
select MaHD, count(*) as ' So loai san pham '
from hoadonchitiet
group by MaHD
having count(*) >=5;

-- 8
-- maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
select MaHD , NgayLapHD , MaKH
from hoadon 
order by NgayLapHD desc;





