package org.bukkit.entity;
import org.bukkit.Location;
import org.bukkit.Sound;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
public interface Player extends HumanEntity, org.bukkit.OfflinePlayer {
    void sendMessage(String message);
    void sendActionBar(String message);
    void openInventory(Inventory inventory);
    void closeInventory();
    Inventory getInventory();
    ItemStack getItemInHand();
    void setItemInMainHand(ItemStack item);
    ItemStack getItemInOffHand();
    void setItemInOffHand(ItemStack item);
    boolean hasPermission(String permission);
    void playSound(Location location, Sound sound, float volume, float pitch);
    Location getLocation();
    void kickPlayer(String message);
    boolean isOp();
}
