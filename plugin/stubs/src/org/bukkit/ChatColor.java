package org.bukkit;
public enum ChatColor {
    BLACK, DARK_RED, DARK_GREEN, DARK_AQUA, DARK_BLUE, DARK_PURPLE, GOLD, GRAY,
    DARK_GRAY, RED, GREEN, AQUA, BLUE, LIGHT_PURPLE, YELLOW, WHITE;
    public static final char COLOR_CHAR = '\u00A7';
    public static String translateAlternateColorCodes(char replace, String text) { return text; }
    public static ChatColor of(String code) { return WHITE; }
}
