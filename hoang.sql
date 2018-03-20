use QLDT
go
--Q1
select gv.Hoten, gv.Luong 
from GIAOVIEN gv
where gv.Phai like N'Nữ'
--Q2
select gv.Hoten, gv.Luong*1.1 
from GIAOVIEN gv
--Q3
select gv.magv 
from giaovien gv left join  bomon bm on gv.magv=bm.truongbm 
where (gv.hoten like N'Nguyễn%' and gv.luong > 2000) or (year(bm.ngaynhanchuc) > 1995)
--Q4
select gv.Hoten
from giaovien gv join bomon bm on gv.mabm = bm.mabm
join khoa k on bm.makhoa = k.makhoa
where k.makhoa like 'CNTT'
--Q5
select bm.*,gv.*
from bomon bm left join giaovien gv on bm.truongbm = gv.magv
--Q6
select gv.hoten,bm.*
from giaovien gv left join bomon bm on bm.mabm = gv.mabm
--Q7
select  dt.tendt,gv.hoten
from detai dt left join giaovien gv on dt.gvcndt=gv.magv
--Q8
select k.tenkhoa,gv.*
from Khoa k left join giaovien gv on k.truongkhoa=gv.magv
--Q9
select distinct gv.hoten
from detai dt join thamgiadt tg on dt.madt = tg.madt
			  join giaovien gv on tg.magv = gv.magv
			  join bomon bm on gv.mabm = bm.mabm 
where dt.madt like '006' and bm.tenbm like N'Vi sinh'
--Q13
select gv.hoten
from bomon bm join giaovien gv on bm.truongbm = gv.magv
where bm.mabm like N'HTTT'
--Q16
select gv.hoten as hoten, gvql.hoten as hotengvql
from giaovien gv left join giaovien gvql on gv.gvqlcm = gvql.magv
--Q17
select cv.*
from congviec cv
where cv.ngaybd > '20070101' and cv.ngaybd < '20070108'
--Q20
select gv.hoten
from giaovien gv join bomon bm on gv.magv = bm.truongbm
				 join khoa k on gv.magv = k.truongkhoa
--Q22
select distinct gv.magv
from giaovien gv join detai dt on gv.magv = dt.gvcndt
			     join khoa k on gv.magv = k.truongkhoa
--Q23
select distinct gv.magv
from giaovien gv join thamgiadt tg on gv.magv = tg.magv 
			     join bomon bm on gv.mabm = bm.mabm
where bm.tenbm like N'HTTT' or tg.madt like '001'
--Q25
select gv.hoten
from bomon bm join giaovien gv on bm.truongbm = gv.magv
--Q26
select gv.hoten,gv.luong
from giaovien gv

