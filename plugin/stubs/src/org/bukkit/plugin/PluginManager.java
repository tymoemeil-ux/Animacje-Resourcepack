package org.bukkit.plugin;
public interface PluginManager {
    Plugin getPlugin(String name);
    void registerEvents(org.bukkit.event.Listener listener, Plugin plugin);
}
