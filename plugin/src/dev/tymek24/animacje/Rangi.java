package dev.tymek24.animacje;

import java.lang.reflect.Method;
import java.util.List;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;

/** Rangi z LuckPerms (opcjonalnie) albo z prostych permissionów pluginu. */
public final class Rangi {
    private final Konfig config;

    public Rangi(Konfig config) {
        this.config = config;
    }

    public String grupa(Player player) {
        String luck = luckPermsGroup(player);
        if (luck != null && !luck.isBlank()) return luck.toLowerCase(java.util.Locale.ROOT);

        List<String> order = config.rankOrder();
        String permissionPrefix = config.rankPermissionPrefix();
        for (String group : order) {
            if (group.equals("default") || group.equals("op")) continue;
            if (player.hasPermission(permissionPrefix + group)) return group;
        }
        if (player.isOp() && order.contains("op")) return "op";
        return "default";
    }

    public String prefix(Player player) {
        if (!config.rankEnabled()) return "";
        String group = grupa(player);
        String value = config.rankPrefix(group);
        if (value == null || value.isBlank()) return "";
        value = value.replace("{ranga}", group).replace("{grupa}", group);
        Katalog.Fx fx = Katalog.byName(config.rankFx(group));
        if (fx == null) fx = Katalog.byName("wave");
        return Tekst.animowany(fx, value, 64) + " ";
    }

    public String opis(Player player) {
        String group = grupa(player);
        Katalog.Fx fx = Katalog.byName(config.rankFx(group));
        return group + " / " + (fx == null ? "?" : fx.nazwa);
    }

    public boolean luckPerms() {
        try {
            return Bukkit.getPluginManager() != null && Bukkit.getPluginManager().getPlugin("LuckPerms") != null;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private String luckPermsGroup(Player player) {
        if (!luckPerms()) return null;
        try {
            Class<?> provider = Class.forName("net.luckperms.api.LuckPermsProvider");
            Object luckPerms = provider.getMethod("get").invoke(null);
            Method adapterMethod = luckPerms.getClass().getMethod("getPlayerAdapter", Class.class);
            Object adapter = adapterMethod.invoke(luckPerms, Player.class);
            Object cached = adapter.getClass().getMethod("getCachedData", Player.class).invoke(adapter, player);
            Object data = cached.getClass().getMethod("getData").invoke(cached);
            Object primary = data.getClass().getMethod("getPrimaryGroup").invoke(data);
            if (primary == null) return null;
            if (primary instanceof String) return (String) primary;
            Object name = primary.getClass().getMethod("getName").invoke(primary);
            return name == null ? null : String.valueOf(name);
        } catch (Throwable ignored) {
            // Brak LuckPerms, niezgodna wersja albo ładowanie w czasie startu — fallback jest zamierzony.
            return null;
        }
    }
}
