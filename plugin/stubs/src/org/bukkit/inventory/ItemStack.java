package org.bukkit.inventory;
import org.bukkit.Material;
public class ItemStack {
    public ItemStack(Material type) {}
    public ItemStack(Material type, int amount) {}
    public Material getType() { return null; }
    public ItemMeta getItemMeta() { return null; }
    public boolean setItemMeta(ItemMeta meta) { return true; }
    public boolean hasItemMeta() { return false; }
    public int getAmount() { return 1; }
    public void setAmount(int amount) {}
}
