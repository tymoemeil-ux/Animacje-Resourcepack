package dev.tymek24.animacje;

import java.util.Locale;
import java.util.Map;

/**
 * Kolory dla trybu custom. Resourcepack rezerwuje trigger, który niesie 4-bitową
 * wersję RGB oraz ID efektu; dzięki temu #RRGGBB może współpracować z każdym FX.
 */
public final class Kolory {
    private static final Map<String, String> NAMED = Map.ofEntries(
            Map.entry("0", "#000000"),
            Map.entry("1", "#0000AA"),
            Map.entry("2", "#00AA00"),
            Map.entry("3", "#00AAAA"),
            Map.entry("4", "#AA0000"),
            Map.entry("5", "#AA00AA"),
            Map.entry("6", "#FFAA00"),
            Map.entry("7", "#AAAAAA"),
            Map.entry("8", "#555555"),
            Map.entry("9", "#5555FF"),
            Map.entry("a", "#55FF55"),
            Map.entry("b", "#55FFFF"),
            Map.entry("c", "#FF5555"),
            Map.entry("d", "#FF55FF"),
            Map.entry("e", "#FFFF55"),
            Map.entry("f", "#FFFFFF"),
            // Dodatkowe aliasy wygodne w configu i komendzie.
            Map.entry("g", "#55FF55"),
            Map.entry("green", "#55FF55"),
            Map.entry("lime", "#AAFF55"),
            Map.entry("cyan", "#55FFFF"),
            Map.entry("pink", "#FF55FF"),
            Map.entry("orange", "#FFAA00"),
            Map.entry("white", "#FFFFFF"),
            Map.entry("red", "#FF5555"),
            Map.entry("blue", "#5555FF"));

    private Kolory() {
    }

    /** Zwraca #RRGGBB. Obsługuje &c, &g, nazwy, #RGB, #RGBA i #RRGGBB. */
    public static String normalizuj(String raw) {
        if (raw == null) return null;
        String value = raw.trim().toLowerCase(Locale.ROOT);
        if (value.startsWith("&") && value.length() == 2) value = value.substring(1);
        if (value.startsWith("#")) {
            String hex = value.substring(1);
            if (hex.matches("[0-9a-f]{3}")) {
                return ("#" + hex.charAt(0) + hex.charAt(0)
                        + hex.charAt(1) + hex.charAt(1)
                        + hex.charAt(2) + hex.charAt(2)).toUpperCase(Locale.ROOT);
            }
            // #RGBA: alpha nie może sterować tekstem Minecrafta, więc ignorujemy A.
            if (hex.matches("[0-9a-f]{4}")) hex = hex.substring(0, 3);
            if (hex.matches("[0-9a-f]{8}")) hex = hex.substring(0, 6);
            if (hex.matches("[0-9a-f]{6}")) return ("#" + hex).toUpperCase(Locale.ROOT);
            return null;
        }
        String named = NAMED.get(value);
        return named == null ? null : named;
    }

    /** Kod legacy §x§R§R§G§G§B§B dla zwykłego koloru Minecrafta. */
    public static String legacy(String hex) {
        String normalized = normalizuj(hex);
        if (normalized == null) return "";
        String digits = normalized.substring(1);
        StringBuilder result = new StringBuilder("\u00A7x");
        for (char digit : digits.toCharArray()) result.append('\u00A7').append(digit);
        return result.toString();
    }

    /**
     * Trigger custom: 4 bity każdego kanału + 7-bitowe ID efektu. Kolor jest
     * przybliżany do 16 poziomów na kanał, a shader przywraca go i wykonuje FX.
     */
    public static String trigger(Katalog.Fx fx, String color) {
        String normalized = normalizuj(color);
        if (fx == null || normalized == null) return fx == null ? "" : fx.spust();
        int red = Integer.parseInt(normalized.substring(1, 3), 16) * 15 / 255;
        int green = Integer.parseInt(normalized.substring(3, 5), 16) * 15 / 255;
        int blue = Integer.parseInt(normalized.substring(5, 7), 16) * 15 / 255;
        int encodedRed = (red << 4) | 0xA;
        int encodedGreen = (green << 4) | 0x8 | ((fx.id >> 4) & 0x7);
        int encodedBlue = (blue << 4) | 0x8 | (fx.id & 0x7);
        return legacy(String.format(Locale.ROOT, "#%02X%02X%02X", encodedRed, encodedGreen, encodedBlue));
    }
}
