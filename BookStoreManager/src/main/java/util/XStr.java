package util;

public class XStr {
     public static boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }

    public static String formatName(String name) {
        if (isBlank(name)) return "";
        String[] words = name.trim().toLowerCase().split("\\s+");
        StringBuilder sb = new StringBuilder();
        for (String w : words) {
            if (!w.isEmpty()) {
                sb.append(Character.toUpperCase(w.charAt(0))).append(w.substring(1)).append(" ");
            }
        }
        return sb.toString().trim();
    }

    public static boolean isInteger(String s) {
        if (isBlank(s)) return false;
        try {
            Integer.parseInt(s.trim());
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public static boolean isEmail(String s) {
        if (isBlank(s)) return false;
        return s.matches("^[\\w\\.-]+@[\\w\\.-]+\\.[a-zA-Z]{2,}$");
    }
}
