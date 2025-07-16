-- =======================
-- 1. CẬP NHẬT THÔNG TIN SÁCH
-- =======================
CREATE PROCEDURE sp_CapNhatSach
    @maSach INT,
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
    UPDATE Sach
    SET maLoai = @maLoai,
        tenSach = @tenSach,
        soLuong = @soLuong,
        maTacGia = @maTacGia,
        donGia = @donGia,
        maNXB = @maNXB,
        namXB = @namXB,
        maTrangThai = @maTrangThai
    WHERE maSach = @maSach;
END
GO

-- =======================
-- 2. TỰ ĐỘNG CẬP NHẬT TRẠNG THÁI SÁCH (KHI SỐ LƯỢNG = 0 => HẾT HÀNG, >0 => CÒN HÀNG)
-- =======================
CREATE PROCEDURE sp_CapNhatSoLuongSach
    @maSach INT,
    @soLuongMoi INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Sach
    SET soLuong = @soLuongMoi,
        maTrangThai = 
            CASE 
                WHEN @soLuongMoi > 0 THEN 1  -- 1 = còn hàng
                ELSE 2                      -- 2 = hết hàng
            END
    WHERE maSach = @maSach;
END
GO

-- =======================
-- 3. CẬP NHẬT THÔNG TIN NHÂN VIÊN
-- =======================
CREATE PROCEDURE sp_CapNhatNhanVien
    @maNV INT,
    @tenNV NVARCHAR(100),
    @gioiTinh NVARCHAR(10),
    @email VARCHAR(100),
    @SDT VARCHAR(15),
    @diaChi NVARCHAR(200),
    @trangThai NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE NhanVien
    SET tenNV = @tenNV,
        gioiTinh = @gioiTinh,
        email = @email,
        SDT = @SDT,
        diaChi = @diaChi,
        trangThai = @trangThai
    WHERE maNV = @maNV;
END
GO

-- =======================
-- 4. KHÓA/MỞ LẠI TÀI KHOẢN ĐĂNG NHẬP
-- =======================
CREATE PROCEDURE sp_CapNhatTrangThaiTaiKhoan
    @maTK INT,
    @trangThai NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE TaiKhoan
    SET trangThai = @trangThai -- 'Khóa' hoặc 'Hoạt động'
    WHERE maTK = @maTK;
END
GO

-- =======================
-- 5. KHI NHÂN VIÊN NGHỈ VIỆC, TỰ ĐỘNG KHÓA TÀI KHOẢN
-- =======================
CREATE PROCEDURE sp_NhanVienNghiViec_KhoaTaiKhoan
    @maNV INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @maTK INT;
    SELECT @maTK = maTK FROM NhanVien WHERE maNV = @maNV;

    -- Update trạng thái nhân viên và tài khoản
    UPDATE NhanVien SET trangThai = N'Đã nghỉ' WHERE maNV = @maNV;
    IF @maTK IS NOT NULL
    BEGIN
        UPDATE TaiKhoan SET trangThai = N'Khóa' WHERE maTK = @maTK;
    END
END
GO

-- =======================
-- 6. CẬP NHẬT CHI TIẾT HÓA ĐƠN
-- =======================
CREATE PROCEDURE sp_CapNhatHoaDonCT
    @maHD INT,
    @maSach INT,
    @soLuong INT,
    @donGia DECIMAL(18,2),
    @thanhTien DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE HoaDonCT
    SET soLuong = @soLuong,
        donGia = @donGia,
        thanhTien = @thanhTien
    WHERE maHD = @maHD AND maSach = @maSach;
END
GO

-- =======================
-- 7. CẬP NHẬT HÓA ĐƠN (CẬP NHẬT TỔNG TIỀN, KHÁCH HÀNG, NHÂN VIÊN)
-- =======================
CREATE PROCEDURE sp_CapNhatHoaDon
    @maHD INT,
    @ngayBan DATETIME,
    @maNV INT,
    @maKH INT,
    @tongTien DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE HoaDon
    SET ngayBan = @ngayBan,
        maNV = @maNV,
        maKH = @maKH,
        tongTien = @tongTien
    WHERE maHD = @maHD;
END
GO

-- =======================
-- 8. CẬP NHẬT THÔNG TIN KHÁCH HÀNG
-- =======================
CREATE PROCEDURE sp_CapNhatKhachHang
    @maKH INT,
    @tenKH NVARCHAR(100),
    @SDT VARCHAR(15),
    @gioiTinh NVARCHAR(10),
    @diaChi NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE KhachHang
    SET tenKH = @tenKH,
        SDT = @SDT,
        gioiTinh = @gioiTinh,
        diaChi = @diaChi
    WHERE maKH = @maKH;
END
GO
