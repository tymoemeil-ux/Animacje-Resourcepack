package org.bukkit.plugin.java;
import java.io.File;
import java.util.logging.Logger;
import org.bukkit.command.PluginCommand;
import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.plugin.Plugin;
import org.bukkit.scheduler.BukkitScheduler;
public abstract class JavaPlugin implements Plugin {
    public org.bukkit.Server getServer() { return null; }
    public File getDataFolder() { return null; }
    public Logger getLogger() { return null; }
    public FileConfiguration getConfig() { return null; }
    public void saveDefaultConfig() {}
    public void saveConfig() {}
    public void reloadConfig() {}
    public java.io.InputStream getResource(String name) { return null; }
    public PluginCommand getCommand(String name) { return null; }
    public String getName() { return ""; }
    public boolean isEnabled() { return true; }
    public BukkitScheduler getScheduler() { return null; }
    public void onEnable() {}
    public void onDisable() {}
}
