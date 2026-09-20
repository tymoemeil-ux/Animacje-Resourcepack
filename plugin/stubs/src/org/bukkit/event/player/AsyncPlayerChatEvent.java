package org.bukkit.event.player;

import org.bukkit.entity.Player;
import org.bukkit.event.Cancellable;
import org.bukkit.event.Event;

/** Minimalny stub legacy async chat event dla kompilacji bez Paper API. */
public class AsyncPlayerChatEvent extends Event implements Cancellable {
    public Player getPlayer() { return null; }
    public String getMessage() { return null; }
    public void setMessage(String message) {}
    public void setFormat(String format) {}
    public String getFormat() { return null; }
    public boolean isCancelled() { return false; }
    public void setCancelled(boolean cancelled) {}
}
