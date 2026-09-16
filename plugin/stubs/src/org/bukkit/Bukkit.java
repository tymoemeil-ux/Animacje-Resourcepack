package org.bukkit;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.InventoryHolder;
import org.bukkit.plugin.manager.PluginManager;
import org.bukkit.scheduler.BukkitScheduler;
import java.util.Collection;
import java.util.UUID;
public final class Bukkit {
    private Bukkit() {}
    public static Collection<? extends Player> getOnlinePlayers() { return null; }
    public static org.bukkit.command.CommandSender getConsoleSender() { return null; }
    public static Player getPlayer(String name) { return null; }
    public static Player getPlayer(UUID id) { return null; }
    public static Inventory createInventory(InventoryHolder owner, int size, String title) { return null; }
    public static void broadcastMessage(String message) {}
    public static BukkitScheduler getScheduler() { return null; }
    public static PluginManager getPluginManager() { return null; }
    public static String getName() { return null; }
}
