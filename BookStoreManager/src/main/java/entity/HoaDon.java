package entity;

import java.util.Date;
import lombok.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HoaDon {
    private int maHD;         
    private Date ngayBan;     
    private int maNV;         
    private int maKH;        
    private Double tongTien; 
}
