USE [QLNoithat]
GO
/****** Object:  Table [dbo].[Hoadon]    Script Date: 02-Jan-22 12:17:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoadon](
	[MaHoaDon] [nvarchar](50) NOT NULL,
	[MaKhachHang] [nvarchar](50) NULL,
	[MaHang] [nvarchar](50) NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[SoDienThoai] [int] NULL,
	[SoLuongMua] [int] NULL,
	[Gia] [int] NULL,
 CONSTRAINT [PK_Hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khachhang]    Script Date: 02-Jan-22 12:17:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khachhang](
	[MaKhachHang] [nvarchar](50) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[SoDienThoai] [int] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 02-Jan-22 12:17:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[MaHang] [nvarchar](50) NOT NULL,
	[LoaiHang] [nvarchar](50) NULL,
	[DonViTinh] [int] NULL,
	[TonKho] [int] NULL,
	[GiaTriTon] [int] NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Noithat]    Script Date: 02-Jan-22 12:17:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Noithat](
	[MaHang] [nvarchar](50) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
	[NgayNhap] [date] NULL,
	[Gia] [int] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[DanhGia] [nvarchar](50) NULL,
 CONSTRAINT [PK_Noithat] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hoadon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_Khachhang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Khachhang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[Hoadon] CHECK CONSTRAINT [FK_Hoadon_Khachhang]
GO
ALTER TABLE [dbo].[Hoadon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_Noithat] FOREIGN KEY([MaHang])
REFERENCES [dbo].[Noithat] ([MaHang])
GO
ALTER TABLE [dbo].[Hoadon] CHECK CONSTRAINT [FK_Hoadon_Noithat]
GO
ALTER TABLE [dbo].[Kho]  WITH CHECK ADD  CONSTRAINT [FK_Kho_Noithat] FOREIGN KEY([MaHang])
REFERENCES [dbo].[Noithat] ([MaHang])
GO
ALTER TABLE [dbo].[Kho] CHECK CONSTRAINT [FK_Kho_Noithat]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteNoithat]    Script Date: 02-Jan-22 12:17:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteNoithat]
@MaHang nvarchar(50)
as
Delete from NoiThat
where MaHang = @MaHang
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllNoithat]    Script Date: 02-Jan-22 12:17:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetAllNoithat]
as
select*from Noithat
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNoithat]    Script Date: 02-Jan-22 12:17:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_InsertNoithat]
@MaHang nvarchar(50),
@TenHang nvarchar(50),        
@NgayNhap date,
@Gia int,
@TrangThai nvarchar(50),
@DanhGia nvarchar(50)
as
insert into Noithat(MaHang,TenHang,NgayNhap,Gia,TrangThai,DanhGia)
values(@MaHang,@TenHang,@NgayNhap,@Gia,@TrangThai,@DanhGia)
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateNoithat]    Script Date: 02-Jan-22 12:17:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UpdateNoithat]
@MaHang nvarchar(50),
@TenHang nvarchar(50),        
@NgayNhap date,
@Gia int,
@TrangThai nvarchar(50),
@DanhGia nvarchar(50)
as
Update Noithat
set TenHang =@TenHang,
NgayNhap = @ngayNhap,
Gia = @Gia,
TrangThai = @TrangThai,
DanhGia = @DanhGia
where MaHang = @MaHang

GO
