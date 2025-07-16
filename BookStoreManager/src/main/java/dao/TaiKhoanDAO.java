package dao;

import entity.*;
public interface TaiKhoanDAO extends CrudDAO<TaiKhoan, Integer>{
    TaiKhoan findByUsername(String tenDangNhap);
}
