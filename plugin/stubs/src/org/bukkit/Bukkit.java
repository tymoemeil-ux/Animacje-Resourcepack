package org.bukkit;
import java.util.Collection;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.InventoryHolder;
import org.bukkit.plugin.Plugin;
import org.bukkit.scheduler.BukkitScheduler;
public final class Bukkit {
    private Bukkit() {}
    public static BukkitScheduler getScheduler() { return null; }
    public static void broadcast(String message) {}
    public static BossBar createBossBar(String title, BossBar.Color color, BossBar.Overlay overlay) { return null; }
    public static Inventory createInventory(InventoryHolder holder, int size, String title) { return null; }
    public static Player getPlayer(String name) { return null; }
    public static OfflinePlayer getOfflinePlayer(String name) { return null; }
    public static Collection<Player> getOnlinePlayers() { return null; }
    public static String getName() { return ""; }
    public static String getVersion() { return ""; }
    public static String getBukkitVersion() { return ""; }
    public static org.bukkit.plugin.manager.PluginManager getPluginManager() { return null; }
}
