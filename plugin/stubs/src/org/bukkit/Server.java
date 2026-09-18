package org.bukkit;
import org.bukkit.plugin.manager.PluginManager;
import org.bukkit.scheduler.BukkitScheduler;
public interface Server {
    PluginManager getPluginManager();
    BukkitScheduler getScheduler();
}
