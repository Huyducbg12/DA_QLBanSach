package util;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class XDialog {
    public static void alert(JFrame parent, String message) {
        JOptionPane.showMessageDialog(parent, message, "Thông báo", JOptionPane.INFORMATION_MESSAGE);
    }

    public static boolean confirm(JFrame parent, String message) {
        int res = JOptionPane.showConfirmDialog(parent, message, "Xác nhận", JOptionPane.YES_NO_OPTION);
        return res == JOptionPane.YES_OPTION;
    }
}
