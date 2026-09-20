package dev.tymek24.animacje;

import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import org.bukkit.plugin.java.JavaPlugin;

/** Opcjonalne ogłoszenia serwera, domyślnie wyłączone. */
public final class Ogloszenia {
    private final JavaPlugin plugin;
    private final Konfig config;
    private int index;

    public Ogloszenia(JavaPlugin plugin, Konfig config) {
        this.plugin = plugin;
        this.config = config;
    }

    public void start() {
        if (!config.announcementsEnabled() || config.announcements().isEmpty()) return;
        long ticks = config.announcementsInterval() * 20L;
        Bukkit.getScheduler().runTaskTimer(plugin, this::sendNext, ticks, ticks);
    }

    public void send(String message, Player sender) {
        Bukkit.broadcastMessage(replace(message, sender, Katalog.random()));
    }

    private void sendNext() {
        java.util.List<String> messages = config.announcements();
        if (messages.isEmpty()) return;
        Player sample = Narzedzia.los(Bukkit.getOnlinePlayers());
        Bukkit.broadcastMessage(replace(messages.get(index++ % messages.size()), sample, Katalog.random()));
    }

    private String replace(String message, Player player, Katalog.Fx fx) {
        String result = Narzedzia.kody(message);
        result = result.replace("{fx}", fx == null ? "" : fx.spust());
        result = result.replace("{gracz}", player == null ? "gracz" : player.getName());
        result = result.replace("{ranga}", player == null ? "default" : ((Animacje) plugin).rangi().grupa(player));
        result = result.replace("{pack}", config.packName());
        return result + "§r";
    }
}
