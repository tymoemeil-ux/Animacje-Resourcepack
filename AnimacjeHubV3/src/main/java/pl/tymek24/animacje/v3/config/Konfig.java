package pl.tymek24.animacje.v3.config;

import pl.tymek24.animacje.v3.*;
import pl.tymek24.animacje.v3.config.*;
import pl.tymek24.animacje.v3.catalog.*;
import pl.tymek24.animacje.v3.services.*;
import pl.tymek24.animacje.v3.gui.*;
import pl.tymek24.animacje.v3.commands.*;
import pl.tymek24.animacje.v3.listeners.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.plugin.java.JavaPlugin;

/** Uprzywilejowany dostep do config.yml + domyslne wartosci. */
public final class Konfig {

    private final JavaPlugin plugin;
    private final FileConfiguration c;

    private Konfig(JavaPlugin plugin, FileConfiguration c) {
        this.plugin = plugin;
        this.c = c;
    }

    public static Konfig wczytaj(JavaPlugin plugin) {
        plugin.saveDefaultConfig();
        return new Konfig(plugin, plugin.getConfig());
    }

    public boolean ogloszeniaWlaczone() { return c.getBoolean("ogloszenia.wlaczone", true); }
    public int ogloszeniaOdstepS() { return Math.max(10, c.getInt("ogloszenia.odstep_s", 180)); }
    public List<String> ogloszeniaLista() { return kody(c.getStringList("ogloszenia.lista")); }
    public int nickOdstepS() { return Math.max(1, c.getInt("nick.odstep_s", 6)); }

    public void odswiez() {
        plugin.reloadConfig();
    }

    /** Kolor rangi (hex) — klucze "rangi.<grupa>"; domylny gdy brak. */
    public String hexRangi(String ranga) {
        String domylny = Narzedzia.kody(c.getString("rangi.domylny", "a0a0a0"));
        if (ranga != null) {
            String hex = c.getString("rangi." + ranga.toLowerCase(Locale.ROOT));
            if (hex != null) return Narzedzia.kody(hex);
        }
        return domylny;
    }

    private static List<String> kody(List<String> l) {
        List<String> w = new ArrayList<>();
        for (String s : l) w.add(Narzedzia.kody(s));
        return w;
    }
}
