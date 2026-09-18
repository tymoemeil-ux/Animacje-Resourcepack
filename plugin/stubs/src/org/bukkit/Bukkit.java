package org.bukkit;
import java.util.Collection;
import org.bukkit.boss.BarColor;
import org.bukkit.boss.BarStyle;
import org.bukkit.boss.BossBar;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.InventoryHolder;
import org.bukkit.plugin.PluginManager;
import org.bukkit.scheduler.BukkitScheduler;
public final class Bukkit {
    private Bukkit() {}
    public static BukkitScheduler getScheduler() { return null; }
    public static PluginManager getPluginManager() { return null; }
    public static int broadcastMessage(String message) { return 0; }
    public static BossBar createBossBar(String title, BarColor color, BarStyle style) { return null; }
    public static Inventory createInventory(InventoryHolder holder, int size, String title) { return null; }
    public static Player getPlayer(String name) { return null; }
    public static OfflinePlayer getOfflinePlayer(String name) { return null; }
    public static Collection<? extends Player> getOnlinePlayers() { return null; }
    public static String getName() { return ""; }
    public static String getVersion() { return ""; }
    public static String getBukkitVersion() { return ""; }
}
