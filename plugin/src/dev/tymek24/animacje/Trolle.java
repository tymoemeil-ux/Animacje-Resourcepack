package dev.tymek24.animacje;

import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ThreadLocalRandom;
import org.bukkit.Bukkit;
import org.bukkit.Sound;
import org.bukkit.boss.BarColor;
import org.bukkit.boss.BarStyle;
import org.bukkit.boss.BossBar;
import org.bukkit.entity.Player;

/** Tylko kosmetyczne, odwracalne trolle — bez obrażeń, teleportów i griefingu. */
public final class Trolle {
    private final Animacje plugin;
    private final Map<UUID, Long> cooldowns = new ConcurrentHashMap<>();

    public Trolle(Animacje plugin) {
        this.plugin = plugin;
    }

    public long remaining(Player actor) {
        long until = cooldowns.getOrDefault(actor.getUniqueId(), 0L);
        return Math.max(0L, (until - System.currentTimeMillis() + 999L) / 1000L);
    }

    public boolean execute(Player actor, Player target, String requestedType, Katalog.Fx requestedFx) {
        long remaining = remaining(actor);
        if (remaining > 0) {
            actor.sendMessage("§cOdczekaj jeszcze " + remaining + " s przed kolejnym trollem.");
            return false;
        }
        if (target == null) return false;
        if (target == actor && !plugin.config().trollSelf()) {
            actor.sendMessage("§cTrollowanie siebie jest wyłączone w konfiguracji.");
            return false;
        }
        Katalog.Fx fx = requestedFx == null
                ? Katalog.random(actor.hasPermission("animacje.hacker")) : requestedFx;
        if (fx != null && fx.hakerski() && !actor.hasPermission("animacje.hacker")) {
            actor.sendMessage("§cEfekty hakerskie wymagają uprawnienia: §fanimacje.hacker");
            return false;
        }
        String type = requestedType == null ? "random" : requestedType.toLowerCase(Locale.ROOT);
        if (type.equals("random") || type.equals("losowy")) {
            int variants = actor.hasPermission("animacje.troll.bossbar") ? 5 : 4;
            type = switch (ThreadLocalRandom.current().nextInt(variants)) {
                case 0 -> "title";
                case 1 -> "actionbar";
                case 2 -> "chat";
                case 3 -> "sound";
                default -> "bossbar";
            };
        }
        switch (type) {
            case "title":
                plugin.titles().wyslij(target, fx, "TROLL!", "To był tylko efekt tekstu ✦");
                break;
            case "actionbar":
                target.sendActionBar(Tekst.animowany(fx, "Ktoś właśnie odpalił efekt na Twoim ekranie"));
                break;
            case "chat":
                target.sendMessage("§f[Animacje] " + Tekst.animowany(fx, "Niespodzianka dla " + target.getName() + " ✦"));
                break;
            case "sound":
                target.playSound(target.getLocation(), Sound.BLOCK_NOTE_BLOCK_PLING, 0.8f, 1.8f);
                target.sendActionBar(Tekst.animowany(fx, "♪"));
                break;
            case "bossbar":
                if (!actor.hasPermission("animacje.troll.bossbar")) {
                    actor.sendMessage("§cBossbar troll wymaga permissionu: §fanimacje.troll.bossbar");
                    return false;
                }
                BossBar bar = Bukkit.createBossBar(Tekst.animowany(fx, "SYSTEM ALERT"), BarColor.PURPLE, BarStyle.SEGMENTED_10);
                bar.addPlayer(target);
                bar.setProgress(1.0);
                bar.setVisible(true);
                target.sendActionBar(Tekst.animowany(fx, "Monitorowanie połączenia..."));
                Bukkit.getScheduler().runTaskLater(plugin, () -> {
                    bar.removeAll();
                    bar.hide();
                }, 80L);
                break;
            default:
                actor.sendMessage("§cTyp trolla: title, actionbar, chat, sound albo random.");
                return false;
        }
        cooldowns.put(actor.getUniqueId(), System.currentTimeMillis() + plugin.config().trollCooldown() * 1000L);
        return true;
    }
}
