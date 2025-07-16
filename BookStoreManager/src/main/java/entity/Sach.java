package entity;
import lombok.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sach {
    private int maSach;          
    private int maLoai;          
    private String tenSach;       
    private int soLuong;          
    private int maTacGia;        
    private Double donGia;        
    private int maNXB;           
    private int namXB;           
    private int maTrangThai;    
}
