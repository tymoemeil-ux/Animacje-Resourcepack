package pl.tymek24.animacje.v3.services;

import pl.tymek24.animacje.v3.*;
import pl.tymek24.animacje.v3.config.*;
import pl.tymek24.animacje.v3.catalog.*;
import pl.tymek24.animacje.v3.services.*;
import pl.tymek24.animacje.v3.gui.*;
import pl.tymek24.animacje.v3.commands.*;
import pl.tymek24.animacje.v3.listeners.*;
import java.util.ArrayList;
import java.util.List;
import org.bukkit.Bukkit;
import org.bukkit.boss.BarColor;
import org.bukkit.boss.BarStyle;
import org.bukkit.boss.BossBar;
import org.bukkit.entity.Player;

/** Trole — nieszkodliwe akcje rozrywkowe na graczu. */
public final class Trolle {

    private final List<java.util.function.BiConsumer<Player, Katalog.Fx>> akcje = new ArrayList<>();

    public Trolle() {
        akcje.add((cel, fx) -> cel.sendActionBar("§8[szept] §cCos teraz przelatalo ci nad glowa... (nie, to bylo nic)"));
        akcje.add((cel, fx) -> cel.sendActionBar("§8[szept] §eZostales oznaczony przez admina. Prawdopodobnie."));
        akcje.add((cel, fx) -> cel.sendTitle(fx.spust() + "TROLL", "§7to ty, §f" + cel.getName(), 4, 50, 10));
        akcje.add((cel, fx) -> cel.sendTitle("§aZDROWIE", "§8zostal ci dodany... no dobra, nic", 4, 50, 10));
        akcje.add((cel, fx) -> cel.sendActionBar("§8Ktos ci sie przypatruje... §7(spoko, to my)"));
        akcje.add((cel, fx) -> {
            BossBar bar = Bukkit.createBossBar(fx.spust() + "!!!", BarColor.RED, BarStyle.SEGMENTED_10);
            bar.setProgress(0.3);
            bar.addPlayer(cel);
            Bukkit.getScheduler().runTaskLater(AnimacjeHubV3.instancja(), () -> bar.setProgress(1.0), 40L);
            Bukkit.getScheduler().runTaskLater(AnimacjeHubV3.instancja(), () -> {
                bar.removeAll();
                bar.hide();
            }, 70L);
        });
        akcje.add((cel, fx) -> cel.playSound(cel.getLocation(), "entity.wither.spawn", 0.6f, 0.5f));
        akcje.add((cel, fx) -> cel.playSound(cel.getLocation(), "entity.villager.yes", 1.0f, 1.6f));
        akcje.add((cel, fx) -> cel.sendMessage(
                "§8[Serwer] §f" + cel.getName() + " §8zostal teleportowany przez admina §8(no, kłamstwo)"));
        akcje.add((cel, fx) -> cel.sendActionBar("§8[szept] §bCiekawostka: §7jestes §e256. §7adminem dzis."));
        akcje.add((cel, fx) -> {
            cel.playSound(cel.getLocation(), "entity.player.levelup", 1.0f, 1.0f);
            cel.sendTitle(fx.spust() + "LEVEL UP", "§7+1 troll §8(" + cel.getName() + ")", 4, 50, 10);
        });
    }

    public int ilosc() { return akcje.size(); }

    /** Losowy troll na cel. */
    public void losowo(Player cel) {
        Katalog.Fx fx = Katalog.losowyAnimowany();
        java.util.function.BiConsumer<Player, Katalog.Fx> a = Narzedzia.los(akcje);
        if (a == null) return;
        a.accept(cel, fx);
    }
}
