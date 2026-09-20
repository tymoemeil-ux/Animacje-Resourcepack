package dev.tymek24.animacje;

import java.util.Locale;

/** Renderowanie tekstu: jeden punkt, w którym plugin dodaje trigger packa. */
public final class Tekst {

    private Tekst() {
    }

    public static String czysty(String tekst) {
        return Narzedzia.ogranicz(tekst == null ? "" : tekst, 128);
    }

    public static String animowany(Katalog.Fx fx, String tekst) {
        if (fx == null) return czysty(tekst) + "\u00A7r";
        return fx.spust() + czysty(tekst) + "\u00A7r";
    }

    public static String animowany(Katalog.Fx fx, String tekst, int maks) {
        if (fx == null) return Narzedzia.ogranicz(tekst, maks) + "\u00A7r";
        return fx.spust() + Narzedzia.ogranicz(tekst, maks) + "\u00A7r";
    }

    public static String status(boolean wlaczony) {
        return wlaczony ? "\u00A7aWŁĄCZONY" : "\u00A7cWYŁĄCZONY";
    }

    public static String klucz(String tekst) {
        return tekst == null ? "" : tekst.toLowerCase(Locale.ROOT).trim();
    }
}
