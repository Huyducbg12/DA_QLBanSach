package entity;

import lombok.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TacGia {
    private int maTacGia;     
    private String tenTacGia;
}
