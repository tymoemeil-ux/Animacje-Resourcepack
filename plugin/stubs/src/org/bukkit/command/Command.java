package org.bukkit.command;
public abstract class Command {
    protected Command() {}
    public abstract String getName();
    public String getLabel() { return null; }
    public void setExecutor(CommandExecutor ex) {}
    public void setTabCompleter(TabCompleter tc) {}
}
