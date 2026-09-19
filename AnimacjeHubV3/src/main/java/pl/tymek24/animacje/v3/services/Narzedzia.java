package pl.tymek24.animacje.v3.services;

import pl.tymek24.animacje.v3.*;
import pl.tymek24.animacje.v3.config.*;
import pl.tymek24.animacje.v3.catalog.*;
import pl.tymek24.animacje.v3.services.*;
import pl.tymek24.animacje.v3.gui.*;
import pl.tymek24.animacje.v3.commands.*;
import pl.tymek24.animacje.v3.listeners.*;
import java.util.Collection;
import java.util.List;

/** Narzedzia pomocnicze: materialy z rejestrystyki (bez NCDFE), hex, losowanie. */
public final class Narzedzia {

    private Narzedzia() {}

    public static int[] rgb(String hex) {
        String h = hex.startsWith("#") ? hex.substring(1) : hex;
        return new int[] {
            Integer.parseInt(h.substring(0, 2), 16),
            Integer.parseInt(h.substring(2, 4), 16),
            Integer.parseInt(h.substring(4, 6), 16)
        };
    }

    /** Spust FX: §x + hex (format legacy-hex 1.16+, odczytywany przez pack). */
    public static String spust(String hex) {
        return "\u00A7x" + (hex.startsWith("#") ? hex.substring(1) : hex);
    }

    /** Zamiennik & na § (dla configu). */
    public static String kody(String s) {
        if (s == null) return "";
        return s.replace('&', '\u00A7');
    }

    public static <T> T los(Collection<T> lista) {
        if (lista == null || lista.isEmpty()) return null;
        java.util.List<T> kopi = new java.util.ArrayList<>(lista);
        return kopi.get(java.util.concurrent.ThreadLocalRandom.current().nextInt(kopi.size()));
    }

    public static String czas() {
        java.util.Calendar c = java.util.Calendar.getInstance();
        return String.format("%02d:%02d", c.get(java.util.Calendar.HOUR_OF_DAY), c.get(java.util.Calendar.MINUTE));
    }

    public static String hash01(java.util.UUID u) {
        return String.valueOf(Math.floorMod(u.hashCode(), 997));
    }
}
