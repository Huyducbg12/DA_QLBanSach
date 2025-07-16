package entity;

import lombok.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class NhanVien {
    private int maNV;            
    private String tenNV;       
    private String gioiTinh;    
    private String email;         
    private String SDT;         
    private String diaChi;       
    private int maTK;           
    private String trangThai;  
}
