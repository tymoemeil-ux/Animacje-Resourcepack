package pl.tymek24.animacje.v3;

import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.event.player.PlayerChatEvent;
import org.bukkit.event.player.PlayerJoinEvent;
import org.bukkit.event.player.PlayerQuitEvent;
import org.bukkit.entity.Player;

/** Listener: czat (nick), join/quit (kolor rangi), klik GUI. */
public final class Wydarzenia implements Listener {

    private final Animacje main;

    public Wydarzenia(Animacje main) { this.main = main; }

    @EventHandler
    public void czat(PlayerChatEvent e) {
        Player p = e.getPlayer();
        if (!main.nick().wlaczony(p)) return;
        if (main.nick().fxObrotowy(p) == null) return;
        e.setMessage(przedrostekCala(p) + e.getMessage());
    }

    private String przedrostekCala(Player p) {
        return main.rangi().przedrostek(p) + main.nick().przedrostek(p) + p.getName() + "§r §8»§r ";
    }

    @EventHandler
    public void wejscie(PlayerJoinEvent e) {
        Player p = e.getPlayer();
        String hex = main.rangi().hexRangi(p);
        e.setJoinMessage(Narzedzia.spust(hex) + p.getName() + "§r §8zalaczyl sie");
    }

    @EventHandler
    public void wyjscie(PlayerQuitEvent e) {
        Player p = e.getPlayer();
        String hex = main.rangi().hexRangi(p);
        e.setQuitMessage(Narzedzia.spust(hex) + p.getName() + "§r §8opuscil serwer");
    }

    @EventHandler
    public void klik(InventoryClickEvent e) {
        if (!(e.getWhoClicked() instanceof Player)) return;
        main.hub().obsluga(e, (Player) e.getWhoClicked());
    }
}
