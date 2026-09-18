package org.bukkit.event.player;
import org.bukkit.entity.Player;
import org.bukkit.event.Cancellable;
import org.bukkit.event.Event;
public class PlayerChatEvent extends Event implements Cancellable {
    public Player getPlayer() { return null; }
    public String getMessage() { return null; }
    public void setMessage(String message) {}
    public boolean isCancelled() { return false; }
    public void setCancelled(boolean cancelled) {}
}
