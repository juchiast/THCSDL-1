use QLDT
go

-- Q12
select gv.hoten from
giaovien gv join giaovien gv1 on gv.gvqlcm = gv1.magv
where gv1.hoten = N'Nguyễn Thanh Tùng'

-- Q18
select gv1.hoten from
giaovien gv join giaovien gv1 on gv.mabm = gv1.mabm
where gv.hoten = N'Trần Trà Hương' and not gv1.hoten = N'Trần Trà Hương'

-- Q19
select distinct gv.* from
giaovien gv join bomon bm on gv.magv = bm.truongbm
join detai on gv.magv = detai.gvcndt

-- Q21
select distinct gv.hoten from
giaovien gv join bomon bm on gv.magv = bm.truongbm
join detai on gv.magv = detai.gvcndt

-- Q24
select gv1.* from
giaovien gv join giaovien gv1 on gv.mabm = gv1.mabm
where gv.magv = '002' and not gv1.magv = '002'
