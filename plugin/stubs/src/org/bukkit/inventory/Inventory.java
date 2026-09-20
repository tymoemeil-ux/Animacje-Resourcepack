package org.bukkit.inventory;
public interface Inventory {
    int getSize();
    ItemStack getItem(int slot);
    void setItem(int slot, ItemStack item);
    void setItem(ItemStack item);
    InventoryHolder getHolder();
}
