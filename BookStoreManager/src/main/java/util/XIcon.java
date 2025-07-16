package util;

import javax.swing.ImageIcon;

public class XIcon {
     public static ImageIcon getIcon(String path) {
        try {
            return new ImageIcon(XIcon.class.getResource(path));
        } catch (Exception ex) {
            System.err.println("Không tìm thấy icon: " + path);
            return null;
        }
    }
}
