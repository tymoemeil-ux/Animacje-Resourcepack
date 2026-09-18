package dev.tymek24.animacje;

import java.util.ArrayList;
import java.util.List;
import org.bukkit.Bukkit;
import org.bukkit.BossBar;
import org.bukkit.Sound;
import org.bukkit.entity.Player;

/** Trole — nieszkodliwe akcje rozrywkowe na graczu. */
public final class Trolle {

    private final List<java.util.function.BiConsumer<Player, Katalog.Fx>> akcje = new ArrayList<>();

    public Trolle() {
        akcje.add((cel, fx) -> cel.whisper(Bukkit.getOfflinePlayer("Console"),
                "§c[Serwer] Cos teraz przelatalo ci nad glowa... (nie, to bylo nic)"));
        akcje.add((cel, fx) -> cel.whisper(Bukkit.getOfflinePlayer("Console"),
                "§e[Serwer] Zostales oznaczony przez admina. Prawdopodobnie."));
        akcje.add((cel, fx) -> cel.sendTitle(fx.spust() + "TROLL", "§7to ty, §f" + cel.getName(), 4, 50, 10));
        akcje.add((cel, fx) -> cel.sendTitle("§aZDROWIE", "§8zostal ci dodany... no dobra, nic", 4, 50, 10));
        akcje.add((cel, fx) -> cel.sendActionBar("§8Ktos ci sie przypatruje... §7(spoko, to my)"));
        akcje.add((cel, fx) -> {
            BossBar bar = Bukkit.createBossBar(fx.spust() + "!!!", BossBar.Color.RED, BossBar.Overlay.NOTCHED_10);
            bar.setProgress(0.3f);
            bar.addPlayer(cel);
            Bukkit.getScheduler().runTaskLater(Animacje.instancja().plugin(), () -> {
                bar.setProgress(1.0f);
            }, 40L);
            Bukkit.getScheduler().runTaskLater(Animacje.instancja().plugin(), bar::remove, 70L);
        });
        akcje.add((cel, fx) -> cel.playSound(cel.getLocation(), Sound.ENTITY_WITHER_SPAWN, 0.6f, 0.5f));
        akcje.add((cel, fx) -> cel.playSound(cel.getLocation(), Sound.ENTITY_VILLAGER_YES, 1.0f, 1.6f));
        akcje.add((cel, fx) -> cel.sendMessage(
                "§8[Serwer] §f" + cel.getName() + " §8zostal teleportowany przez admina §8(no, kłamstwo)"));
        akcje.add((cel, fx) -> cel.whisper(Bukkit.getOfflinePlayer("Console"),
                "§b[Serwer] Ciekawostka: §7jestes §e256. §7adminem dzis."));
        akcje.add((cel, fx) -> {
            cel.playSound(cel.getLocation(), Sound.ENTITY_PLAYER_LEVELUP, 1.0f, 1.0f);
            cel.sendTitle(fx.spust() + "LEVEL UP", "§7+1 troll §8(" + cel.getName() + ")", 4, 50, 10);
        });
    }

    public int ilosc() { return akcje.size(); }

    /** Losowy troll na cel. Zwraca opis wykonanej akcji. */
    public String losowo(Player cel) {
        Katalog.Fx fx = Katalog.losowyAnimowany();
        java.util.function.BiConsumer<Player, Katalog.Fx> a = Narzedzia.los(akcje);
        if (a == null) return "brak akcji";
        a.accept(cel, fx);
        return cel.getName();
    }
}
