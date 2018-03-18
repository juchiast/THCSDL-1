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
from giaovien gv left join bomon bm on bm.truongbm = gv.magv
--Q7
select  dt.tendt,gv.hoten
from detai dt left join giaovien gv on dt.gvcndt=gv.magv
--Q8
select k.tenkhoa,gv.*
from Khoa k left join giaovien gv on k.truongkhoa=gv.magv
 
