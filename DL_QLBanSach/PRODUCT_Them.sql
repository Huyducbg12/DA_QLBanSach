-- ========================================
-- 1. Thêm loại sách mới
-- ========================================
CREATE PROCEDURE sp_ThemLoaiSach
    @tenLoai NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO LoaiSach(tenLoai)
    VALUES (@tenLoai);
END
GO

-- ========================================
-- 2. Thêm trạng thái sách mới (VD: Còn hàng, Hết hàng)
-- ========================================
CREATE PROCEDURE sp_ThemTrangThaiSach
    @tenTrangThai NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO TrangThaiSach(tenTrangThai)
    VALUES (@tenTrangThai);
END
GO

-- ========================================
-- 3. Thêm tác giả mới
-- ========================================
CREATE PROCEDURE sp_ThemTacGia
    @tenTacGia NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO TacGia(tenTacGia)
    VALUES (@tenTacGia);
END
GO

-- ========================================
-- 4. Thêm nhà xuất bản mới
-- ========================================
CREATE PROCEDURE sp_ThemNXB
    @tenNXB NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO NXB(tenNXB)
    VALUES (@tenNXB);
END
GO

-- ========================================
-- 5. Thêm sách mới (cần truyền đúng mã loại, mã tác giả, mã NXB, mã trạng thái)
-- ========================================
CREATE PROCEDURE sp_ThemSach
    @maLoai INT,
    @tenSach NVARCHAR(200),
    @soLuong INT,
    @maTacGia INT,
    @donGia DECIMAL(18,2),
    @maNXB INT,
    @namXB INT,
    @maTrangThai INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Sach (maLoai, tenSach, soLuong, maTacGia, donGia, maNXB, namXB, maTrangThai)
    VALUES (@maLoai, @tenSach, @soLuong, @maTacGia, @donGia, @maNXB, @namXB, @maTrangThai);
END
GO

-- ========================================
-- 6. Thêm chương trình giảm giá
-- ========================================
CREATE PROCEDURE sp_ThemGiamGia
    @tenChuongTrinh NVARCHAR(200),
    @ngayBatDau DATE,
    @ngayKetThuc DATE,
    @ghiChu NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO GiamGia(tenChuongTrinh, ngayBatDau, ngayKetThuc, ghiChu)
    VALUES (@tenChuongTrinh, @ngayBatDau, @ngayKetThuc, @ghiChu);
END
GO

-- ========================================
-- 7. Thêm chi tiết giảm giá cho sách
-- ========================================
CREATE PROCEDURE sp_ThemChiTietGiamGia
    @maGiamGia INT,
    @maSach INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO ChiTietGiamGia(maGiamGia, maSach)
    VALUES (@maGiamGia, @maSach);
END
GO

-- ========================================
-- 8. Thêm khách hàng mới
-- ========================================
CREATE PROCEDURE sp_ThemKhachHang
    @tenKH NVARCHAR(100),
    @SDT VARCHAR(15),
    @gioiTinh NVARCHAR(10),
    @diaChi NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO KhachHang(tenKH, SDT, gioiTinh, diaChi)
    VALUES (@tenKH, @SDT, @gioiTinh, @diaChi);
END
GO

-- ========================================
-- 9. Thêm tài khoản đăng nhập mới (có kiểm tra trùng tên đăng nhập)
-- ========================================
CREATE PROCEDURE sp_ThemTaiKhoan
    @tenDangNhap NVARCHAR(50),
    @matKhau NVARCHAR(100),
    @trangThai NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM TaiKhoan WHERE tenDangNhap = @tenDangNhap)
    BEGIN
        RAISERROR (N'Tên đăng nhập đã tồn tại!', 16, 1);
        RETURN;
    END

    INSERT INTO TaiKhoan(tenDangNhap, matKhau, trangThai)
    VALUES (@tenDangNhap, @matKhau, @trangThai);
END
GO

-- ========================================
-- 10. Thêm nhân viên mới
-- ========================================
CREATE PROCEDURE sp_ThemNhanVien
    @tenNV NVARCHAR(100),
    @gioiTinh NVARCHAR(10),
    @email VARCHAR(100),
    @SDT VARCHAR(15),
    @diaChi NVARCHAR(200),
    @maTK INT,
    @trangThai NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO NhanVien(tenNV, gioiTinh, email, SDT, diaChi, maTK, trangThai)
    VALUES (@tenNV, @gioiTinh, @email, @SDT, @diaChi, @maTK, @trangThai);
END
GO

-- ========================================
-- 11. Thêm hóa đơn mới
-- ========================================
CREATE PROCEDURE sp_ThemHoaDon
    @ngayBan DATETIME,
    @maNV INT,
    @maKH INT,
    @tongTien DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO HoaDon(ngayBan, maNV, maKH, tongTien)
    VALUES (@ngayBan, @maNV, @maKH, @tongTien);
END
GO

-- ========================================
-- 12. Thêm chi tiết hóa đơn
-- ========================================
CREATE PROCEDURE sp_ThemHoaDonCT
    @maHD INT,
    @maSach INT,
    @soLuong INT,
    @donGia DECIMAL(18,2),
    @thanhTien DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO HoaDonCT(maHD, maSach, soLuong, donGia, thanhTien)
    VALUES (@maHD, @maSach, @soLuong, @donGia, @thanhTien);
END
GO
