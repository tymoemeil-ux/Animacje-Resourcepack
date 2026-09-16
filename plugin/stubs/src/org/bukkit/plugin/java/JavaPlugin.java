package org.bukkit.plugin.java;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.TabCompleter;
import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.plugin.Plugin;
import java.io.File;
import java.util.logging.Logger;
public abstract class JavaPlugin implements Plugin, CommandExecutor, TabCompleter {
    public FileConfiguration getConfig() { return null; }
    public org.bukkit.scheduler.BukkitScheduler getScheduler() { return null; }
    public void saveDefaultConfig() {}
    public void saveConfig() {}
    public Logger getLogger() { return null; }
    public File getDataFolder() { return null; }
    public String getName() { return null; }
    public boolean isEnabled() { return true; }
    public void onEnable() {}
    public void onDisable() {}
    public org.bukkit.command.Command getCommand(String name) { return null; }
    public void reloadConfig() {}
}
