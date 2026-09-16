package org.bukkit.scheduler;
import org.bukkit.plugin.java.JavaPlugin;
public interface BukkitScheduler {
    BukkitTask runTask(JavaPlugin plugin, Runnable task);
    BukkitTask runTaskLater(JavaPlugin plugin, Runnable task, long delay);
    BukkitTask runTaskTimer(JavaPlugin plugin, Runnable task, long delay, long period);
    void cancelTask(int taskId);
    void cancelTasks(JavaPlugin plugin);
}
