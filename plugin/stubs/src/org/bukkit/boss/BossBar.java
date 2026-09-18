package org.bukkit.boss;
import org.bukkit.entity.Player;
public interface BossBar {
    void setProgress(double progress);
    void addPlayer(Player player);
    void removePlayer(Player player);
    void removeAll();
    void hide();
    void setVisible(boolean visible);
}
