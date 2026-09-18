package org.bukkit;
import org.bukkit.entity.Player;
public interface BossBar {
    enum Color { PINK, BLUE, RED, GREEN, YELLOW, PURPLE, WHITE }
    enum Overlay { PROGRESS, NOTCHED_6, NOTCHED_10, NOTCHED_12, NOTCHED_20 }
    void addPlayer(Player player);
    void removePlayer(Player player);
    void remove();
    void setProgress(float progress);
    void setColor(Color color);
    void setOverlay(Overlay overlay);
    boolean isRemoved();
    int getPlayerCount();
}
