package org.bukkit.command;
public interface CommandExecutor {
    boolean onCommand(CommandSender sender, org.bukkit.command.Command command, String label, String[] args);
}
