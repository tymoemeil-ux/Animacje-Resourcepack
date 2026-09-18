package org.bukkit.inventory;
public interface PlayerInventory extends Inventory {
    ItemStack getItemInMainHand();
    void setItem(ItemStack item);
}
