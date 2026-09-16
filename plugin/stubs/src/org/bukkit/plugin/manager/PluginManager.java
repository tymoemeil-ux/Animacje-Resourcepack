package org.bukkit.plugin.manager;
import org.bukkit.event.Listener;
import org.bukkit.plugin.Plugin;
public interface PluginManager {
    void registerEvents(Listener listener, Plugin plugin);
}
