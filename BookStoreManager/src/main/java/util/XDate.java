package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class XDate {
    public static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
    public static final SimpleDateFormat DATETIME_FORMAT = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

    public static Date parse(String dateStr) {
        try {
            return (Date) DATE_FORMAT.parse(dateStr);
        } catch (Exception ex) {
            throw new RuntimeException("Sai định dạng ngày: " + dateStr, ex);
        }
    }

    public static String format(Date date) {
        return DATE_FORMAT.format(date);
    }

    public static String format(Date date, String pattern) {
        return new SimpleDateFormat(pattern).format(date);
    }

    public static Date now() {
        return new Date();
    }
}
