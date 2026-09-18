package dev.tymek24.animacje;

import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import org.bukkit.plugin.java.JavaPlugin;

/** Ogloszenia: okresowe glosy z placeholdrami + glos ad-hoc. */
public final class Ogloszenia {

    private final JavaPlugin plugin;
    private final Konfig konfig;
    private int indeks = 0;

    public Ogloszenia(JavaPlugin plugin, Konfig konfig) {
        this.plugin = plugin;
        this.konfig = konfig;
    }

    public void start() {
        if (!konfig.ogloszeniaWlaczone()) return;
        long ticki = konfig.ogloszeniaOdstepS() * 20L;
        Bukkit.getScheduler().runTaskTimer(plugin, this::cykl, ticki, ticki);
    }

    private void cykl() {
        java.util.List<String> lista = konfig.ogloszeniaLista();
        if (lista.isEmpty()) return;
        Player p = Narzedzia.los(Bukkit.getOnlinePlayers());
        Katalog.Fx fx = Katalog.losowyAnimowany();
        String msg = Silnik.placeholdery(lista.get(indeks % lista.size()), p, fx);
        indeks++;
        Bukkit.broadcastMessage(msg);
    }

    /** Glos ad-hoc: /anim glos <msg> — placeholdery wg nadawcy. */
    public void glos(String msg, Player nadawca) {
        Bukkit.broadcastMessage(Silnik.placeholdery(msg, nadawca, null));
    }
}
