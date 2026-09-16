package org.bukkit;
public enum ChatColor {
    BLACK, DARK_BLUE, DARK_GREEN, DARK_AQUA, DARK_RED, DARK_PURPLE, GOLD, GRAY,
    DARK_GRAY, BLUE, GREEN, AQUA, RED, LIGHT_PURPLE, YELLOW, WHITE, RESET;
    public static String translateAlternateColorCodes(char replace, String text) { return text; }
    public String toString() { return ""; }
    public static ChatColor of(String code) { return RESET; }
    public static ChatColor match(char input) { return RESET; }
    public static ChatColor getByName(String name) { return RESET; }
}
