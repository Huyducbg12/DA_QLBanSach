CREATE DATABASE QLBanSach
GO
USE QLBanSach
GO
-- ===========================
-- 1. BẢNG LOAISACH (Loại sách)
-- ===========================
CREATE TABLE LoaiSach (
    maLoai INT IDENTITY(1,1) PRIMARY KEY,
    tenLoai NVARCHAR(100) NOT NULL
);

-- ==============================
-- 2. BẢNG TRANGTHAISACH (Trạng thái sách)
-- ==============================
CREATE TABLE TrangThaiSach (
    maTrangThai INT IDENTITY(1,1) PRIMARY KEY,
    tenTrangThai NVARCHAR(50) NOT NULL -- VD: 'Còn hàng', 'Hết hàng'
);

-- ===========================
-- 3. BẢNG TACGIA (Tác giả)
-- ===========================
CREATE TABLE TacGia (
    maTacGia INT IDENTITY(1,1) PRIMARY KEY,
    tenTacGia NVARCHAR(100) NOT NULL
);

-- ===========================
-- 4. BẢNG NXB (Nhà xuất bản)
-- ===========================
CREATE TABLE NXB (
    maNXB INT IDENTITY(1,1) PRIMARY KEY,
    tenNXB NVARCHAR(100) NOT NULL
);

-- ===========================
-- 5. BẢNG SACH (Sách)
-- ===========================
CREATE TABLE Sach (
    maSach INT IDENTITY(1,1) PRIMARY KEY,
    maLoai INT NOT NULL,
    tenSach NVARCHAR(200) NOT NULL,
    soLuong INT NOT NULL DEFAULT 0,
    maTacGia INT NOT NULL,
    donGia DECIMAL(18,2) NOT NULL,
    maNXB INT NOT NULL,
    namXB INT NOT NULL,
    maTrangThai INT NOT NULL, -- 1: còn, 2: hết (tham chiếu bảng TrangThaiSach)
    CONSTRAINT FK_Sach_LoaiSach FOREIGN KEY (maLoai) REFERENCES LoaiSach(maLoai),
    CONSTRAINT FK_Sach_TacGia FOREIGN KEY (maTacGia) REFERENCES TacGia(maTacGia),
    CONSTRAINT FK_Sach_NXB FOREIGN KEY (maNXB) REFERENCES NXB(maNXB),
    CONSTRAINT FK_Sach_TrangThaiSach FOREIGN KEY (maTrangThai) REFERENCES TrangThaiSach(maTrangThai)
);

-- ===========================
-- 6. BẢNG GIAMGIA (Chương trình giảm giá)
-- ===========================
CREATE TABLE GiamGia (
    maGiamGia INT IDENTITY(1,1) PRIMARY KEY,
    tenChuongTrinh NVARCHAR(200) NOT NULL,
    ngayBatDau DATE NOT NULL,
    ngayKetThuc DATE NOT NULL,
    ghiChu NVARCHAR(255)
);

-- ==================================
-- 7. BẢNG CHITIETGIAMGIA (Chi tiết giảm giá)
-- ==================================
CREATE TABLE ChiTietGiamGia (
    maGiamGia INT NOT NULL,
    maSach INT NOT NULL,
    PRIMARY KEY (maGiamGia, maSach),
    CONSTRAINT FK_CTGG_GiamGia FOREIGN KEY (maGiamGia) REFERENCES GiamGia(maGiamGia),
    CONSTRAINT FK_CTGG_Sach FOREIGN KEY (maSach) REFERENCES Sach(maSach)
);

-- ===========================
-- 8. BẢNG KHACHHANG (Khách hàng)
-- ===========================
CREATE TABLE KhachHang (
    maKH INT IDENTITY(1,1) PRIMARY KEY,
    tenKH NVARCHAR(100) NOT NULL,
    SDT VARCHAR(15) NOT NULL,
    gioiTinh NVARCHAR(10),
    diaChi NVARCHAR(200)
);

-- ===========================
-- 9. BẢNG TAIKHOAN (Tài khoản đăng nhập)
-- ===========================
CREATE TABLE TaiKhoan (
    maTK INT IDENTITY(1,1) PRIMARY KEY,
    tenDangNhap NVARCHAR(50) NOT NULL UNIQUE,
    matKhau NVARCHAR(100) NOT NULL,
    trangThai NVARCHAR(20) NOT NULL -- 'Hoạt động', 'Khóa'
);

-- ===========================
-- 10. BẢNG NHANVIEN (Nhân viên)
-- ===========================
CREATE TABLE NhanVien (
    maNV INT IDENTITY(1,1) PRIMARY KEY,
    tenNV NVARCHAR(100) NOT NULL,
    gioiTinh NVARCHAR(10),
    email VARCHAR(100),
    SDT VARCHAR(15),
    diaChi NVARCHAR(200),
    maTK INT NOT NULL,
    trangThai NVARCHAR(20) NOT NULL, -- 'Đang làm', 'Đã nghỉ'
    CONSTRAINT FK_NhanVien_TaiKhoan FOREIGN KEY (maTK) REFERENCES TaiKhoan(maTK)
);

-- ===========================
-- 11. BẢNG HOADON (Hóa đơn)
-- ===========================
CREATE TABLE HoaDon (
    maHD INT IDENTITY(1,1) PRIMARY KEY,
    ngayBan DATETIME NOT NULL DEFAULT GETDATE(),
    maNV INT NOT NULL,
    maKH INT NOT NULL,
    tongTien DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY (maNV) REFERENCES NhanVien(maNV),
    CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY (maKH) REFERENCES KhachHang(maKH)
);

-- ===========================
-- 12. BẢNG HOADONCT (Chi tiết hóa đơn)
-- ===========================
CREATE TABLE HoaDonCT (
    maHD INT NOT NULL,
    maSach INT NOT NULL,
    soLuong INT NOT NULL,
    donGia DECIMAL(18,2) NOT NULL,
    thanhTien DECIMAL(18,2) NOT NULL,
    PRIMARY KEY (maHD, maSach),
    CONSTRAINT FK_HoaDonCT_HoaDon FOREIGN KEY (maHD) REFERENCES HoaDon(maHD),
    CONSTRAINT FK_HoaDonCT_Sach FOREIGN KEY (maSach) REFERENCES Sach(maSach)
);


