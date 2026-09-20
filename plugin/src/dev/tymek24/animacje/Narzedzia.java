package dev.tymek24.animacje;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ThreadLocalRandom;

/** Małe, bezpieczne narzędzia wspólne dla pluginu v2. */
public final class Narzedzia {

    private Narzedzia() {
    }

    public static String kody(String tekst) {
        if (tekst == null) return "";
        return tekst.replace('&', '\u00A7').replace('\n', ' ').replace('\r', ' ');
    }

    /**
     * Kolor spustowy rozpoznawany przez Animacje 3.0.
     *
     * Minecraft nie rozpoznaje skrótu §xRRGGBB. Poprawny legacy zapis hex to
     * §x§R§R§G§G§B§B; skrót powodował wyświetlanie kodu, np. 40E0FFwave,
     * zamiast ukrycia koloru przez renderer tekstu.
     */
    public static String spust(String hex) {
        String h = hex == null ? "FFFFFF" : hex.replace("#", "").trim();
        if (!h.matches("[0-9a-fA-F]{6}")) h = "FFFFFF";
        StringBuilder result = new StringBuilder("\u00A7x");
        for (char digit : h.toUpperCase(Locale.ROOT).toCharArray()) {
            result.append('\u00A7').append(digit);
        }
        return result.toString();
    }

    /** Znormalizowany zapis prezentowany graczowi i w katalogu efektów. */
    public static String hex(String hex) {
        String h = hex == null ? "FFFFFF" : hex.replace("#", "").trim();
        return h.matches("[0-9a-fA-F]{6}") ? "#" + h.toUpperCase(Locale.ROOT) : "#FFFFFF";
    }

    public static String ogranicz(String tekst, int maks) {
        String s = kody(tekst).replace('\u0000', ' ');
        if (s.length() <= maks) return s;
        return s.substring(0, Math.max(0, maks));
    }

    /** Wartość wstawiana jako stały fragment formatu czatu. */
    public static String ucieknijFormat(String tekst) {
        return tekst == null ? "" : tekst.replace("%", "%%");
    }

    public static String polacz(String[] args, int od) {
        StringBuilder b = new StringBuilder();
        for (int i = od; i < args.length; i++) {
            if (i > od) b.append(' ');
            b.append(args[i]);
        }
        return b.toString();
    }

    public static String[] podzielTytul(String tekst) {
        String[] czesci = tekst.split("\\|", 2);
        return new String[] {czesci.length > 0 ? czesci[0].trim() : "", czesci.length > 1 ? czesci[1].trim() : ""};
    }

    public static <T> T los(Collection<? extends T> kolekcja) {
        if (kolekcja == null || kolekcja.isEmpty()) return null;
        List<T> kopia = new ArrayList<>(kolekcja);
        return kopia.get(ThreadLocalRandom.current().nextInt(kopia.size()));
    }

    public static boolean tak(String value) {
        return value != null && (value.equalsIgnoreCase("on") || value.equalsIgnoreCase("wl")
                || value.equalsIgnoreCase("true") || value.equalsIgnoreCase("tak"));
    }
}
