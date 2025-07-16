package entity;

import lombok.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HoaDonCT {
    private int maHD;        
    private int maSach;       
    private int soLuong;    
    private Double donGia;    
    private Double thanhTien;
}
