package pl.tymek24.animacje.v3.services;
import pl.tymek24.animacje.v3.*;
import pl.tymek24.animacje.v3.config.*;
import pl.tymek24.animacje.v3.catalog.*;
import pl.tymek24.animacje.v3.services.*;
import pl.tymek24.animacje.v3.gui.*;
import pl.tymek24.animacje.v3.commands.*;
import pl.tymek24.animacje.v3.listeners.*;

import org.bukkit.Bukkit;
import org.bukkit.entity.Player;

/** Silnik tekstowy: placeholdery i spusty FX. */
public final class Silnik {

    private Silnik() {}

    /** Zastepuje {gracz} {ranga} {fx} {hex} {czas} {serwer} {fxid} {wersja}. */
    public static String placeholdery(String s, Player p, Katalog.Fx fx) {
        if (s == null) return "";
        Katalog.Fx f = fx != null ? fx : Katalog.losowyAnimowany();
        String hex = f != null ? f.hex : "ffffff";
        s = s.replace("{gracz}", p != null ? p.getName() : "gracz");
        s = s.replace("{ranga}", p != null ? AnimacjeHubV3.instancja().rangi().ranga(p) : "?");
        s = s.replace("{fx}", f != null ? f.spust() : "");
        s = s.replace("{fxid}", f != null ? String.valueOf(f.id) : "0");
        s = s.replace("{hex}", hex);
        s = s.replace("{czas}", Narzedzia.czas());
        s = s.replace("{serwer}", Bukkit.getName());
        s = s.replace("{wersja}", Bukkit.getBukkitVersion());
        return s;
    }

    /** Spust + tekst + §r. */
    public static String spustFx(Katalog.Fx f, String tekst) {
        return (f != null ? f.spust() : "") + tekst + "§r";
    }

    public static void tytul(Player p, String tytul, String podtytul) {
        p.sendTitle(placeholdery(tytul, p, null), placeholdery(podtytul, p, null), 6, 45, 12);
    }
}
