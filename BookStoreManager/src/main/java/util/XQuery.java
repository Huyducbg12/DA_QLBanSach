package util;

import java.beans.PropertyDescriptor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class XQuery {
    public static <T> List<T> getBeanList(Class<T> type, String sql, Object... args) {
        List<T> list = new ArrayList<>();
        try (
            Connection conn = XJdbc.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            for (int i = 0; i < args.length; i++) ps.setObject(i + 1, args[i]);
            ResultSet rs = ps.executeQuery();
            ResultSetMetaData meta = rs.getMetaData();
            int colCount = meta.getColumnCount();

            while (rs.next()) {
                T bean = type.getDeclaredConstructor().newInstance();
                for (int i = 1; i <= colCount; i++) {
                    String col = meta.getColumnLabel(i);
                    Object val = rs.getObject(i);
                    try {
                        PropertyDescriptor pd = new PropertyDescriptor(col, type);
                        var setter = pd.getWriteMethod();
                        if (setter != null) setter.invoke(bean, val);
                    } catch (Exception ignore) {}
                }
                list.add(bean);
            }
        } catch (Exception ex) {
            throw new RuntimeException("Lỗi getBeanList: " + sql, ex);
        }
        return list;
    }

    public static <T> T getSingleBean(Class<T> type, String sql, Object... args) {
        List<T> list = getBeanList(type, sql, args);
        return list.isEmpty() ? null : list.get(0);
    }

    public static List<Map<String, Object>> getListMap(String sql, Object... args) {
        List<Map<String, Object>> list = new ArrayList<>();
        try (
            Connection conn = XJdbc.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            for (int i = 0; i < args.length; i++) ps.setObject(i + 1, args[i]);
            ResultSet rs = ps.executeQuery();
            ResultSetMetaData meta = rs.getMetaData();
            int colCount = meta.getColumnCount();

            while (rs.next()) {
                Map<String, Object> row = new LinkedHashMap<>();
                for (int i = 1; i <= colCount; i++) {
                    String col = meta.getColumnLabel(i);
                    row.put(col, rs.getObject(i));
                }
                list.add(row);
            }
        } catch (Exception ex) {
            throw new RuntimeException("Lỗi getListMap: " + sql, ex);
        }
        return list;
    }
}
