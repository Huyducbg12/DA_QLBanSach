package entity;

import lombok.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoaiSach {
    private int maLoai; 
    private String tenLoai;
}
