package pl.tymek24.animacje;

import java.util.*;
import org.bukkit.entity.Player;
import org.bukkit.plugin.java.JavaPlugin;

/** Czysty serwis domenowy V3: stan graczy i kontrola cooldownów. */
public final class V3Service {
    private final JavaPlugin plugin; private final Map<UUID,Boolean> nicki = new HashMap<>(); private final Map<UUID,Long> cooldown = new HashMap<>();
    public V3Service(JavaPlugin plugin) { this.plugin=plugin; }
    public boolean nick(Player p) { return nicki.getOrDefault(p.getUniqueId(), true); }
    public void ustawNick(Player p, boolean on) { nicki.put(p.getUniqueId(), on); }
    public boolean mozeTroll(Player p) { return cooldown.getOrDefault(p.getUniqueId(),0L) <= System.currentTimeMillis(); }
    public void cooldown(Player p, long ms) { cooldown.put(p.getUniqueId(), System.currentTimeMillis()+ms); }
    public JavaPlugin plugin() { return plugin; }
    public void close() { nicki.clear(); cooldown.clear(); }
}
