package org.bukkit.event.player;
import org.bukkit.entity.Player;
import org.bukkit.event.Event;
public class PlayerQuitEvent extends Event {
    public Player getPlayer() { return null; }
    public String getQuitMessage() { return null; }
    public void setQuitMessage(String message) {}
}
