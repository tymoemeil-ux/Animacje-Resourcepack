package org.bukkit.entity;
import java.util.UUID;
import org.bukkit.Location;
import org.bukkit.OfflinePlayer;
import org.bukkit.Sound;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.PlayerInventory;
import org.bukkit.inventory.InventoryView;
public interface Player extends HumanEntity, OfflinePlayer {
    void sendMessage(String message);
    void sendActionBar(String message);
    void sendTitle(String title, String subtitle, int fadeIn, int stay, int fadeOut);
    void sendTitle(String title, String subtitle);
    void setDisplayName(String name);
    String getDisplayName();
    boolean hasPermission(String permission);
    boolean isOp();
    void playSound(Location location, Sound sound, float volume, float pitch);
    default void playSound(Location location, String sound, float volume, float pitch) {}
    void openInventory(Inventory inventory);
    void closeInventory();
    PlayerInventory getInventory();
    InventoryView getOpenInventory();
    boolean isOnline();
    UUID getUniqueId();
}
