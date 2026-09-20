package dev.tymek24.animacje;

import java.util.function.Consumer;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.event.player.AsyncPlayerChatEvent;
import org.bukkit.event.player.PlayerChatEvent;
import org.bukkit.event.player.PlayerJoinEvent;
import org.bukkit.event.player.PlayerQuitEvent;

/** Listener: obsługuje zarówno klasyczny, jak i asynchroniczny czat Bukkit. */
public final class Wydarzenia implements Listener {
    private final Animacje plugin;

    public Wydarzenia(Animacje plugin) {
        this.plugin = plugin;
    }

    @EventHandler
    public void asyncChat(AsyncPlayerChatEvent event) {
        if (event.isCancelled() || !plugin.config().chatEnabled()) return;
        formatChat(event.getPlayer(), event::setFormat);
    }

    @EventHandler
    public void chat(PlayerChatEvent event) {
        if (event.isCancelled() || !plugin.config().chatEnabled()) return;
        formatChat(event.getPlayer(), event::setFormat);
    }

    private void formatChat(Player player, Consumer<String> formatSetter) {
        Profil profile = plugin.profiles().get(player);
        String rank = Narzedzia.ucieknijFormat(plugin.rangi().prefix(player));
        String separator = "§8»§r ";
        if (profile.nickWlaczony) {
            Katalog.Fx fx = Katalog.byName(profile.fx);
            if (fx == null) fx = Katalog.byName(plugin.config().nickDefaultFx());
            String nick = fx == null ? player.getName()
                    : Tekst.animowany(fx, profile.nick.isBlank() ? player.getName() : profile.nick, plugin.config().nickMaxLength());
            formatSetter.accept(rank + Narzedzia.ucieknijFormat(nick) + "§r " + separator + "%2$s");
        } else {
            formatSetter.accept(rank + "%1$s§r " + separator + "%2$s");
        }
    }

    @EventHandler
    public void join(PlayerJoinEvent event) {
        Player player = event.getPlayer();
        plugin.profiles().get(player);
        plugin.resourcePack().send(player);
        if (plugin.config().joinMessages()) {
            Profil profile = plugin.profiles().get(player);
            Katalog.Fx fx = profile.nickWlaczony ? Katalog.byName(profile.fx) : null;
            String name = fx == null ? Tekst.czysty(profile.nick.isBlank() ? player.getName() : profile.nick)
                    : Tekst.animowany(fx, profile.nick.isBlank() ? player.getName() : profile.nick);
            event.setJoinMessage(plugin.rangi().prefix(player) + name + "§r §7dołączył.");
        }
    }

    @EventHandler
    public void quit(PlayerQuitEvent event) {
        if (plugin.config().joinMessages()) {
            Player player = event.getPlayer();
            Profil profile = plugin.profiles().get(player);
            Katalog.Fx fx = profile.nickWlaczony ? Katalog.byName(profile.fx) : null;
            String name = fx == null ? Tekst.czysty(profile.nick.isBlank() ? player.getName() : profile.nick)
                    : Tekst.animowany(fx, profile.nick.isBlank() ? player.getName() : profile.nick);
            event.setQuitMessage(plugin.rangi().prefix(player) + name + "§r §7opuścił serwer.");
        }
    }

    @EventHandler
    public void inventory(InventoryClickEvent event) {
        if (event.getWhoClicked() instanceof Player) {
            plugin.menu().handle(event, (Player) event.getWhoClicked());
        }
    }
}
