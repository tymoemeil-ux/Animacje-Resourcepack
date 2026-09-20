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
        String base = plugin.config().baseChatColor();
        String rank = Narzedzia.ucieknijFormat(plugin.rangi().prefix(player));
        String separator = base + "»" + base + " ";
        if (profile.nickWlaczony) {
            Katalog.Fx fx = Katalog.byName(profile.fx);
            if (fx == null) fx = Katalog.byName(plugin.config().nickDefaultFx());
            String raw = profile.nick.isBlank() ? player.getName() : profile.nick;
            String nick = fx == null ? raw : profile.kolor.isBlank()
                    ? Tekst.animowany(fx, raw, plugin.config().nickMaxLength())
                    : Tekst.custom(fx, profile.kolor, raw, plugin.config().nickMaxLength());
            formatSetter.accept(rank + Narzedzia.ucieknijFormat(nick) + base + " " + separator + "%2$s");
        } else {
            formatSetter.accept(rank + "%1$s" + base + " " + separator + "%2$s");
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
            String raw = profile.nick.isBlank() ? player.getName() : profile.nick;
            String name = fx == null ? Tekst.czysty(raw) : profile.kolor.isBlank()
                    ? Tekst.animowany(fx, raw) : Tekst.custom(fx, profile.kolor, raw);
            event.setJoinMessage(plugin.rangi().prefix(player) + name + plugin.config().baseChatColor() + "dołączył.");
        }
    }

    @EventHandler
    public void quit(PlayerQuitEvent event) {
        if (plugin.config().joinMessages()) {
            Player player = event.getPlayer();
            Profil profile = plugin.profiles().get(player);
            Katalog.Fx fx = profile.nickWlaczony ? Katalog.byName(profile.fx) : null;
            String raw = profile.nick.isBlank() ? player.getName() : profile.nick;
            String name = fx == null ? Tekst.czysty(raw) : profile.kolor.isBlank()
                    ? Tekst.animowany(fx, raw) : Tekst.custom(fx, profile.kolor, raw);
            event.setQuitMessage(plugin.rangi().prefix(player) + name + plugin.config().baseChatColor() + "opuścił serwer.");
        }
    }

    @EventHandler
    public void inventory(InventoryClickEvent event) {
        if (event.getWhoClicked() instanceof Player) {
            plugin.menu().handle(event, (Player) event.getWhoClicked());
        }
    }
}
