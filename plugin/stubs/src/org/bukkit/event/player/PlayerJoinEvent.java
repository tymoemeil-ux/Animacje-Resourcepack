package org.bukkit.event.player;
import org.bukkit.entity.Player;
import org.bukkit.event.Event;
public class PlayerJoinEvent extends Event {
    public Player getPlayer() { return null; }
    public String getJoinMessage() { return null; }
    public void setJoinMessage(String message) {}
}
