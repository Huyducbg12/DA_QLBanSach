package dao;
import entity.*;
import java.util.List;

public interface HoaDonCTDAO {
    void create(HoaDonCT hdct);                   
    void update(HoaDonCT hdct);                   
    void delete(int maHD, int maSach);           
    List<HoaDonCT> findByHoaDon(int maHD);        
    List<HoaDonCT> findBySach(int maSach);        
    HoaDonCT findById(int maHD, int maSach);
}
    