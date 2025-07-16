package entity;

import lombok.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaiKhoan {
    private int maTK;          
    private String tenDangNhap;   
    private String matKhau;       
    private String trangThai;
}
