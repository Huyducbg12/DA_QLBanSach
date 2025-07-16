package dao;
import entity.*;
import java.util.List;
public interface SachDAO extends CrudDAO<Sach, Integer>{
    List<Sach> findByCategory (int maLoai);
    List<Sach> findByAuthor(int maTacGia);
    List<Sach> findByStatus(int maTrangThai);   
}
