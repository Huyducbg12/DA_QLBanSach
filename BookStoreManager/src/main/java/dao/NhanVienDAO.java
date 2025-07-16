package dao;

import dao.CrudDAO;
import entity.*;
import entity.NhanVien;
import java.util.List;
public interface NhanVienDAO extends CrudDAO<NhanVien, Integer>{
    List<NhanVien> findByStatus(String trangThai);
    NhanVien findByUsername (String tenDangNhap);
}
