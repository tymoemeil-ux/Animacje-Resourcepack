package org.bukkit.plugin.manager;
import org.bukkit.plugin.Plugin;
public interface PluginManager {
    Plugin getPlugin(String name);
    boolean isPluginEnabled(String name);
    void registerEvents(org.bukkit.event.Listener listener, Plugin plugin);
}
