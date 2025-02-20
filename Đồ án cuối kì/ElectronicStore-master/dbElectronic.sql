USE [master]
GO
/****** Object:  Database [Electronic]    Script Date: 4/10/2019 9:03:09 PM ******/
CREATE DATABASE [Electronic]
GO
USE	[Electronic]
GO
 /*CONTAINMENT = NONE*/
 ON  PRIMARY 
( NAME = N'Electronic', FILENAME = N'D:\Electronic.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Electronic_log', FILENAME = N'D:\Electronic_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Electronic] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Electronic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Electronic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Electronic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Electronic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Electronic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Electronic] SET ARITHABORT OFF 
GO
ALTER DATABASE [Electronic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Electronic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Electronic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Electronic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Electronic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Electronic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Electronic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Electronic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Electronic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Electronic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Electronic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Electronic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Electronic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Electronic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Electronic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Electronic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Electronic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Electronic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Electronic] SET  MULTI_USER 
GO
ALTER DATABASE [Electronic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Electronic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Electronic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Electronic] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Electronic] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Electronic]
GO
/****** Object:  User [Simon]    Script Date: 4/10/2019 9:03:09 PM ******/
/*CREATE USER [Simon] FOR LOGIN [Simon] WITH DEFAULT_SCHEMA=[dbo]*/
GO
/****** Object:  Table [dbo].[AD]    Script Date: 4/10/2019 9:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AD](
	[idadmin] [varchar](50) NOT NULL,
	[passadmin] [varchar](50) NULL,
 CONSTRAINT [PK_AD] PRIMARY KEY CLUSTERED 
(
	[idadmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 4/10/2019 9:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHD](
	[MaDH] [int] NOT NULL,
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 4/10/2019 9:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MADH] [int] IDENTITY(1,1) NOT NULL,
	[DaThanhToan] [bit] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[MAKH] [int] NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[MADH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 4/10/2019 9:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[DiaChiKH] [nvarchar](200) NULL,
	[DienThoaiKH] [varchar](20) NULL,
	[MatKhau] [varchar](50) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 4/10/2019 9:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NOT NULL CONSTRAINT [DF_Table_1_Gender]  DEFAULT ((0)),
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](11) NULL,
	[MaCV] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SP]    Script Date: 4/10/2019 9:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SP](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[NgayCapNhat] [datetime] NULL,
	[HinhSP] [varchar](50) NULL,
	[SLTon] [int] NULL,
	[MATH] [int] NULL,
 CONSTRAINT [PK_SP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THUONGHIEU]    Script Date: 4/10/2019 9:03:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUONGHIEU](
	[MATH] [int] IDENTITY(1,1) NOT NULL,
	[TENTH] [nvarchar](50) NULL,
 CONSTRAINT [PK_THUONGHIEU] PRIMARY KEY CLUSTERED 
(
	[MATH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CTHD] ON 

INSERT [dbo].[CTHD] ([MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1, 1, 1, CAST(30790000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[CTHD] OFF
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([MADH], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MAKH]) VALUES (1, 0, 0, CAST(N'2019-04-10 20:00:33.833' AS DateTime), CAST(N'2019-04-14 00:00:00.000' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [Email], [DiaChiKH], [DienThoaiKH], [MatKhau], [NgaySinh]) VALUES (3, N'123', N'123', N'123', NULL, NULL, N'123', CAST(N'1998-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [Email], [DiaChiKH], [DienThoaiKH], [MatKhau], [NgaySinh]) VALUES (4, N'1', N'1', N'1', N'1', N'1', N'1', CAST(N'1999-12-12 00:00:00.000' AS DateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [Email], [DiaChiKH], [DienThoaiKH], [MatKhau], [NgaySinh]) VALUES (5, N'anngao', N'an', N'an', N'123', N'123', N'an', CAST(N'1998-10-15 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [Username], [Password], [Email], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [MaCV]) VALUES (1, N'ngochoi', N'1', N'phamvungochoi@gmail.com', N'Phạm Vũ Ngọc Hội', CAST(N'1998-01-01' AS Date), 1, N'Quận 4', N'0938996953', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Username], [Password], [Email], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [MaCV]) VALUES (2, N'hung', N'hung', N'hung', N'Phạm Trần Mạnh Hùng', CAST(N'1998-01-02' AS Date), 1, N'Bình Thạnh', N'0909199911', 2)
INSERT [dbo].[NhanVien] ([MaNV], [Username], [Password], [Email], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [DienThoai], [MaCV]) VALUES (3, N'kiet', N'kiet', N'kiet', N'Nguyễn Anh Kiệt', CAST(N'1998-03-01' AS Date), 1, N'LA', N'0919119911', 3)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[SP] ON 

INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (1, N'Dell Vostro V5568', CAST(14900000 AS Decimal(18, 0)), N'Bộ xử lýHãng CPU :	Intel(R)Công nghệ CPU :	Core i5Loại CPU :	7200UTốc độ CPU :	2.50 GHzBộ nhớ đệm :	3MBTốc độ tối đa :	3.10 GHzBo mạchChipset :	Intel(R) Core(TM) i5Tốc độ Bus :	2400MHzRAMDung lượng RAM :	4GBLoại RAM :	DDR4Tốc độ BUS RAM :	2400MHzĐĩa cứngLoại ổ đĩa :Dung lượng ổ đĩa :	HDD: 1 TB SATA3, Hỗ trợ khe cắm SSD M.2 SATA3Khe cắm ổ SSD :	CóĐồ họaChipset đồ họa :	Intel(R) HD 620 GraphicsBộ nhớ đồ họa :	ShareKiểu thiết kế đồ họa :	onboardMàn hìnhKích thước màn hình :	15.6-inch HDĐộ phân giải (W x H) :	1366 x 768 PixelsCông nghệ màn hình :	Anti-Glare LED-Backlit DisplayCảm ứng :	KhôngĐĩa quangCó sẵn đĩa quang :	NoTính năng mở rộng & cổng giao tiếpCổng giao tiếp :	1headset,1HDMI,1VGA,1RJ45,3USB 3.0,1USB 2.0Tính năng mở rộng :	KhôngGiao tiếp mạngLAN :	10/100/1000Chuẩn Wi-Fi :	802.11acCard ReaderĐọc thẻ nhớ :	3 in 1Khe đọc thẻ nhớ :	SD Card Reader (SD, SDHC, SDXC)WebcamĐộ phân giải :	720p HDThông tin thêm :	KhôngHệ điều hành, phầm mềm có sẵnHệ điều hành :	Ubuntu Linux 16.04Phần mềm có sẵn :	KhôngPIN/BatteryLoại pin :	3 cellKiểu pin :	lithium-ionThông tin khácCảm biến vân tay :	CóĐèn bàn phím :	CóBàn phím số :	CóPhụ kiện kèm theo :	Cáp, sạcKích thước & trọng lượngKích Thước :	19.2 mm x 380 mm x 252.5 mmTrọng lượng :	2 KgBảo hànhThời gian bảo hành :	12', CAST(N'2019-03-01 00:00:00.000' AS DateTime), N'1.png', 4, 1)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (2, N'Dell Inspiron N5570', CAST(17900000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	Intel
Công nghệ CPU :	Core i5
Loại CPU :	8250U
Tốc độ CPU :	1.60 GHz
Bộ nhớ đệm :	6 MB SmartCache
Tốc độ tối đa :	3.40 GHz
Bo mạch
Chipset :	Intel
Tốc độ Bus :	2400 MHz
Hỗ trợ RAM tối đa :	16 GB
RAM
Dung lượng RAM :	4 GB
Loại RAM :	DDR4
Tốc độ BUS RAM :	2400 MHz
Số lượng khe RAM :	2
Đĩa cứng
Loại ổ đĩa :	HDD
Dung lượng ổ đĩa :	1000 GB
Khe cắm ổ SSD :	Có
Đồ họa
Chipset đồ họa :	AMD Radeon 530
Bộ nhớ đồ họa :	2 GB
Kiểu thiết kế đồ họa :	Card rời
Màn hình
Kích thước màn hình :	15.6 inchs
Độ phân giải (W x H) :	1920 x 1080 Pixels
Công nghệ màn hình :	FHD
Cảm ứng :	Không
Âm thanh
Kênh âm thanh :	MaxxAudio Pro
Thông tin thêm :	Không
Đĩa quang
Có sẵn đĩa quang :	Có
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	HDMI, USB type C, Audio 3.5, 2xUSB3.0
Tính năng mở rộng :	Multi touchpad
Giao tiếp mạng
LAN :	Có
Chuẩn Wi-Fi :	802.11ac
Kết nối không dây khác :	Bluetooth 4.2
Card Reader
Đọc thẻ nhớ :	3-in-1 card reader
Khe đọc thẻ nhớ :	SD, SDHC, SDXC
Webcam
Độ phân giải :	HD 720p
Thông tin thêm :	Không
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Windows 10 Home 64-Bit
Phần mềm có sẵn :	Office 365
PIN/Battery
Loại pin :	42WHR
Kiểu pin :	liền
Thông tin khác
Cảm biến vân tay :	Không
Đèn bàn phím :	Có
Bàn phím số :	Có
Phụ kiện kèm theo :	Adapter + Dây nguồn
Kích thước & trọng lượng
Kích Thước :	380 x 258 x 22.7 mm
Trọng lượng :	2.33 Kg
Chất liệu :	ABS giả nhôm
Bảo hành
Thời gian bảo hành :	12 tháng', CAST(N'2019-02-01 00:00:00.000' AS DateTime), N'2.png', 2, 1)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (3, N'Nokia 8.1', CAST(7900000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	IPS LCD
Màu màn hình :	16 Triệu
Chuẩn màn hình :	Full HD+
Độ phân giải màn hình :	1080 x 2280 Pixels
Màn hình :	6.18 inches
Mặt kính màn hình :	Kính Cường Lực
Camera Trước
Độ phân giải :	20.0 MP
Thông tin khác :	Sticker AR (biểu tượng thực tế ảo), Nhận diện khuôn mặt, Chế độ làm đẹp, Quay video Full HD, Tự động lấy nét, Selfie ngược sáng HDR
Camera Sau
Độ phân giải :	12.0 MP + 13.0 MP
Quay phim :	Quay phim FullHD 1080p@30fps, Quay phim 4K 2160p@30fps
Đèn Flash :	Có
Chụp ảnh nâng cao :	Chụp ảnh xóa phông, Chế độ chụp ban đêm (ánh sáng yếu), AI Camera, Lấy nét theo pha, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS), Beautify
Cấu hình phần cứng
Tốc độ CPU :	2 x 2.2 GHz & 6x 1.7 GHz
Số nhân :	8
Chipset :	Qualcomm Snapdragon 710
RAM :	4 GB
Chip đồ họa (GPU) :	Adreno 616
Cảm biến :	Có
Bộ nhớ & Lưu trữ
Danh bạ lưu trữ :	Không giới hạn
ROM :	64 GB
Bộ nhớ còn lại :	Đang cập nhật
Thẻ nhớ ngoài :	MicroSD
Hỗ trợ thẻ nhớ tối đa :	400 GB
Thiết kế & Trọng lượng
Kiểu dáng :	Nguyên Khối
Chất liệu :	Khung kim loại + mặt lưng kính
Kích thước :	154.8 x 75.8 x 8 mm
Trọng lượng :	180 g
Khả năng chống nước :	Không
Thông tin pin
Loại pin :	Li-Ion
Dung lượng pin :	3500 mAh
Pin có thể tháo rời :	Không
Chế độ sạc nhanh :	Có
Kết nối & Cổng giao tiếp
Loại SIM :	2 SIM Nano (SIM 2 chung khe thẻ nhớ)
Khe cắm sim :	2
Wifi :	802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot
GPS :	BDS, A-GPS, GLONASS
Bluetooth :	v5.0, A2DP, LE
GPRS/EDGE :	Không
NFC :	Có
Cổng sạc :	USB Type-C
Jack (Input & Output) :	3.5 mm
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
FM radio :	Không
Đèn pin :	Có
Chức năng khác :	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Bảo hành
Thời gian bảo hành :	18 Tháng
Hệ điều hành
Hệ điều hành :	Android 9', CAST(N'2019-03-01 00:00:00.000' AS DateTime), N'10.png', 2, 2)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (4, N'iPhone Xs Max 64GB', CAST(33990000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Super AMOLED
Màu màn hình :	16 Triệu
Chuẩn màn hình :	Super Retina HD
Độ phân giải màn hình :	1125 x 2436 Pixels
Màn hình :	5.8 inchs
Mặt kính màn hình :	Kính Cường Lực
Camera Trước
Độ phân giải :	7.0 MP
Thông tin khác :	Selfie ngược sáng HDR, Camera góc rộng, Nhận diện khuôn mặt
Camera Sau
Độ phân giải :	Dual Camera 12.0 MP
Quay phim :	4K
Đèn Flash :	Có
Chụp ảnh nâng cao :	Zoom quang học, Chụp ảnh xóa phông, A.I Camera, HDR, Panorama, Chống rung quang học
Cấu hình phần cứng
Tốc độ CPU :	Đang cập nhật
Số nhân :	6
Chipset :	Apple A12 Bionic
RAM :	4 GB
Chip đồ họa (GPU) :	Apple GPU 4 nhân
Cảm biến :	3D Touch
Bộ nhớ & Lưu trữ
Danh bạ lưu trữ :	Không giới hạn
ROM :	512 GB
Bộ nhớ còn lại :	Đang cập nhật
Thẻ nhớ ngoài :	Không
Hỗ trợ thẻ nhớ tối đa :	Không
Thiết kế & Trọng lượng
Kiểu dáng :	Nguyên Khối + Thẳng
Chất liệu :	Viền thép, mặt lưng kính
Kích thước :	143.6 x 70.9 x 7.7 mm
Trọng lượng :	177 g
Khả năng chống nước :	Có
Thông tin pin
Loại pin :	Li-Ion
Dung lượng pin :	Lâu hơn iPhone X 30''
Pin có thể tháo rời :	Không
Chế độ sạc nhanh :	Có
Kết nối & Cổng giao tiếp
Loại SIM :	eSIM và NanoSIM
Khe cắm sim :	1
Wifi :	802.11ac
GPS :	A-GPS, GLONASS
Bluetooth :	v5.0
GPRS/EDGE :	Có
NFC :	Có
Cổng sạc :	Lightning
Jack (Input & Output) :	Lightning
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
FM radio :	Có
Đèn pin :	Có
Chức năng khác :	Hỗ trợ sạc nhanh, chống nước chuẩn IP68
Bảo hành
Thời gian bảo hành :	12 Tháng
Hệ điều hành
Hệ điều hành :	iOS 12', CAST(N'2019-04-01 00:00:00.000' AS DateTime), N'9.png', 5, 3)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (5, N'iPhone Xs 512GB', CAST(40900000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Super AMOLED
Màu màn hình :	16 Triệu
Chuẩn màn hình :	Super Retina HD
Độ phân giải màn hình :	1125 x 2436 Pixels
Màn hình :	5.8 inchs
Mặt kính màn hình :	Kính Cường Lực
Camera Trước
Độ phân giải :	7.0 MP
Thông tin khác :	Selfie ngược sáng HDR, Camera góc rộng, Nhận diện khuôn mặt
Camera Sau
Độ phân giải :	Dual Camera 12.0 MP
Quay phim :	4K
Đèn Flash :	Có
Chụp ảnh nâng cao :	Zoom quang học, Chụp ảnh xóa phông, A.I Camera, HDR, Panorama, Chống rung quang học
Cấu hình phần cứng
Tốc độ CPU :	Đang cập nhật
Số nhân :	6
Chipset :	Apple A12 Bionic
RAM :	4 GB
Chip đồ họa (GPU) :	Apple GPU 4 nhân
Cảm biến :	3D Touch
Bộ nhớ & Lưu trữ
Danh bạ lưu trữ :	Không giới hạn
ROM :	512 GB
Bộ nhớ còn lại :	Đang cập nhật
Thẻ nhớ ngoài :	Không
Hỗ trợ thẻ nhớ tối đa :	Không
Thiết kế & Trọng lượng
Kiểu dáng :	Nguyên Khối + Thẳng
Chất liệu :	Viền thép, mặt lưng kính
Kích thước :	143.6 x 70.9 x 7.7 mm
Trọng lượng :	177 g
Khả năng chống nước :	Có
Thông tin pin
Loại pin :	Li-Ion
Dung lượng pin :	Lâu hơn iPhone X 30''
Pin có thể tháo rời :	Không
Chế độ sạc nhanh :	Có
Kết nối & Cổng giao tiếp
Loại SIM :	eSIM và NanoSIM
Khe cắm sim :	1
Wifi :	802.11ac
GPS :	A-GPS, GLONASS
Bluetooth :	v5.0
GPRS/EDGE :	Có
NFC :	Có
Cổng sạc :	Lightning
Jack (Input & Output) :	Lightning
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
FM radio :	Có
Đèn pin :	Có
Chức năng khác :	Hỗ trợ sạc nhanh, chống nước chuẩn IP68
Bảo hành
Thời gian bảo hành :	12 Tháng
Hệ điều hành
Hệ điều hành :	iOS 12', CAST(N'2019-04-05 00:00:00.000' AS DateTime), N'6.png', 2, 3)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (6, N'Dell Inspiron N7588', CAST(30790000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	Intel
Công nghệ CPU :	Core i7
Loại CPU :	8750H
Tốc độ CPU :	2.20 GHz
Bộ nhớ đệm :	9 MB Cache
Tốc độ tối đa :	4.10 GHz
Bo mạch
Chipset :	Intel HM370
Tốc độ Bus :	2400 MHz
Hỗ trợ RAM tối đa :	32 GB
RAM
Dung lượng RAM :	8 GB
Loại RAM :	DDR4
Tốc độ BUS RAM :	2400 MHz
Số lượng khe RAM :	2
Đĩa cứng
Loại ổ đĩa :	HDD + SSD
Dung lượng ổ đĩa :	1 TB + 128 GB
Khe cắm ổ SSD :	Có
Đồ họa
Chipset đồ họa :	NVIDIA GeForce GTX 1050 Ti
Bộ nhớ đồ họa :	4 GB
Kiểu thiết kế đồ họa :	Card rời
Màn hình
Kích thước màn hình :	15.6 inchs
Độ phân giải (W x H) :	1920 x 1080 Pixels
Công nghệ màn hình :	IPS FHD
Cảm ứng :	Không
Âm thanh
Kênh âm thanh :	2.0
Thông tin thêm :	Waves MaxxAudio® Pro
Đĩa quang
Có sẵn đĩa quang :	Không
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	One USB 3.1 Gen 1 port with Power Delivery, Two USB 3.1 Gen 1, One Thunderbolt 3 (USB 3.1 Gen 2 Type-C) port/DisplayPort, One HDMI
Tính năng mở rộng :	Không
Giao tiếp mạng
LAN :	10/100/1000 Mbps
Chuẩn Wi-Fi :	Wi-Fi 802.11ac
Kết nối không dây khác :	Bluetooth 4.2 + Miracast
Card Reader
Đọc thẻ nhớ :	4-in-1
Khe đọc thẻ nhớ :	SD, SDHC, SDXC, MMC
Webcam
Độ phân giải :	1280 x 720 (HD) at 30 fps
Thông tin thêm :	Không
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Dos
Phần mềm có sẵn :	Không
PIN/Battery
Loại pin :	4-cell 56 WHr "smart" lithium-ion
Kiểu pin :	Liền
Thông tin khác
Cảm biến vân tay :	Không
Đèn bàn phím :	Có
Bàn phím số :	Có
Phụ kiện kèm theo :	Sạc
Kích thước & trọng lượng
Kích Thước :	389 x 274.7 x 24.95 mm
Trọng lượng :	2.70 Kg
Chất liệu :	Plastic
Bảo hành
Thời gian bảo hành :	12 tháng', CAST(N'2019-04-02 00:00:00.000' AS DateTime), N'3.png', 2, 1)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (7, N'Dell XPS15/i7-8750H', CAST(53900000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	Intel
Công nghệ CPU :	Core i7
Loại CPU :	8750H
Tốc độ CPU :	2.20 GHz
Bộ nhớ đệm :	9 MB cache
Tốc độ tối đa :	4.10 GHz
Bo mạch
Chipset :	Intel (R) Core (TM) I7
Tốc độ Bus :	2400 MHz
Hỗ trợ RAM tối đa :	Không
RAM
Dung lượng RAM :	16 GB
Loại RAM :	DDR4
Tốc độ BUS RAM :	2666 MHz
Số lượng khe RAM :	2
Đĩa cứng
Loại ổ đĩa :	SSD PCLE
Dung lượng ổ đĩa :	512 GB
Khe cắm ổ SSD :	Không
Đồ họa
Chipset đồ họa :	NVIDIA GEFORCE GTX 1050 4GB GDDR5
Bộ nhớ đồ họa :	4 GB
Kiểu thiết kế đồ họa :	Card rời
Màn hình
Kích thước màn hình :	15.6 inchs
Độ phân giải (W x H) :	1920 x 1080 Pixels
Công nghệ màn hình :	InfinityEdge display
Cảm ứng :	Không
Âm thanh
Kênh âm thanh :	Power Cord
Thông tin thêm :	HD Audio
Đĩa quang
Có sẵn đĩa quang :	Không
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	USB 3.0, Headset
Tính năng mở rộng :	Finger Print Reader
Giao tiếp mạng
LAN :	10/100/1000
Chuẩn Wi-Fi :	802.11ac Dual Band
Kết nối không dây khác :	Bluetooth v4.1
Card Reader
Đọc thẻ nhớ :	Không
Khe đọc thẻ nhớ :	Không
Webcam
Độ phân giải :	1.3 MP
Thông tin thêm :	HD Webcam
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Windows 10 Home Plus
Phần mềm có sẵn :	Microsoft Office 365 Personal DFO
PIN/Battery
Loại pin :	6 Cell
Kiểu pin :	Liền
Thông tin khác
Cảm biến vân tay :	Có
Đèn bàn phím :	Có
Bàn phím số :	Không
Phụ kiện kèm theo :	Sạc, Sách HDSD
Kích thước & trọng lượng
Kích Thước :	304.16 x 200.25 x 8.95 mm
Trọng lượng :	1.80 Kg
Chất liệu :	Aluminum
Bảo hành
Thời gian bảo hành :	12 tháng', CAST(N'2019-03-02 00:00:00.000' AS DateTime), N'4.png', 3, 1)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (8, N'Dell INS N5379', CAST(22990000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	Intel
Công nghệ CPU :	Core i7
Loại CPU :	8750H
Tốc độ CPU :	2.20 GHz
Bộ nhớ đệm :	9 MB Cache
Tốc độ tối đa :	4.10 GHz
Bo mạch
Chipset :	Intel HM370
Tốc độ Bus :	2400 MHz
Hỗ trợ RAM tối đa :	32 GB
RAM
Dung lượng RAM :	8 GB
Loại RAM :	DDR4
Tốc độ BUS RAM :	2400 MHz
Số lượng khe RAM :	2
Đĩa cứng
Loại ổ đĩa :	HDD + SSD
Dung lượng ổ đĩa :	1 TB + 128 GB
Khe cắm ổ SSD :	Có
Đồ họa
Chipset đồ họa :	NVIDIA GeForce GTX 1050 Ti
Bộ nhớ đồ họa :	4 GB
Kiểu thiết kế đồ họa :	Card rời
Màn hình
Kích thước màn hình :	15.6 inchs
Độ phân giải (W x H) :	1920 x 1080 Pixels
Công nghệ màn hình :	IPS FHD
Cảm ứng :	Không
Âm thanh
Kênh âm thanh :	2.0
Thông tin thêm :	Waves MaxxAudio® Pro
Đĩa quang
Có sẵn đĩa quang :	Không
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	One USB 3.1 Gen 1 port with Power Delivery, Two USB 3.1 Gen 1, One Thunderbolt 3 (USB 3.1 Gen 2 Type-C) port/DisplayPort, One HDMI
Tính năng mở rộng :	Không
Giao tiếp mạng
LAN :	10/100/1000 Mbps
Chuẩn Wi-Fi :	Wi-Fi 802.11ac
Kết nối không dây khác :	Bluetooth 4.2 + Miracast
Card Reader
Đọc thẻ nhớ :	4-in-1
Khe đọc thẻ nhớ :	SD, SDHC, SDXC, MMC
Webcam
Độ phân giải :	1280 x 720 (HD) at 30 fps
Thông tin thêm :	Không
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Dos
Phần mềm có sẵn :	Không
PIN/Battery
Loại pin :	4-cell 56 WHr "smart" lithium-ion
Kiểu pin :	Liền
Thông tin khác
Cảm biến vân tay :	Không
Đèn bàn phím :	Có
Bàn phím số :	Có
Phụ kiện kèm theo :	Sạc
Kích thước & trọng lượng
Kích Thước :	389 x 274.7 x 24.95 mm
Trọng lượng :	2.70 Kg
Chất liệu :	Plastic
Bảo hành
Thời gian bảo hành :	12 tháng', CAST(N'2019-02-01 00:00:00.000' AS DateTime), N'5.png', 2, 1)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (9, N'Samsung Galaxy S10+ (8 + 512GB)', CAST(28900000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Curved Dynamic AMOLED
Màu màn hình :	16 Triệu
Chuẩn màn hình :	Quad HD+
Độ phân giải màn hình :	1440 x 3040 pixels
Màn hình :	6.4 inches
Mặt kính màn hình :	Corning Gorilla Glass 6
Camera Trước
Độ phân giải :	Chính 10 MP & Phụ 8 MP
Thông tin khác :	Sticker AR (biểu tượng thực tế ảo), Flash màn hình, Selfie bằng cử chỉ, Nhận diện khuôn mặt, Chế độ làm đẹp, Quay video Full HD, Tự động lấy nét, Camera góc rộng, Selfie ngược sáng HDR, Chụp ảnh xoá phông, Quay phim 4K
Camera Sau
Độ phân giải :	Chính 12 MP & Phụ 12 MP, 16 MP
Quay phim :	Quay phim siêu chậm 960 fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@60fps
Đèn Flash :	Có
Chụp ảnh nâng cao :	Chế độ Slow Motion, Zoom quang học (Camera kép), Chụp ảnh xóa phông, Super Slow Motion (quay siêu chậm), Điều chỉnh khẩu độ, Lấy nét theo pha, A.I Camera, Chế độ chụp ban đêm (ánh sáng yếu), Chế độ Time-Lapse, Tự động lấy nét, Chạm lấy nét, Nhận diện
Cấu hình phần cứng
Tốc độ CPU :	2 nhân 2.7 GHz, 2 nhân 2.3 GHz và 4 nhân 1.9 GHz
Số nhân :	8
Chipset :	Exynos 9820 8 nhân 64-bit
RAM :	8 GB
Chip đồ họa (GPU) :	Mali-G76 MP12
Cảm biến :	Mở khóa bằng khuôn mặt, Mở khoá vân tay dưới màn hình
Bộ nhớ & Lưu trữ
Danh bạ lưu trữ :	Không giới hạn
ROM :	512 GB
Bộ nhớ còn lại :	Khoảng 108 GB
Thẻ nhớ ngoài :	MicroSD
Hỗ trợ thẻ nhớ tối đa :	512 GB
Thiết kế & Trọng lượng
Kiểu dáng :	Nguyên Khối
Chất liệu :	Khung kim loại + mặt kính cường lực
Kích thước :	Dài 157.6 mm - Ngang 74.1 mm - Dày 7.8 mm
Trọng lượng :	175g
Khả năng chống nước :	Có
Thông tin pin
Loại pin :	Li-Ion
Dung lượng pin :	4100 mAh
Pin có thể tháo rời :	Không
Chế độ sạc nhanh :	Có
Kết nối & Cổng giao tiếp
Loại SIM :	Nano SIM
Khe cắm sim :	2
Wifi :	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot
GPS :	A-GPS, GLONASS, BDS
Bluetooth :	v5.0, apt-X, A2DP, LE
GPRS/EDGE :	Không
NFC :	Có
Cổng sạc :	USB Type-C
Jack (Input & Output) :	3.5mm
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
FM radio :	Có
Đèn pin :	Có
Chức năng khác :	Đang cập nhật
Bảo hành
Thời gian bảo hành :	12 Tháng
Hệ điều hành
Hệ điều hành :	Android 9.0 (Pie)', CAST(N'2019-01-02 00:00:00.000' AS DateTime), N'7.png', 3, 6)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (10, N'Samsung Galaxy S9+', CAST(20900000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Curved Dynamic AMOLED
Màu màn hình :	16 Triệu
Chuẩn màn hình :	Quad HD+
Độ phân giải màn hình :	1440 x 3040 pixels
Màn hình :	6.1 inches
Mặt kính màn hình :	Corning Gorilla Glass 6
Camera Trước
Độ phân giải :	10MP
Thông tin khác :	Sticker AR (biểu tượng thực tế ảo), Flash màn hình, Selfie bằng cử chỉ, Nhận diện khuôn mặt, Chế độ làm đẹp, Quay video Full HD, Tự động lấy nét, Camera góc rộng, Selfie ngược sáng HDR, Chụp ảnh xoá phông, Quay phim 4K
Camera Sau
Độ phân giải :	Chính 12 MP & Phụ 12 MP, 16 MP
Quay phim :	2160p@60fps, 1080p@240fps, 720p@960fps, HDR, dual-video rec
Đèn Flash :	Có
Chụp ảnh nâng cao :	Quay phim siêu chậm 960 fps, Quay phim FullHD 1080p@240fps, Quay phim 4K 2160p@60fps
Cấu hình phần cứng
Tốc độ CPU :	2 nhân 2.7 GHz, 2 nhân 2.3 GHz và 4 nhân 1.9 GHz
Số nhân :	8
Chipset :	Exynos 9820 8 nhân 64-bit
RAM :	8 GB
Chip đồ họa (GPU) :	Mali-G76 MP12
Cảm biến :	Mở khóa bằng vân tay siêu âm, Mở khóa bằng khuôn mặt 2D,...
Bộ nhớ & Lưu trữ
Danh bạ lưu trữ :	Không giới hạn
ROM :	128 GB
Bộ nhớ còn lại :	Khoảng 108 GB
Thẻ nhớ ngoài :	MicroSD
Hỗ trợ thẻ nhớ tối đa :	512 GB
Thiết kế & Trọng lượng
Kiểu dáng :	Nguyên Khối
Chất liệu :	Khung kim loại + mặt kính cường lực
Kích thước :	Dài 149.9 mm - Ngang 70.4 mm - Dày 7.8 mm
Trọng lượng :	157g
Khả năng chống nước :	Có
Thông tin pin
Loại pin :	Li-Ion
Dung lượng pin :	3400 mAh
Pin có thể tháo rời :	Không
Chế độ sạc nhanh :	Có
Kết nối & Cổng giao tiếp
Loại SIM :	Nano SIM
Khe cắm sim :	2
Wifi :	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot
GPS :	A-GPS, GLONASS, BDS
Bluetooth :	v5.0, apt-X, A2DP, LE
GPRS/EDGE :	Không
NFC :	Có
Cổng sạc :	USB Type C
Jack (Input & Output) :	3.5mm
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
FM radio :	Có
Đèn pin :	Có
Chức năng khác :	Đang cập nhật
Bảo hành
Thời gian bảo hành :	12 Tháng
Hệ điều hành
Hệ điều hành :	Android 9.0 (Pie)', CAST(N'2019-01-02 00:00:00.000' AS DateTime), N'8.png', 3, 6)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (11, N'Samsung Galaxy A50', CAST(6900000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Super AMOLED
Màu màn hình :	16 Triệu
Chuẩn màn hình :	Full HD +
Độ phân giải màn hình :	1080 x 2340 Pixels
Màn hình :	6.4 inches
Mặt kính màn hình :	Kính cường lực Gorilla Glass 3
Camera Trước
Độ phân giải :	25.0 MP
Thông tin khác :	Nhận diện khuôn mặt, Chế độ làm đẹp, Quay video Full HD, Tự động lấy nét, Camera góc rộng, Selfie ngược sáng HDR, Sticker AR (biểu tượng thực tế ảo), Quay video HD
Camera Sau
Độ phân giải :	25 MP, 8 MP và 5 MP (3 camera)
Quay phim :	Quay phim FullHD 1080p@30fps, Quay phim 4K 2160p@30fps
Đèn Flash :	Có
Chụp ảnh nâng cao :	Chụp ảnh xóa phông, Chế độ Slow Motion, A.I Camera, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Làm đẹp (Beautify)
Cấu hình phần cứng
Tốc độ CPU :	2.3 GHz
Số nhân :	8
Chipset :	Exynos 9610 8 nhân 64-bit
RAM :	4 GB
Chip đồ họa (GPU) :	Mali-G72 MP3
Cảm biến :	Cảm biến vân tay dưới màn hình, App Pair, Nhận Diện Khuôn Mặt, Quà tặng Galaxy, Smart Switch, Dual Messenger, Thư Mục Bảo Mật, Âm thanh vòm cao cấp Dolby Atmos, Trợ lý ảo Bixby
Bộ nhớ & Lưu trữ
Danh bạ lưu trữ :	Không giới hạn
ROM :	64 GB
Bộ nhớ còn lại :	Đang cập nhật
Thẻ nhớ ngoài :	MicroSD
Hỗ trợ thẻ nhớ tối đa :	512 GB
Thiết kế & Trọng lượng
Kiểu dáng :	Nguyên Khối
Chất liệu :	Nhựa
Kích thước :	Dài 158.5 mm - Ngang 74.7 mm - Dày 7.7 mm
Trọng lượng :	166 g
Khả năng chống nước :	Không
Thông tin pin
Loại pin :	Li-Ion
Dung lượng pin :	4000 mAh
Pin có thể tháo rời :	Không
Chế độ sạc nhanh :	Có
Kết nối & Cổng giao tiếp
Loại SIM :	Nano SIM
Khe cắm sim :	2
Wifi :	Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi Direct, Wi-Fi hotspot
GPS :	BDS, A-GPS, GLONASS
Bluetooth :	v5.0, A2DP, LE
GPRS/EDGE :	Không
NFC :	Không
Cổng sạc :	Micro USB
Jack (Input & Output) :	3.5 mm
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
FM radio :	Có
Đèn pin :	Có
Chức năng khác :	Màn hình luôn hiển thị AOD, Mặt kính 2.5D, Chặn tin nhắn, Chặn cuộc gọi, Sạc pin nhanh, Đèn pin
Bảo hành
Thời gian bảo hành :	12 Tháng
Hệ điều hành
Hệ điều hành :	Android 9.0 (Pie)', CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'11.png', 2, 6)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (12, N'Samsung Galaxy Note 8', CAST(14900000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Super AMOLED
Màu màn hình :	16 Triệu màu
Chuẩn màn hình :	2K
Độ phân giải màn hình :	2960 x 1440 pixels
Mặt kính màn hình :	Corning Gorilla Glass 5
Camera Trước
Video Call :	Có
Độ phân giải :	8.0 MP
Camera Sau
Đèn Flash :	Có
Độ phân giải :	Dual 12.0 MP
Cấu hình phần cứng
Tốc độ CPU :	4 nhân 2.3 GHz và 4 nhân 1.7 GHz
Số nhân :	8 Nhân
Chipset :	Exynos 8895
RAM :	6 GB
Chip đồ họa (GPU) :	Mali™ G71
Bộ nhớ & Lưu trữ
Danh bạ lưu trữ :	Không giới hạn
ROM :	64 GB
Bộ nhớ còn lại :	Đang cập nhật
Thẻ nhớ ngoài :	MicroSD
Hỗ trợ thẻ nhớ tối đa :	256 GB
Thiết kế & Trọng lượng
Kiểu dáng :	Thanh (thẳng) + Cảm ứng
Kích thước :	162.5 x 74.8 x 8.6 mm
Trọng lượng :	195 g
Khả năng chống nước :	Chuẩn IP68
Thông tin pin
Loại pin :	Li-Ion
Dung lượng pin :	3300 mAh
Chế độ sạc nhanh :	Có
Kết nối & Cổng giao tiếp
Khe cắm sim :	2 Sim
Wifi :	Wi-Fi 802.11 a/b/g/n/ac
GPS :	Có
Bluetooth :	v5.0
GPRS/EDGE :	Có
Băng tần 3G :	Có
Băng tần 4G :	Có
Kết nối USB :	USB Type-C
Cổng sạc :	USB Type-C
Bảo hành
Thời gian bảo hành :	12 Tháng', CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'12.png', 2, 6)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (13, N'Samsung Galaxy A8 Star (2018)', CAST(8290000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Super AMOLED
Màu màn hình :	Đang cập nhật
Chuẩn màn hình :	Full HD
Độ phân giải màn hình :	Full HD+ (1080 x 2220 Pixels)
Công nghệ cảm ứng :	Đang cập nhật
Màn hình :	6.3"
Mặt kính màn hình :	Kính cường lực Gorilla Glass
Camera Trước
Độ phân giải :	24 MP
Thông tin khác :	Quay video Full HD, Đèn Flash trợ sáng, Selfie ngược sáng HDR, Nhận diện khuôn mặt, Chế độ làm đẹp
Camera Sau
Độ phân giải :	24 MP và 16 MP (2 camera)
Quay phim :	Quay phim FullHD 1080p@30fps
Đèn Flash :	Có
Chụp ảnh nâng cao :	Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Beautify
Cấu hình phần cứng
Tốc độ CPU :	4 nhân 2.2 GHz & 4 nhân 1.8 GHz
Số nhân :	8 nhân
Chipset :	Qualcomm Snapdragon 660
RAM :	4 GB
Chip đồ họa (GPU) :	Adreno 512
Cảm biến :	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Bộ nhớ & Lưu trữ
Danh bạ lưu trữ :	Đang cập nhật
ROM :	64 GB
Bộ nhớ còn lại :	48GB
Thẻ nhớ ngoài :	MicroSD
Hỗ trợ thẻ nhớ tối đa :	400 GB
Thiết kế & Trọng lượng
Kiểu dáng :	Nguyên khối
Chất liệu :	Khung kim loại + mặt kính cường lực
Kích thước :	Dài 162.4 mm - Ngang 77 mm - Dày 7.6 mm
Trọng lượng :	191 g
Khả năng chống nước :	Không
Thông tin pin
Loại pin :	Pin chuẩn Li-Ion
Dung lượng pin :	3700 mAh
Pin có thể tháo rời :	Không
Thời gian chờ :	Đang cập nhật
Thời gian đàm thoại :	Đang cập nhật
Thời gian sạc đầy :	Đang cập nhật
Chế độ sạc nhanh :	Có
Kết nối & Cổng giao tiếp
Băng tần 2G :	Có
Băng tần 3G :	Có
Băng tần 4G :	Có
Loại SIM :	Nano Sim
Khe cắm sim :	2 Sim
Wifi :	Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot
GPS :	Có
Bluetooth :	v5.0, A2DP, LE, EDR
GPRS/EDGE :	Có
NFC :	Có
Cổng sạc :	USB Type-C
Jack (Input & Output) :	3.5 mm
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
FM radio :	Không
Đèn pin :	Có
Chức năng khác :	không
Bảo hành
Thời gian bảo hành :	12 Tháng
Hệ điều hành
Hệ điều hành :	Android 8.0 (Oreo)', CAST(N'2019-01-05 00:00:00.000' AS DateTime), N'13.png', 3, 6)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (14, N'iPhone 8 Plus 64GB', CAST(19000000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Widescreen LCD Multi-Touch display with IPS technology
Màu màn hình :	16 Triệu màu
Chuẩn màn hình :	Retina HD
Độ phân giải màn hình :	1920 x 1080 pixels
Công nghệ cảm ứng :	3D Touch
Mặt kính màn hình :	Kính cường lực
Camera Trước
Video Call :	Có
Độ phân giải :	7.0 MP
Camera Sau
Độ phân giải :	Dual 12.0 MP
Quay phim :	2160p@24/30/60fps, 1080p@30/60/120/240fps
Đèn Flash :	Có
Chụp ảnh nâng cao :	Geo-tagging, simultaneous 4K video and 8MP image recording, touch focus, face/smile detection, HDR (photo/panorama)
Cấu hình phần cứng
Số nhân :	6
Chipset :	Apple A11 Bionic
RAM :	3 GB
Chip đồ họa (GPU) :	Apple GPU (three-core graphics)
Cảm biến :	Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer
Bộ nhớ & Lưu trữ
Danh bạ lưu trữ :	Không giới hạn
ROM :	64 GB
Thẻ nhớ ngoài :	Không
Hỗ trợ thẻ nhớ tối đa :	Không
Thiết kế & Trọng lượng
Kiểu dáng :	Thanh (thẳng) + Cảm ứng
Chất liệu :	Khung kim loại + mặt kính cường lực
Kích thước :	158.4 x 78.1 x 7.5 mm
Trọng lượng :	202 g
Khả năng chống nước :	Chuẩn IP67
Thông tin pin
Loại pin :	Li-Ion
Dung lượng pin :	2675 mAh
Pin có thể tháo rời :	Không
Kết nối & Cổng giao tiếp
Băng tần 3G :	UMTS/HSPA+/DC-HSDPA (850, 900, 1700/2100, 1900, 2100 MHz)
Băng tần 4G :	TD-LTE (Bands 34, 38, 39, 40, 41)
Loại SIM :	Nano Sim
Khe cắm sim :	1 Sim
Wifi :	802.11ac Wi‑Fi with MIMO
GPS :	Có
Bluetooth :	v5.0
Kết nối USB :	Lightning
Băng tần 2G :	GSM/EDGE (850, 900, 1800, 1900 MHz)
Cổng sạc :	Lightning
Jack (Input & Output) :	Lightning
Giải trí & Ứng dụng
Xem phim :	HEVC, H.264, MPEG-4 Part 2, and Motion JPEG
Nghe nhạc :	AAC-LC, HE-AAC, HE-AAC v2, Protected AAC, MP3, Linear PCM, Apple Lossless, FLAC
Ghi âm :	Có
FM radio :	Có
Đèn pin :	Có
Bảo hành
Thời gian bảo hành :	12 Tháng
Hệ điều hành
Hệ điều hành :	iOS 11', CAST(N'2019-03-04 00:00:00.000' AS DateTime), N'14.png', 4, 3)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (15, N'iPhone 7 Plus 32GB', CAST(13000000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Retina
Màu màn hình :	16 Triệu màu
Chuẩn màn hình :	Full HD
Độ phân giải màn hình :	1920 x 1080 pixels
Công nghệ cảm ứng :	3D Touch
Mặt kính màn hình :	Kính oleophobic (ion cường lực)
Camera Trước
Video Call :	Có
Độ phân giải :	7.0 MP
Thông tin khác :	Selfie ngược sáng HDR, Tự động lấy nét, Quay video Full HD, Nhận diện khuôn mặt, Retina Flash
Camera Sau
Độ phân giải :	Dual 12.0 MP
Quay phim :	Quay phim 4K 2160p@30fps
Đèn Flash :	Có
Chụp ảnh nâng cao :	Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)
Cấu hình phần cứng
Tốc độ CPU :	2.3 GHz
Số nhân :	4 Nhân
Chipset :	A10
RAM :	3 GB
Chip đồ họa (GPU) :	M10
Bộ nhớ & Lưu trữ
Danh bạ lưu trữ :	Không giới hạn
ROM :	32 GB
Bộ nhớ còn lại :	~28 GB
Thẻ nhớ ngoài :	Không
Hỗ trợ thẻ nhớ tối đa :	Không
Thiết kế & Trọng lượng
Kiểu dáng :	Thanh (thẳng) + Cảm ứng
Chất liệu :	Hợp kim nhôm nguyên khối (mặt kính cong 2,5D)
Kích thước :	158.2 x 77.9 x 7.3 mm
Trọng lượng :	188 g
Khả năng chống nước :	Chuẩn IP67
Thông tin pin
Loại pin :	Li-Ion
Dung lượng pin :	11.1 Wh (2900 mAh)
Pin có thể tháo rời :	Không
Chế độ sạc nhanh :	Không
Kết nối & Cổng giao tiếp
Băng tần 2G :	GSM / EDGE (850, 900, 1800, 1900 MHz)
Băng tần 3G :	UMTS / HSPA + / DC-HSDPA (850, 900, 1700/2100, 1900, 2100 MHz)
Băng tần 4G :	Có
Loại SIM :	Nano Sim
Khe cắm sim :	1 Sim
Wifi :	Wi-Fi 802.11 a/b/g/n/ac
GPS :	A-GPS và GLONASS
Bluetooth :	v4.2
GPRS/EDGE :	Có
NFC :	Có (Apple Pay)
Kết nối USB :	Lightning
Cổng kết nối khác :	Air Play, OTG, HDMI
Cổng sạc :	Lightning
Jack (Input & Output) :	Lightning
Giải trí & Ứng dụng
Xem phim :	H.265, 3GP, MP4, AVI, WMV, H.264(MPEG4-AVC), DivX, WMV9, Xvid
Nghe nhạc :	Lossless, Midi, MP3, WAV, WMA, AAC, eAAC+
Ghi âm :	Có
FM radio :	Không
Đèn pin :	Có', CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'15.png', 4, 3)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (16, N'iPad Pro 11 WI-FI 4G 64GB', CAST(25900000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Retina display
Màu màn hình :	16 triệu màu
Độ phân giải :	2388 x 1668 Pixels
Kích thước màn hình :	11.0 inches
Cấu hình phần cứng
Loại CPU (Chipset) :	Apple A12X Bionic (7 nm)
Hệ điều hành :	iOS 12
Số nhân :	Octa-Core
Tốc độ CPU :	Đang cập nhật
Chip đồ hoạ (GPU) :	Apple GPU (7-core graphics)
RAM :	4 GB
Cảm biến :	Face ID, gia tốc kế, con quay hồi chuyển, khoảng cách, thước đo
Bộ nhớ & Lưu trữ
ROM :	64 GB
Thẻ nhớ ngoài :	Không
Hỗ trợ thẻ nhớ tối đa :	Không
Chụp hình & Quay phim
Camera sau :	12.0 MP
Camera trước :	7.0 MP
Đèn Flash :	Có
Tính năng camera :	Đèn flash hai tông kép, HDR
Quay Phim :	Video 4K / 1080p / 720p, 30 fps, Slow motion
Kết nối & Cổng giao tiếp
Số khe sim :	1
Loại Sim :	eSIM và NanoSIM
Thực hiện cuộc gọi :	Không
Wi-Fi :	802.11 a/b/g/n/ac
Bluetooth :	v5.0
GPS :	Có, với A-GPS, GLONASS, GALILEO, QZSS
Cổng kết nối/ sạc :	Type-C
Jack (Input & Output) :	USB Type-C port
Kết nối khác :	Không
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
Công vụ văn phòng :	Cài đặt ứng dụng trên App Store
Ứng dụng khác :	Không
Thiết kế & Trọng lượng
Chất liệu :	Nhôm nguyên khối
Kích thước (DxRxC) :	Dài 247.6 mm - Rộng 178.5 mm - Dày 5.9 mm
Trọng lượng :	468g
Pin & Dung lượng
Loại pin :	Lithium polymer
Dung lượng pin :	29.37-watt-hour
Bảo hành
Thời gian bảo hành :	12 Tháng', CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'16.png', 4, 3)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (17, N'iPad Pro 12.9 WI-FI 512GB 2018', CAST(36900000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Retina display
Màu màn hình :	16 triệu màu
Độ phân giải :	2732 x 2048 Pixels
Kích thước màn hình :	12.9 inches
Cấu hình phần cứng
Loại CPU (Chipset) :	Apple A12X Bionic (7 nm)
Hệ điều hành :	iOS 12
Số nhân :	Octa-Core
Tốc độ CPU :	Đang cập nhật
Chip đồ hoạ (GPU) :	Apple GPU (7-core graphics)
RAM :	4 GB
Cảm biến :	Face ID, gia tốc kế, con quay hồi chuyển, khoảng cách, thước đo
Bộ nhớ & Lưu trữ
ROM :	512 GB
Thẻ nhớ ngoài :	Không
Hỗ trợ thẻ nhớ tối đa :	Không
Chụp hình & Quay phim
Camera sau :	12.0 MP
Camera trước :	7.0 MP
Đèn Flash :	Có
Tính năng camera :	Đèn flash hai tông kép, HDR
Quay Phim :	Video 4K / 1080p / 720p, 30 fps, Slow motion
Kết nối & Cổng giao tiếp
Số khe sim :	Không
Loại Sim :	Không
Thực hiện cuộc gọi :	Không
Wi-Fi :	802.11 a/b/g/n/ac
Bluetooth :	v5.0
GPS :	Có, với A-GPS, GLONASS, GALILEO, QZSS
Cổng kết nối/ sạc :	Type-C
Jack (Input & Output) :	USB Type-C port
Kết nối khác :	Không
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
Công vụ văn phòng :	Cài đặt ứng dụng trên App Store
Ứng dụng khác :	Không
Thiết kế & Trọng lượng
Chất liệu :	Nhôm nguyên khối
Kích thước (DxRxC) :	Dài 280.6 mm - Rộng 214.9 mm - Dày 5.9 mm
Trọng lượng :	631g
Pin & Dung lượng
Loại pin :	Lithium polymer
Dung lượng pin :	36.71-watt-hour
Bảo hành
Thời gian bảo hành :	12 Tháng', CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'17.png', 3, 3)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (18, N'iPad 2018 WiFi 32GB', CAST(8990000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Retina display
Màu màn hình :	16 triệu màu
Độ phân giải :	1536 x 2048 pixels
Kích thước màn hình :	9.7 inches
Công nghệ cảm ứng :	Multi-Touch
Cấu hình phần cứng
Loại CPU (Chipset) :	A10 Fusion
Hệ điều hành :	iOS11
Số nhân :	4 nhân
Tốc độ CPU :	2.34 GHz
Chip đồ hoạ (GPU) :	PowerVR Series7XT Plus
RAM :	2GB
Cảm biến :	Touch ID
Bộ nhớ & Lưu trữ
ROM :	32GB
Thẻ nhớ ngoài :	Không
Hỗ trợ thẻ nhớ tối đa :	Không
Chụp hình & Quay phim
Camera sau :	8.0 MP
Camera trước :	1.2 MP
Đèn Flash :	Không
Tính năng camera :	Tự động lấy nét, Chạm lấy nét, HDR
Quay Phim :	1080p HD
Kết nối & Cổng giao tiếp
Số khe sim :	N
Loại Sim :	N
Thực hiện cuộc gọi :	Có
Hỗ trợ 3G :	No
4G LTE :	No
Wi-Fi :	Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot
Bluetooth :	4.2, A2DP, EDR, LE
GPS :	A-GPS
Cổng kết nối/ sạc :	Lightning
Jack (Input & Output) :	3.5 mm
Kết nối khác :	N
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
Công vụ văn phòng :	Y
Ứng dụng khác :	Hỗ trợ bút cảm ứng Apple Pencil
Thiết kế & Trọng lượng
Chất liệu :	Nhôm
Kích thước (DxRxC) :	240 x 169.5 x 7.5 mm
Trọng lượng :	469 g
Pin & Dung lượng
Loại pin :	Li-Ion
Dung lượng pin :	32.4 Wh
Thời gian sử dụng :	Up to 9 hours
Thời gian sạc đầy :	Không
Bảo hành
Thời gian bảo hành :	12 tháng', CAST(N'2018-12-01 00:00:00.000' AS DateTime), N'18.png', 2, 3)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (19, N'Samsung Galaxy Tab A6 10.1 (2016) - Spen', CAST(7490000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Đang cập nhật
Màu màn hình :	16 triệu màu
Độ phân giải :	1920 x 1200 pixels
Kích thước màn hình :	8.0 inchs
Cấu hình phần cứng
Loại CPU (Chipset) :	Exynos 7904
Hệ điều hành :	Đang cập nhật
Số nhân :	8
Tốc độ CPU :	2 X A73 1.8GHz, 6 X A53 1.6GHz
Chip đồ hoạ (GPU) :	G71 MP2
RAM :	3 GB
Cảm biến :	Đang cập nhật
Bộ nhớ & Lưu trữ
ROM :	32 MB
Thẻ nhớ ngoài :	MicroSD
Hỗ trợ thẻ nhớ tối đa :	512 GB
Chụp hình & Quay phim
Camera sau :	8.0 MP
Camera trước :	5.0 MP
Đèn Flash :	Có
Tính năng camera :	Đang cập nhật
Quay Phim :	Đang cập nhật
Kết nối & Cổng giao tiếp
Số khe sim :	2
Loại Sim :	Nano SIM
Thực hiện cuộc gọi :	Có
Wi-Fi :	Wi-Fi 802.11 b/g/n, WiFi Direct, hotspot
Bluetooth :	Bluetooth 5.0
GPS :	Đang cập nhật
Cổng kết nối/ sạc :	USB Type C
Jack (Input & Output) :	3.5mm
Kết nối khác :	Đang cập nhật
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
Công vụ văn phòng :	Đang cập nhật
Ứng dụng khác :	Đang cập nhật
Thiết kế & Trọng lượng
Chất liệu :	Đang cập nhật
Kích thước (DxRxC) :	122.2 mm x 201.4 mm x 8.9 mm
Trọng lượng :	Đang cập nhật
Pin & Dung lượng
Loại pin :	Li-Ion
Dung lượng pin :	4.200 mAh
Bảo hành
Thời gian bảo hành :	12 ThángMàn hình
Công nghệ màn hình :	Đang cập nhật
Màu màn hình :	16 triệu màu
Độ phân giải :	1920 x 1200 pixels
Kích thước màn hình :	8.0 inchs
Cấu hình phần cứng
Loại CPU (Chipset) :	Exynos 7904
Hệ điều hành :	Đang cập nhật
Số nhân :	8
Tốc độ CPU :	2 X A73 1.8GHz, 6 X A53 1.6GHz
Chip đồ hoạ (GPU) :	G71 MP2
RAM :	3 GB
Cảm biến :	Đang cập nhật
Bộ nhớ & Lưu trữ
ROM :	32 MB
Thẻ nhớ ngoài :	MicroSD
Hỗ trợ thẻ nhớ tối đa :	512 GB
Chụp hình & Quay phim
Camera sau :	8.0 MP
Camera trước :	5.0 MP
Đèn Flash :	Có
Tính năng camera :	Đang cập nhật
Quay Phim :	Đang cập nhật
Kết nối & Cổng giao tiếp
Số khe sim :	2
Loại Sim :	Nano SIM
Thực hiện cuộc gọi :	Có
Wi-Fi :	Wi-Fi 802.11 b/g/n, WiFi Direct, hotspot
Bluetooth :	Bluetooth 5.0
GPS :	Đang cập nhật
Cổng kết nối/ sạc :	USB Type C
Jack (Input & Output) :	3.5mm
Kết nối khác :	Đang cập nhật
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
Công vụ văn phòng :	Đang cập nhật
Ứng dụng khác :	Đang cập nhật
Thiết kế & Trọng lượng
Chất liệu :	Đang cập nhật
Kích thước (DxRxC) :	122.2 mm x 201.4 mm x 8.9 mm
Trọng lượng :	Đang cập nhật
Pin & Dung lượng
Loại pin :	Li-Ion
Dung lượng pin :	4.200 mAh
Bảo hành
Thời gian bảo hành :	12 Tháng', CAST(N'2018-12-01 00:00:00.000' AS DateTime), N'19.png', 2, 6)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (20, N'Samsung Galaxy Tab S5E', CAST(9990000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	Đang cập nhật
Màu màn hình :	16 triệu màu
Độ phân giải :	1920 x 1200 pixels
Kích thước màn hình :	8.0 inchs
Cấu hình phần cứng
Loại CPU (Chipset) :	Exynos 7904
Hệ điều hành :	Đang cập nhật
Số nhân :	8
Tốc độ CPU :	2 X A73 1.8GHz, 6 X A53 1.6GHz
Chip đồ hoạ (GPU) :	G71 MP2
RAM :	3 GB
Cảm biến :	Đang cập nhật
Bộ nhớ & Lưu trữ
ROM :	32 MB
Thẻ nhớ ngoài :	MicroSD
Hỗ trợ thẻ nhớ tối đa :	512 GB
Chụp hình & Quay phim
Camera sau :	8.0 MP
Camera trước :	5.0 MP
Đèn Flash :	Có
Tính năng camera :	Đang cập nhật
Quay Phim :	Đang cập nhật
Kết nối & Cổng giao tiếp
Số khe sim :	2
Loại Sim :	Nano SIM
Thực hiện cuộc gọi :	Có
Wi-Fi :	Wi-Fi 802.11 b/g/n, WiFi Direct, hotspot
Bluetooth :	Bluetooth 5.0
GPS :	Đang cập nhật
Cổng kết nối/ sạc :	USB Type C
Jack (Input & Output) :	3.5mm
Kết nối khác :	Đang cập nhật
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
Công vụ văn phòng :	Đang cập nhật
Ứng dụng khác :	Đang cập nhật
Thiết kế & Trọng lượng
Chất liệu :	Đang cập nhật
Kích thước (DxRxC) :	122.2 mm x 201.4 mm x 8.9 mm
Trọng lượng :	Đang cập nhật
Pin & Dung lượng
Loại pin :	Li-Ion
Dung lượng pin :	4.200 mAh
Bảo hành
Thời gian bảo hành :	12 ThángMàn hình
Công nghệ màn hình :	Đang cập nhật
Màu màn hình :	16 triệu màu
Độ phân giải :	1920 x 1200 pixels
Kích thước màn hình :	8.0 inchs
Cấu hình phần cứng
Loại CPU (Chipset) :	Exynos 7904
Hệ điều hành :	Đang cập nhật
Số nhân :	8
Tốc độ CPU :	2 X A73 1.8GHz, 6 X A53 1.6GHz
Chip đồ hoạ (GPU) :	G71 MP2
RAM :	3 GB
Cảm biến :	Đang cập nhật
Bộ nhớ & Lưu trữ
ROM :	32 MB
Thẻ nhớ ngoài :	MicroSD
Hỗ trợ thẻ nhớ tối đa :	512 GB
Chụp hình & Quay phim
Camera sau :	8.0 MP
Camera trước :	5.0 MP
Đèn Flash :	Có
Tính năng camera :	Đang cập nhật
Quay Phim :	Đang cập nhật
Kết nối & Cổng giao tiếp
Số khe sim :	2
Loại Sim :	Nano SIM
Thực hiện cuộc gọi :	Có
Wi-Fi :	Wi-Fi 802.11 b/g/n, WiFi Direct, hotspot
Bluetooth :	Bluetooth 5.0
GPS :	Đang cập nhật
Cổng kết nối/ sạc :	USB Type C
Jack (Input & Output) :	3.5mm
Kết nối khác :	Đang cập nhật
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Có
Công vụ văn phòng :	Đang cập nhật
Ứng dụng khác :	Đang cập nhật
Thiết kế & Trọng lượng
Chất liệu :	Đang cập nhật
Kích thước (DxRxC) :	122.2 mm x 201.4 mm x 8.9 mm
Trọng lượng :	Đang cập nhật
Pin & Dung lượng
Loại pin :	Li-Ion
Dung lượng pin :	4.200 mAh
Bảo hành
Thời gian bảo hành :	12 Tháng', CAST(N'2019-01-02 00:00:00.000' AS DateTime), N'20.png', 2, 6)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (21, N'Asus TUF FX504GD-E4571T/i5-8300H', CAST(20990000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	Intel
Công nghệ CPU :	Core i5
Loại CPU :	8300H
Tốc độ CPU :	2.3 GHz
Bộ nhớ đệm :	8 MB Cache
Tốc độ tối đa :	4.0 GHz
Bo mạch
Chipset :	N/A
Tốc độ Bus :	2666 MHz
Hỗ trợ RAM tối đa :	32 GB
RAM
Dung lượng RAM :	8 GB
Loại RAM :	DDR4
Tốc độ BUS RAM :	2666 MHz
Số lượng khe RAM :	2
Đĩa cứng
Loại ổ đĩa :	HDD
Dung lượng ổ đĩa :	HDD: 1 TB SATA3, Hỗ trợ khe SSD M2 PCIe
Khe cắm ổ SSD :	Có
Đồ họa
Chipset đồ họa :	NVIDIA Geforce GTX 1050
Bộ nhớ đồ họa :	4 GB
Kiểu thiết kế đồ họa :	Card rời
Màn hình
Kích thước màn hình :	15.6 inchs
Độ phân giải (W x H) :	1920 x 1080 Pixels
Công nghệ màn hình :	FHD IPS Non-Glare LED Backlit
Cảm ứng :	Không
Âm thanh
Kênh âm thanh :	7.1
Thông tin thêm :	DTS
Đĩa quang
Có sẵn đĩa quang :	Không
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	1 giắc cắm âm thanh COMBO; 1 x USB 2.0; 1 x LAN; 1 x HDMI; 2 x USB 3.0
Tính năng mở rộng :	Multi touchpad
Giao tiếp mạng
LAN :	10/100/1000 Mbs
Chuẩn Wi-Fi :	802.11 ac 2*2
Kết nối không dây khác :	Bluetooh .4.1
Card Reader
Đọc thẻ nhớ :	4 in 1
Khe đọc thẻ nhớ :	MMC, SD,
Webcam
Độ phân giải :	Không
Thông tin thêm :	HD Webcam
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Windows 10 64Bit
Phần mềm có sẵn :	Không
PIN/Battery
Loại pin :	4-cell
Kiểu pin :	Lithium-Ion, Liền
Thông tin khác
Cảm biến vân tay :	Không
Đèn bàn phím :	Có
Bàn phím số :	Có
Phụ kiện kèm theo :	Sạc, sách hướng dẫn
Kích thước & trọng lượng
Kích Thước :	384 x 262 x 25 mm
Trọng lượng :	2.2 Kg
Chất liệu :	Nhựa giả nhôm
Bảo hành
Thời gian bảo hành :	24 tháng', CAST(N'2019-01-02 00:00:00.000' AS DateTime), N'21.png', 2, 5)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (22, N'Asus Vivobook X507UA-EJ736T/Core i3-7020U/4GB/256G SSD/WIN10', CAST(11999000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	Intel
Công nghệ CPU :	Core i5
Loại CPU :	8250U
Tốc độ CPU :	1.60 GHz
Bộ nhớ đệm :	6 MB Cache
Tốc độ tối đa :	3.40 GHz
Bo mạch
Chipset :	Intel
Tốc độ Bus :	2133 MHz
Hỗ trợ RAM tối đa :	4 GB
RAM
Dung lượng RAM :	4 GB
Loại RAM :	DDR4
Tốc độ BUS RAM :	2133 MHz
Số lượng khe RAM :	0
Đĩa cứng
Loại ổ đĩa :	SSD
Dung lượng ổ đĩa :	256 GB
Khe cắm ổ SSD :	Có
Đồ họa
Chipset đồ họa :	Intel® UHD Graphics 620
Bộ nhớ đồ họa :	Shared
Kiểu thiết kế đồ họa :	Tích hợp
Màn hình
Kích thước màn hình :	14.0 inchs
Độ phân giải (W x H) :	1920 x 1080 Pixels
Công nghệ màn hình :	IPS FHD
Cảm ứng :	Có
Âm thanh
Kênh âm thanh :	2.0
Thông tin thêm :	Sonic Master
Đĩa quang
Có sẵn đĩa quang :	Không
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	2 x Type A USB 3.1 Gen 1 ; 1 x USB 3.1 Gen 1 USB-C port (Data transfer only) ; 1 x HDMI ; 1 x COMBO audio jack ; 1 x USB-A to LAN ; 1 x ASUS Pen active stylus
Tính năng mở rộng :	1 x SSD SATA (M2 2280)
Giao tiếp mạng
LAN :	Không
Chuẩn Wi-Fi :	802.11 ac
Kết nối không dây khác :	Bluetooth
Card Reader
Đọc thẻ nhớ :	Micro SD card
Khe đọc thẻ nhớ :	Có
Webcam
Độ phân giải :	1.0 MP
Thông tin thêm :	HD Webcam
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Windows 10 Home SL 64
Phần mềm có sẵn :	None
PIN/Battery
Loại pin :	3 Cells
Kiểu pin :	Lithium-Polymer, Liền
Thông tin khác
Cảm biến vân tay :	Có
Đèn bàn phím :	Không
Bàn phím số :	Không
Phụ kiện kèm theo :	Sạc, Sách HDSD, Bút Stylus, USB to LAN
Kích thước & trọng lượng
Kích Thước :	327 x 226 x 13.9 cm (W x D x H)
Trọng lượng :	1.49 kg
Chất liệu :	Kim loại
Bảo hành
Thời gian bảo hành :	24 Tháng', CAST(N'2018-12-31 00:00:00.000' AS DateTime), N'22.png', 3, 5)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (23, N'Asus ZenBook FLIP UX461UA-E1147T/i5-8250U/4GB/256GB SSD/PEN/WIN10', CAST(20290000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	Intel
Công nghệ CPU :	Core i5
Loại CPU :	8250U
Tốc độ CPU :	1.60 GHz
Bộ nhớ đệm :	6 MB Cache
Tốc độ tối đa :	3.40 GHz
Bo mạch
Chipset :	Intel
Tốc độ Bus :	2133 MHz
Hỗ trợ RAM tối đa :	4 GB
RAM
Dung lượng RAM :	4 GB
Loại RAM :	DDR4
Tốc độ BUS RAM :	2133 MHz
Số lượng khe RAM :	0
Đĩa cứng
Loại ổ đĩa :	SSD
Dung lượng ổ đĩa :	256 GB
Khe cắm ổ SSD :	Có
Đồ họa
Chipset đồ họa :	Intel® UHD Graphics 620
Bộ nhớ đồ họa :	Shared
Kiểu thiết kế đồ họa :	Tích hợp
Màn hình
Kích thước màn hình :	14.0 inchs
Độ phân giải (W x H) :	1920 x 1080 Pixels
Công nghệ màn hình :	IPS FHD
Cảm ứng :	Có
Âm thanh
Kênh âm thanh :	2.0
Thông tin thêm :	Sonic Master
Đĩa quang
Có sẵn đĩa quang :	Không
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	2 x Type A USB 3.1 Gen 1 ; 1 x USB 3.1 Gen 1 USB-C port (Data transfer only) ; 1 x HDMI ; 1 x COMBO audio jack ; 1 x USB-A to LAN ; 1 x ASUS Pen active stylus
Tính năng mở rộng :	1 x SSD SATA (M2 2280)
Giao tiếp mạng
LAN :	Không
Chuẩn Wi-Fi :	802.11 ac
Kết nối không dây khác :	Bluetooth
Card Reader
Đọc thẻ nhớ :	Micro SD card
Khe đọc thẻ nhớ :	Có
Webcam
Độ phân giải :	1.0 MP
Thông tin thêm :	HD Webcam
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Windows 10 Home SL 64
Phần mềm có sẵn :	None
PIN/Battery
Loại pin :	3 Cells
Kiểu pin :	Lithium-Polymer, Liền
Thông tin khác
Cảm biến vân tay :	Có
Đèn bàn phím :	Không
Bàn phím số :	Không
Phụ kiện kèm theo :	Sạc, Sách HDSD, Bút Stylus, USB to LAN
Kích thước & trọng lượng
Kích Thước :	327 x 226 x 13.9 cm (W x D x H)
Trọng lượng :	1.49 kg
Chất liệu :	Kim loại
Bảo hành
Thời gian bảo hành :	24 Tháng', CAST(N'2018-12-31 00:00:00.000' AS DateTime), N'23.png', 3, 5)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (24, N'Asus Vivobook Flip TP412UA-EC173T/Core I3-7020U ', CAST(13890000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	Intel
Công nghệ CPU :	Core i3
Loại CPU :	7020U
Tốc độ CPU :	2.30 GHz
Bộ nhớ đệm :	3 MB SmartCache
Tốc độ tối đa :	Không
Bo mạch
Chipset :	Integrated Intel® CPU
Tốc độ Bus :	2400 MHz
RAM
Dung lượng RAM :	4 GB
Loại RAM :	DDR4
Tốc độ BUS RAM :	2400 MHz
Số lượng khe RAM :	1
Đĩa cứng
Loại ổ đĩa :	SSD
Dung lượng ổ đĩa :	SATA3 256G M.2 SSD
Khe cắm ổ SSD :	Không
Đồ họa
Chipset đồ họa :	Intel® HD graphics 620
Bộ nhớ đồ họa :	Shared
Kiểu thiết kế đồ họa :	Tích hợp
Màn hình
Kích thước màn hình :	14.0 inches
Độ phân giải (W x H) :	1920 x 1080 Pixels
Công nghệ màn hình :	FHD
Cảm ứng :	Có
Âm thanh
Kênh âm thanh :	2.0
Thông tin thêm :	Sonic Master"
Đĩa quang
Có sẵn đĩa quang :	Không
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	2 x USB 2.0; 1 x USB3.1 Type A (Gen1) ;1 x USB3.1 Type C (Gen 1); 1 x HDMI
Tính năng mở rộng :	FingerPrint
Giao tiếp mạng
LAN :	Không
Chuẩn Wi-Fi :	802.11ac
Kết nối không dây khác :	Bluetooth 4.2 (Dual band) 2*2
Card Reader
Đọc thẻ nhớ :	SD
Khe đọc thẻ nhớ :	Standard SD Sepc: SD、MMC
Webcam
Độ phân giải :	0.3 MP
Thông tin thêm :	VGA Web Camera (Fixed type)
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Windows 10 64bit
Phần mềm có sẵn :	Includes 1 month Trial for New Microsoft Office 365 Customers
PIN/Battery
Loại pin :	3 cell
Kiểu pin :	Rời
Thông tin khác
Cảm biến vân tay :	Có
Đèn bàn phím :	Không
Bàn phím số :	Không
Phụ kiện kèm theo :	Sạc, cáp, SHD
Kích thước & trọng lượng
Kích Thước :	327 x 225 x 17.5 ~ 17.6 mm
Trọng lượng :	1.5 Kg
Bảo hành
Thời gian bảo hành :	24 tháng', CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'24.png', 3, 5)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (25, N'Asus Vivobook A510UF-BR485T', CAST(11900000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	Intel
Công nghệ CPU :	Core i3
Loại CPU :	8130U
Tốc độ CPU :	2.20 GHz
Bộ nhớ đệm :	4 MB SmartCache
Tốc độ tối đa :	3.40 GHz
Bo mạch
Tốc độ Bus :	2400 MHz
Hỗ trợ RAM tối đa :	32 GB
RAM
Dung lượng RAM :	4 GB
Loại RAM :	DDR4
Tốc độ BUS RAM :	2400 MHz
Số lượng khe RAM :	2
Đĩa cứng
Loại ổ đĩa :	HDD
Dung lượng ổ đĩa :	1 TB 5400rpm
Khe cắm ổ SSD :	Có
Đồ họa
Chipset đồ họa :	NVIDIA GeForce MX130
Bộ nhớ đồ họa :	GDDR5 2GB
Kiểu thiết kế đồ họa :	Card rời
Màn hình
Kích thước màn hình :	15.6 inchs
Độ phân giải (W x H) :	1366 x 768 pixel
Công nghệ màn hình :	Ultra Slim 200nits Anti-Glare/NTSC:45%/Wide View
Cảm ứng :	Không
Âm thanh
Kênh âm thanh :	2.0
Thông tin thêm :	Sonic Master 1x Headphone-out & Audio-in Combo Jack
Đĩa quang
Có sẵn đĩa quang :	Không
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	2x USB 2.0 1x USB 3.0 1x USB3.1 Type C (Gen 1)
Tính năng mở rộng :	Multi touchpad
Giao tiếp mạng
LAN :	Không
Chuẩn Wi-Fi :	802.11 ac 2*2
Kết nối không dây khác :	Bluetooh .4.2
Card Reader
Đọc thẻ nhớ :	có
Khe đọc thẻ nhớ :	Sata
Webcam
Độ phân giải :	1.0 MP
Thông tin thêm :	HD
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Windows 10 64Bit
Phần mềm có sẵn :	Office 365 Activation
PIN/Battery
Loại pin :	3 cell
Kiểu pin :	Liền
Thông tin khác
Cảm biến vân tay :	Không
Đèn bàn phím :	Không
Bàn phím số :	Không
Phụ kiện kèm theo :	Sạc, sách hướng dẫn
Kích thước & trọng lượng
Kích Thước :	361 x 243 x 19.4 ~ 19.4 mm
Trọng lượng :	1.70 Kg
Chất liệu :	Nhựa giả nhôm
Bảo hành
Thời gian bảo hành :	24 tháng', CAST(N'2018-12-01 00:00:00.000' AS DateTime), N'25.png', 2, 5)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (26, N'HP 15-da0107TU/Celeron N4000', CAST(6690000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	Intel
Công nghệ CPU :	Celeron
Loại CPU :	N4000
Tốc độ CPU :	1.10 GHz
Bộ nhớ đệm :	4 MB cache
Tốc độ tối đa :	2.60 GHz
Bo mạch
Chipset :	HM175
Tốc độ Bus :	8 GT/s DMI3
Hỗ trợ RAM tối đa :	8 GB
RAM
Dung lượng RAM :	4 GB
Loại RAM :	DDR4
Tốc độ BUS RAM :	2400 MHz
Số lượng khe RAM :	1
Đĩa cứng
Loại ổ đĩa :	HDD
Dung lượng ổ đĩa :	500 GB 5400 rpm
Khe cắm ổ SSD :	Không
Đồ họa
Chipset đồ họa :	Intel® HD Graphics 600
Bộ nhớ đồ họa :	Shared
Kiểu thiết kế đồ họa :	Tích hợp
Màn hình
Kích thước màn hình :	15.6 inchs
Độ phân giải (W x H) :	1366 x 768 pixels
Công nghệ màn hình :	HD SVA BrightView WLED-backlit
Cảm ứng :	Không
Âm thanh
Kênh âm thanh :	Dual speakers
Thông tin thêm :	Combo Microphone & Headphone
Đĩa quang
Có sẵn đĩa quang :	Không
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	2 x USB 3.1, HDMI, USB 2.0
Tính năng mở rộng :	Touchpad with multi-touch
Giao tiếp mạng
LAN :	Integrated 10/100/1000 GbE LAN
Chuẩn Wi-Fi :	802.11b/g/n (1x1) Wi-Fi®
Kết nối không dây khác :	Bluetooth® 4.2 combo
Card Reader
Đọc thẻ nhớ :	SD, SDXC, SDHC
Khe đọc thẻ nhớ :	1 multi-format SD media card reader
Webcam
Độ phân giải :	HP TrueVision HD Camera
Thông tin thêm :	Integrated digital microphone
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Windows 10 Home SL
Phần mềm có sẵn :	McAfee LiveSafe™
PIN/Battery
Loại pin :	3-cell
Kiểu pin :	41 WH Li-ion
Thông tin khác
Cảm biến vân tay :	Không
Đèn bàn phím :	Không
Bàn phím số :	Có
Phụ kiện kèm theo :	45 W AC power adapter
Kích thước & trọng lượng
Kích Thước :	376 x 246 x 22.5 mm
Trọng lượng :	1.77 Kg
Chất liệu :	Vỏ nhựa
Bảo hành
Thời gian bảo hành :	12 tháng', CAST(N'2018-09-29 00:00:00.000' AS DateTime), N'26.png', 2, 4)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (27, N'HP 15-da0051TU/Core i3-7020U', CAST(9900000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	intel
Công nghệ CPU :	Core i3
Loại CPU :	7020U
Tốc độ CPU :	2.30 GHz
Bộ nhớ đệm :	3 MB Cache
Tốc độ tối đa :	2.30 GHz
Bo mạch
Chipset :	Intel
Tốc độ Bus :	2133 MHz
Hỗ trợ RAM tối đa :	8 GB
RAM
Dung lượng RAM :	4 GB
Loại RAM :	DDR4
Tốc độ BUS RAM :	2133 MHz
Số lượng khe RAM :	1
Đĩa cứng
Loại ổ đĩa :	HDD
Dung lượng ổ đĩa :	500 GB
Khe cắm ổ SSD :	Không
Đồ họa
Chipset đồ họa :	Intel® UHD Graphics
Bộ nhớ đồ họa :	Shared
Kiểu thiết kế đồ họa :	Tích hợp
Màn hình
Kích thước màn hình :	15.6 inches
Độ phân giải (W x H) :	1366 x 768 pixels
Công nghệ màn hình :	SVA BrightView WLED-backlit
Cảm ứng :	Không
Âm thanh
Kênh âm thanh :	Dual speakers
Thông tin thêm :	Dual speakers
Đĩa quang
Có sẵn đĩa quang :	DVD RW
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	2 USB 3.1 Gen 1 (Data transfer only); 1 USB 2.0; 1 HDMI 1.4b; 1 RJ-45; 1 headphone/microphone combo
Tính năng mở rộng :	Touchpad with multi-touch gesture support
Giao tiếp mạng
LAN :	Integrated 10/100/1000 GbE LAN
Chuẩn Wi-Fi :	802.11b/g/n (1x1) Wi-Fi® and Bluetooth® 4.2 combo
Kết nối không dây khác :	Bluetooth® 4.2 combo
Card Reader
Đọc thẻ nhớ :	1 multi-format SD media card reader
Khe đọc thẻ nhớ :	1 multi-format SD media card reader
Webcam
Độ phân giải :	HP TrueVision HD Camera with integrated digital microphone
Thông tin thêm :	HP TrueVision HD Camera with integrated digital microphone
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Windows 10 Home Single Language 64
Phần mềm có sẵn :	Không
PIN/Battery
Loại pin :	3-cell, 41 Wh Li-ion
Kiểu pin :	Liền
Thông tin khác
Cảm biến vân tay :	Không
Đèn bàn phím :	Không
Bàn phím số :	Có
Phụ kiện kèm theo :	Sạc, sách hướng dẫn,
Kích thước & trọng lượng
Kích Thước :	376 x 246 x 22.5 mm
Trọng lượng :	Starting at 1.77 Kg
Chất liệu :	Nhựa
Bảo hành
Thời gian bảo hành :	12 tháng', CAST(N'2018-09-21 00:00:00.000' AS DateTime), N'27.png', 2, 4)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (28, N'HP Pavilion Power 15-cx0179TX/i5-8300H', CAST(23900000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	IIntel®
Công nghệ CPU :	Core i5
Loại CPU :	8300H
Tốc độ CPU :	2.30 GHz
Bộ nhớ đệm :	8 MB cache
Tốc độ tối đa :	4.0 GHz
Bo mạch
Chipset :	HM370
Tốc độ Bus :	8 GT/s DMI3
Hỗ trợ RAM tối đa :	32 GB
RAM
Dung lượng RAM :	8 GB
Loại RAM :	DDR4
Tốc độ BUS RAM :	2666 MHz
Số lượng khe RAM :	2
Đĩa cứng
Loại ổ đĩa :	HDD
Dung lượng ổ đĩa :	1 TB 7200 rpm
Khe cắm ổ SSD :	Có
Đồ họa
Chipset đồ họa :	NVIDIA GEFORCE GTX 1050
Bộ nhớ đồ họa :	4 GB
Kiểu thiết kế đồ họa :	Card rời
Màn hình
Kích thước màn hình :	15.6 inchs
Độ phân giải (W x H) :	1920 x 1080 Pixels
Công nghệ màn hình :	UWVA
Cảm ứng :	Không
Âm thanh
Kênh âm thanh :	B&O PLAY, dual speakers, HP Audio Boost
Thông tin thêm :	Combo Microphone & Headphone
Đĩa quang
Có sẵn đĩa quang :	Không
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	2 x USB 3.1, HDMI, USB 2.0
Tính năng mở rộng :	Touchpad with multi-touch
Giao tiếp mạng
LAN :	Integrated 10/100/1000 GbE LAN
Chuẩn Wi-Fi :	Intel 9560 ac 2x2 MU
Kết nối không dây khác :	Bluetooth® 5.0 combo
Card Reader
Đọc thẻ nhớ :	SD, SDXC, SDHC
Khe đọc thẻ nhớ :	1 multi-format SD media card reader
Webcam
Độ phân giải :	HP TrueVision HD Camera
Thông tin thêm :	Integrated digital microphone
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Windows 10 Home SL
Phần mềm có sẵn :	McAfee LiveSafe™
PIN/Battery
Loại pin :	3-cell
Kiểu pin :	52.5 WH Long Life
Thông tin khác
Cảm biến vân tay :	Không
Đèn bàn phím :	Có
Bàn phím số :	Có
Phụ kiện kèm theo :	Adapter 135W AC
Kích thước & trọng lượng
Kích Thước :	365 x 256.5 x 25.4 mm
Trọng lượng :	2.17 Kg
Chất liệu :	Vỏ nhựa
Bảo hành
Thời gian bảo hành :	12 tháng', CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'28.png', 2, 4)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (29, N'HP Envy 13-ah1011TU/Core i5-8265U/8GB/256GB SSD/13.3FHD/WIN10', CAST(22490000 AS Decimal(18, 0)), N'Bộ xử lý
Hãng CPU :	Intel
Công nghệ CPU :	Core i5
Loại CPU :	8265U
Tốc độ CPU :	1,6 Ghz
Bộ nhớ đệm :	6 MB Cache
Tốc độ tối đa :	3.9 Ghz
Bo mạch
Chipset :	Intel
Tốc độ Bus :	2133 MHz
Hỗ trợ RAM tối đa :	8 GB
RAM
Dung lượng RAM :	8 GB
Loại RAM :	DDR3L
Tốc độ BUS RAM :	2133 MHz
Số lượng khe RAM :	1
Đĩa cứng
Loại ổ đĩa :	SSD
Dung lượng ổ đĩa :	256 GB
Khe cắm ổ SSD :	Không
Đồ họa
Chipset đồ họa :	intel
Bộ nhớ đồ họa :	Shared
Kiểu thiết kế đồ họa :	Tích hợp
Màn hình
Kích thước màn hình :	13.3 inchs
Độ phân giải (W x H) :	1920 x 1080 Pixels
Công nghệ màn hình :	LED Backlit
Cảm ứng :	Không
Âm thanh
Kênh âm thanh :	2.0
Thông tin thêm :	B&O
Đĩa quang
Có sẵn đĩa quang :	Không
Tính năng mở rộng & cổng giao tiếp
Cổng giao tiếp :	1 USB 3.1 Type-C™ Gen 1 (Data Transfer up to 5 Gb/s, Power Delivery, DisplayPort™ 1.2, HP Sleep and Charge); 2 USB 3.1 Gen 1 (1 HP Sleep and Charge); 1 headphone/microphone combo
Tính năng mở rộng :	HP Imagepad with multi-touch gesture support
Giao tiếp mạng
LAN :	Không
Chuẩn Wi-Fi :	802.11 ac
Kết nối không dây khác :	Bluetooth 5.0
Card Reader
Đọc thẻ nhớ :	1 multi-format SD media card reader
Khe đọc thẻ nhớ :	1 multi-format SD media card reader
Webcam
Độ phân giải :	1.0 MP
Thông tin thêm :	HD Webcam
Hệ điều hành, phầm mềm có sẵn
Hệ điều hành :	Windows 10 Home
Phần mềm có sẵn :	None
PIN/Battery
Loại pin :	4 Cells
Kiểu pin :	Lithium-Polymer, Liền
Thông tin khác
Cảm biến vân tay :	Có
Đèn bàn phím :	Có
Bàn phím số :	Không
Phụ kiện kèm theo :	Sạc, sách hướng dẫn
Kích thước & trọng lượng
Kích Thước :	30.7 x 21.2 x 1.49 cm
Trọng lượng :	1.21 kg
Chất liệu :	Kim loại
Bảo hành
Thời gian bảo hành :	12 Tháng', CAST(N'2019-01-02 00:00:00.000' AS DateTime), N'29.png', 2, 4)
INSERT [dbo].[SP] ([MaSP], [TenSP], [GiaBan], [MoTa], [NgayCapNhat], [HinhSP], [SLTon], [MATH]) VALUES (30, N'Nokia 3.1 Plus 32GB', CAST(3890000 AS Decimal(18, 0)), N'Màn hình
Công nghệ màn hình :	IPS LCD
Màu màn hình :	16 Triệu
Chuẩn màn hình :	HD+
Độ phân giải màn hình :	720 x 1440 Pixels
Màn hình :	6.0 inches
Mặt kính màn hình :	Mặt kính cong 2.5D
Camera Trước
Độ phân giải :	8.0 MP
Thông tin khác :	Nhận diện khuôn mặt, Chế độ làm đẹp, Tự động lấy nét, Selfie ngược sáng HDR
Camera Sau
Độ phân giải :	13.0 MP + 5.0 MP
Quay phim :	FullHD 1080p@30fps
Đèn Flash :	Có
Chụp ảnh nâng cao :	Chế độ Slow Motion, Time-Lapse, Chụp ảnh xóa phông, Lấy nét theo pha, Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Làm đẹp
Cấu hình phần cứng
Tốc độ CPU :	2 GHz
Số nhân :	8
Chipset :	MediaTek MT6762
RAM :	3 GB
Chip đồ họa (GPU) :	PowerVR GE8320
Cảm biến :	Có
Bộ nhớ & Lưu trữ
Danh bạ lưu trữ :	Không giới hạn
ROM :	32 GB
Bộ nhớ còn lại :	Đang cập nhật
Thẻ nhớ ngoài :	MicroSD
Hỗ trợ thẻ nhớ tối đa :	128 GB
Thiết kế & Trọng lượng
Kiểu dáng :	Nguyên Khối
Chất liệu :	Kim Loại
Kích thước :	156.68 x 76.44 x 8.19 mm
Trọng lượng :	180 g
Khả năng chống nước :	Không
Thông tin pin
Loại pin :	Li-Ion
Dung lượng pin :	3500 mAh
Pin có thể tháo rời :	Không
Chế độ sạc nhanh :	Không
Kết nối & Cổng giao tiếp
Loại SIM :	Nano SIM
Khe cắm sim :	2
Wifi :	Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot
GPS :	A-GPS, GLONASS
Bluetooth :	4.2, A2DP, LE
GPRS/EDGE :	Không
NFC :	Có
Cổng sạc :	Micro USB
Jack (Input & Output) :	3.5 mm
Giải trí & Ứng dụng
Xem phim :	True
Nghe nhạc :	True
Ghi âm :	Không
FM radio :	Có
Đèn pin :	Có
Chức năng khác :	Mở khóa bằng vân tay, Mở khóa bằng khuôn mặt
Bảo hành
Thời gian bảo hành :	18 Tháng
Hệ điều hành
Hệ điều hành :	Android 8', CAST(N'2019-01-02 00:00:00.000' AS DateTime), N'30.png', 5, 2)
SET IDENTITY_INSERT [dbo].[SP] OFF
SET IDENTITY_INSERT [dbo].[THUONGHIEU] ON 

INSERT [dbo].[THUONGHIEU] ([MATH], [TENTH]) VALUES (1, N'Dell')
INSERT [dbo].[THUONGHIEU] ([MATH], [TENTH]) VALUES (2, N'Nokia')
INSERT [dbo].[THUONGHIEU] ([MATH], [TENTH]) VALUES (3, N'Apple')
INSERT [dbo].[THUONGHIEU] ([MATH], [TENTH]) VALUES (4, N'HP')
INSERT [dbo].[THUONGHIEU] ([MATH], [TENTH]) VALUES (5, N'Asus')
INSERT [dbo].[THUONGHIEU] ([MATH], [TENTH]) VALUES (6, N'Samsung')
SET IDENTITY_INSERT [dbo].[THUONGHIEU] OFF
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_DONDATHANG] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DONDATHANG] ([MADH])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_DONDATHANG]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_SP] FOREIGN KEY([MaDH])
REFERENCES [dbo].[SP] ([MaSP])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_SP]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_KHACHHANG] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_KHACHHANG]
GO
ALTER TABLE [dbo].[THUONGHIEU]  WITH CHECK ADD  CONSTRAINT [FK_THUONGHIEU_SP] FOREIGN KEY([MATH])
REFERENCES [dbo].[SP] ([MaSP])
GO
ALTER TABLE [dbo].[THUONGHIEU] CHECK CONSTRAINT [FK_THUONGHIEU_SP]
GO
USE [master]
GO
ALTER DATABASE [Electronic] SET  READ_WRITE 
GO
