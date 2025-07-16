package entity;

import lombok.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class KhachHang {
    private int maKH;         
    private String tenKH;     
    private String SDT;       
    private String gioiTinh;  
    private String diaChi; 
}
