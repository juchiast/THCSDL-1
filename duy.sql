use QLDT
go

-- Q11
select gv.hoten, gv1.hoten as nguoiphutrach from
giaovien gv left join giaovien gv1 on gv.gvqlcm = gv1.magv

-- Q12
select gv.hoten from
giaovien gv join giaovien gv1 on gv.gvqlcm = gv1.magv
where gv1.hoten = N'Nguyễn Thanh Tùng'

-- Q14
select distinct gv.hoten from
detai dt join chude cd on dt.macd = cd.macd
join giaovien gv on dt.gvcndt = gv.magv
where cd.tencd = N'Quản lý giáo dục'

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
