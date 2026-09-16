package org.bukkit.event.player;
import org.bukkit.entity.Player;
import org.bukkit.event.Cancellable;
import org.bukkit.event.Event;
import java.util.List;
public class AsyncPlayerChatEvent extends Event implements Cancellable {
    public Player getPlayer() { return null; }
    public String getMessage() { return null; }
    public void setMessage(String message) {}
    public String getFormat() { return null; }
    public void setFormat(String format) {}
    public List<Player> getRecipients() { return null; }
    public void setRecipients(List<Player> recipients) {}
    @Override
    public boolean isCancelled() { return false; }
    @Override
    public void setCancelled(boolean cancel) {}
}
