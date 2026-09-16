package pl.animacje.animacjehub;

import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.AsyncPlayerChatEvent;
import org.bukkit.event.player.PlayerJoinEvent;
import org.bukkit.event.player.PlayerQuitEvent;

public final class ChatHook implements Listener {
    private final AnimacjeHub hub;

    public ChatHook(AnimacjeHub hub) {
        this.hub = hub;
    }

    @EventHandler
    public void onChat(final AsyncPlayerChatEvent e) {
        final Player p = e.getPlayer();
        final PlayerData d = hub.dane(p);

        Prompt pr = hub.prompt(p);
        if (pr != null) {
            final String wartosc = e.getMessage();
            e.setCancelled(true);
            Api.runTask(hub, new Runnable() {
                public void run() {
                    if (!p.isOnline()) return;
                    if (wartosc.equalsIgnoreCase("off") || wartosc.equalsIgnoreCase("anuluj") || wartosc.length() == 0) {
                        p.sendMessage("\u00A7c> Anulowano.");
                        return;
                    }
                    pr.dzialaj(wartosc);
                }
            });
            return;
        }

        boolean nickWczacie = hub.cfg.getBoolean("chat.nick_w_czacie", true);
        boolean kolorRangi = hub.cfg.getBoolean("chat.kolor_rangi", true);

        if (d.maNick() && nickWczacie) {
            FxKatalog.Fx fx = FxKatalog.nazwa(d.nickFx);
            String nickStr = (fx != null ? fx.spust() : "") + d.nick + "\u00A7r";
            e.setFormat(e.getFormat().replaceFirst("%s", nickStr));
        }

        if (kolorRangi) {
            String ranga = RankEngine.ranga(p);
            if (ranga.length() > 0) {
                FxKatalog.Fx k = RankEngine.kolorDlaRangi(ranga);
                if (k != null) e.setMessage(k.spust() + "\u00A7r" + e.getMessage());
            }
        }
    }

    @EventHandler
    public void onJoin(PlayerJoinEvent e) {
        hub.dane(e.getPlayer());
    }

    @EventHandler
    public void onQuit(PlayerQuitEvent e) {
        hub.zapisz(e.getPlayer());
        hub.wyczyscPrompt(e.getPlayer());
    }
}
