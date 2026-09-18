package org.bukkit.command;
import org.bukkit.entity.Player;
public interface CommandSender {
    String getName();
    void sendMessage(String message);
    boolean hasPermission(String permission);
    boolean isPlayer();
    Player getPlayer();
}
