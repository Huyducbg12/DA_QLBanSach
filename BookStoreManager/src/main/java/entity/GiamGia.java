package entity;

import java.util.Date;
import lombok.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor

public class GiamGia {
    private int maGiamGia;           
    private String tenChuongTrinh;  
    private Date ngayBatDau;          
    private Date ngayKetThuc;         
    private String ghiChu;     
}
