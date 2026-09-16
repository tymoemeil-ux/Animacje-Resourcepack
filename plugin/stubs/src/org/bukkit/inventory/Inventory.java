package org.bukkit.inventory;
public interface Inventory {
    int size();
    ItemStack getItem(int slot);
    void setItem(int slot, ItemStack item);
    void clear();
    InventoryHolder getHolder();
    String getTitle();
    void close();
}
