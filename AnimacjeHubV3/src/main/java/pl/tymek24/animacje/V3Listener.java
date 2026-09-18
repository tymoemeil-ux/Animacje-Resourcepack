package pl.tymek24.animacje;
import org.bukkit.event.*; import org.bukkit.event.player.PlayerJoinEvent;
/** Listener V3 — celowo mały; moduły funkcji są dokładane niezależnie. */
public final class V3Listener implements Listener { private final V3Service s; public V3Listener(V3Service s){this.s=s;} @EventHandler public void join(PlayerJoinEvent e){ if(s.nick(e.getPlayer())) e.getPlayer().sendMessage("§5AnimacjeHub V3 §7aktywny."); } }
