package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class XJdbc {
    public static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public static String dburl = "jdbc:sqlserver://WebStore.mssql.somee.com;database=QLBanSach;encrypt=true;trustServerCertificate=true;";
    public static String username = "sa";
    public static String password = "123";

    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            throw new RuntimeException("Không tìm thấy JDBC Driver!", ex);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(dburl, username, password);
    }

    public static void close(ResultSet rs, Statement stmt, Connection conn) {
        try { if (rs != null) rs.close(); } catch (Exception ex) { ex.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (Exception ex) { ex.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (Exception ex) { ex.printStackTrace(); }
    }

    public static int update(String sql, Object... args) {
        try (
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            for (int i = 0; i < args.length; i++) {
                stmt.setObject(i + 1, args[i]);
            }
            return stmt.executeUpdate();
        } catch (SQLException ex) {
            throw new RuntimeException("Lỗi update: " + sql, ex);
        }
    }

    public static ResultSet query(String sql, Object... args) {
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                stmt.setObject(i + 1, args[i]);
            }
            return stmt.executeQuery();
        } catch (SQLException ex) {
            throw new RuntimeException("Lỗi query: " + sql, ex);
        }
    }

    public static Object value(String sql, Object... args) {
        try (
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            for (int i = 0; i < args.length; i++) {
                stmt.setObject(i + 1, args[i]);
            }
            ResultSet rs = stmt.executeQuery();
            Object value = null;
            if (rs.next()) value = rs.getObject(1);
            rs.close();
            return value;
        } catch (SQLException ex) {
            throw new RuntimeException("Lỗi lấy giá trị đơn: " + sql, ex);
        }
    }
}
