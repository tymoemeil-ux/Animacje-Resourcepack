package org.bukkit.command;
public interface CommandSender {
    String getName();
    void sendMessage(String message);
    boolean hasPermission(String permission);
}
