package dao;

import entity.*;
import java.util.List;
public interface HoaDonDAO extends CrudDAO<HoaDon, Integer>{
    List<HoaDon> findByCustomer(int maKH);
    List<HoaDon> findByEmployee(int maNV);
    List<HoaDon> findByDate(java.util.Date from, java.util.Date to);
}
