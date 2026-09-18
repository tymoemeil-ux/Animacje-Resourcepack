package dev.tymek24.animacje;

import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import net.luckperms.api.CachedData;
import net.luckperms.api.LuckPerms;
import net.luckperms.api.LuckPermsProvider;
import net.luckperms.api.player.PlayerAdapter;

/** Mostek do LuckPerms (soft-depend) + kolor rangi z konfigu. */
public final class Rangi {

    private final Konfig konfig;

    public Rangi(Konfig konfig) { this.konfig = konfig; }

    public boolean luckPerms() {
        try {
            return Bukkit.getPluginManager().getPlugin("LuckPerms") != null;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Grupa primaria z LuckPerms; fallback: op / player. */
    public String ranga(Player p) {
        if (luckPerms()) {
            try {
                LuckPerms lp = LuckPermsProvider.get();
                PlayerAdapter<Player> adapter = lp.getPlayerAdapter(Player.class);
                CachedData cd = adapter.getCachedData(p);
                String g = cd.getData().getPrimaryGroup().getName();
                if (g != null && !g.isEmpty()) return g;
            } catch (Throwable ignored) {
            }
        }
        return p.isOp() ? "op" : "player";
    }

    public String hexRangi(Player p) {
        return konfig.hexRangi(ranga(p));
    }

    /** Przedrostek czatu: §x<hex-rangi>» §r */
    public String przedrostek(Player p) {
        return Narzedzia.spust(hexRangi(p)) + "» §r";
    }
}
