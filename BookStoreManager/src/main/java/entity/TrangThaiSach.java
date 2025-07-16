package entity;

import lombok.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrangThaiSach {
    private int maTrangThai;  
    private String tenTrangThai;
}
