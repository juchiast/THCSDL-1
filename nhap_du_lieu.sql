create database QLDT
go
use QLDT
go

create table giaovien (
magv char(3) not null,
hoten nvarchar(50),
luong float,
phai nvarchar(3),
ngsinh date,
diachi nvarchar(50),
gvqlcm char(3),
mabm nvarchar(4),
primary key (magv),
foreign key (gvqlcm) references giaovien(magv)
)
go

create table khoa (
makhoa varchar(4) not null,
tenkhoa nvarchar(50),
namtl int,
phong char(3),
dienthoai varchar(10),
truongkhoa char(3),
ngaynhanchuc date,
primary key (makhoa),
foreign key (truongkhoa) references giaovien(magv)
)
go

create table bomon (
mabm nvarchar(4),
tenbm nvarchar(50),
phong char(3),
dienthoai varchar(10),
truongbm char(3),
makhoa varchar(4),
ngaynhanchuc date,
primary key (mabm),
foreign key (truongbm) references giaovien(magv),
foreign key (makhoa) references khoa(makhoa)
)
go

alter table giaovien add constraint FK_giaovien_bomon
foreign key (mabm)
references bomon(mabm)

create table gv_dt (
magv char(3),
dienthoai varchar(10),
primary key (magv, dienthoai),
foreign key (magv) references giaovien(magv)
)

create table nguoithan (
magv char(3),
ten nvarchar(10),
ngsinh date,
phai nvarchar(3),
primary key (magv, ten),
foreign key (magv) references giaovien(magv)
)

create table chude (
macd nchar(4) primary key,
tencd nvarchar(50),
)
go

create table detai (
madt char(3),
tendt nvarchar(50),
capql varchar(10),
kinhphi float,
ngaybd date,
ngaykt date,
macd nchar(4),
gvcndt char(3),
primary key (madt),
foreign key (macd) references chude(macd),
foreign key (gvcndt) references giaovien(magv),
)
go

create table congviec (
madt char(3),
stt int,
tencv nvarchar(50),
ngaybd date,
ngaykt date,
primary key (madt, stt),
foreign key (madt) references detai(madt)
)

go

create table thamgiadt (
magv char(3),
madt char(3),
stt int,
phucap float,
ketqua nvarchar(3),
primary key (magv, madt, stt),
foreign key (madt, stt) references congviec(madt, stt),
foreign key (magv) references giaovien(magv)
)

go

insert into giaovien values
('001', N'Nguyễn Hoài An', 2000, N'Nam', '19730215', N'25/3 Lạc Long Quân, Q.10, TP HCM', NULL, NULL),
('002', N'Trần Hà Hương', 2500, N'Nữ', '19600620', N'125 Trần Hưng Đạo, Q.1,TP HCM', NULL, NULL),
('003', N'Nguyễn Ngọc Ánh', 2200, N'Nữ', '19750511', N'12/21 Võ Văn Ngân Thủ Đức, TP HCM', '002', NULL),
('004', N'Trương Nam Sơn', 2300, N'Nam', '19590620', N'215 Lý Thường Kiệt,TP Biên Hòa', NULL, NULL),
('005', N'Lý Hoàng Hà', 2500, N'Nam', '19541023', N'22/5 Nguyễn Xí, Q.Bình Thạnh, TP HCM', NULL, NULL),
('006', N'Trần Bạch Tuyết', 1500, N'Nữ', '19800520', N'127 Hùng Vương, TP Mỹ Tho', '004', NULL),
('007', N'Nguyễn An Trung', 2100, N'Nam', '19760605', N'234 3/2, TP Biên Hòa', NULL, NULL),
('008', N'Trần Trung Hiếu', 1800, N'Nam', '19770806', N'22/11 Lý Thường Kiệt, TP Mỹ Tho', '007', NULL),
('009', N'Trần Hoàng Nam', 2000, N'Nam', '19751122', N'234 Trấn Não, An Phú,TP HCM', '001', NULL),
('010', N'Phạm Nam Thanh', 1500, N'Nam', '19801212', N'221 Hùng Vương, Q.5, TP HCM', '007', NULL)
go
insert into khoa values
('CNTT', N'Công nghệ thông tin', 1995, 'B11', '0838123456', '002', '20050220'),
('HH', N'Hóa học', 1980, 'B41', '0838456456', '007', '20011015'),
('SH', N'Sinh học', 1980, 'B31', '0838454545', '004', '20001011'),
('VL', N'Vật lý', 1976, 'B21', '0838223223', '005', '20030918')
go
insert into bomon values
('CNTT', N'Công nghệ tri thức', 'B15', '0838126126', NULL, 'CNTT', NULL),
('HHC', N'Hóa hữu cơ', 'B44', '838222222', NULL, 'HH', NULL),
('HL', N'Hóa lý', 'B42', '0838878787', NULL, 'HH', NULL),
('HPT', N'Hóa phân tích', 'B43', '0838777777', '007', 'HH', '20071015'),
('HTTT', N'Hệ thống thông tin', 'B13', '0838125125', '002', 'CNTT', '20040920'),
('MMT', N'Mạng máy tính', 'B16', '0838676767', '001', 'CNTT', '20050515'),
('SH', N'Sinh hóa', 'B33', '0838898989', NULL, 'SH', NULL),
(N'VLĐT', N'Vật lý điện tử', 'B23', '0838234234', NULL, 'VL', NULL),
(N'VLƯD', N'Vật lý ứng dụng', 'B24', '0838454545', '005', 'VL', '20060218'),
('VS', N'Vi sinh', 'B32', '0838909090', '004', 'SH', '20070101')
go

update giaovien set giaovien.mabm = 'HTTT' where magv in ('002', '003')
update giaovien set giaovien.mabm = 'MMT' where magv in ('001', '009')
update giaovien set giaovien.mabm = 'VS' where magv in ('004', '006')
update giaovien set giaovien.mabm = N'VLĐT' where magv = '005'
update giaovien set giaovien.mabm = 'HPT' where magv in ('007', '008', '010')

insert into gv_dt values
('001', '0838912112'),
('001', '0903123123'),
('002', '0913454545'),
('003', '0838121212'),
('003', '0903656565'),
('003', '0937125125'),
('006', '0937888888'),
('008', '0653717171'),
('008', '0913232323')

insert into nguoithan values
('001', N'Hùng', '19900114', 'Nam'),
('001', N'Thủy', '19941208', N'Nữ'),
('003', N'Hà', '19980903', N'Nữ'),
('003', 'Thu', '19980903', N'Nữ'),
('007', 'Mai', '20030326', N'Nữ'),
('007', 'Vy', '20000214', N'Nữ'),
('008', 'Nam', '19910506', 'Nam'),
('009', 'An', '19960819', 'Nam'),
('010', N'Nguyệt', '20060114', N'Nữ')

insert into chude values
('NCPT', N'Nghiên cứu phát triển'),
('QLGD', N'Quản lý giáo dục'),
(N'ƯDCN', N'Ứng dụng công nghệ')
go

insert into detai values
('001', N'HTTT quản lý các trường ĐH', N'ĐHQG', 20, '20071020', '20081020', 'QLGD', '002'),
('002', N'HTTT quản lý giáo vụ cho một Khoa', N'Trường', 20, '20001012', '20011012', 'QLGD', '002'),
('003', N'Nghiên cứu chế tạo ra sợi Nanô Platin', N'ĐHQG', 300, '20080515', '20100515', 'NCPT', '005'),
('004', N'Tạo vật liệu sinh học bằng màng ối người', N'Nhà nước', 100, '20070101', '20091231', 'NCPT', '004'),
('005', N'Ứng dụng hóa học xanh', N'Trường', 200, '20031010', '20041210', N'ƯDCN', '007'),
('006', N'Nghiên cứu tế bào gốc', N'Nhà nước', 4000, '20061020', '20091020', 'NCPT', '004'),
('007', N'HTTT quản lý thư viện các trường ĐH', N'Trường', 20, '20090510', '20100510', 'QLGD', '001')
go
insert into congviec values
('001', 1, N'Khởi tạo và Lập kế hoạch', '20071020', '20081220'),
('001', 2, N'Xác định yêu cầu', '20081220', '20080321'),
('001', 3, N'Phân tích hệ thống', '20080322', '20080522'),
('001', 4, N'Thiết kế hệ thống', '20080523', '20080623'),
('001', 5, N'Cài đặt thử nghiệm', '20080624', '20081020'),
('002', 1, N'Khởi tạo và Lập kế hoạch', '20090510', '20090710'),
('002', 2, N'Xác định yêu cầu', '20090711', '20091011'),
('002', 3, N'Phân tích hệ thống', '20091012', '20091220'),
('002', 4, N'Thiết kế hệ thống', '20091221', '20100322'),
('002', 5, N'Cài đặt thử nghiệm', '20100323', '20100510'),
('006', 1, N'Lấy mẫu', '20061020', '20070220'),
('006', 2, N'Nuôi cấy', '20070221', '20080821')
go
insert into thamgiadt values
('001', '002', 1, 0, NULL),
('001', '002', 2, 2, NULL),
('002', '001', 4, 2, N'Đạt'),
('003', '001', 1, 1, N'Đạt'),
('003', '001', 2, 0, N'Đạt'),
('003', '001', 4, 1, N'Đạt'),
('003', '002', 2, 0, NULL),
('004', '006', 1, 0, N'Đạt'),
('004', '006', 2, 1, N'Đạt'),
('006', '006', 2, 1.5, N'Đạt'),
('009', '002', 3, 0.5, NULL),
('009', '002', 4, 1.5, NULL)
