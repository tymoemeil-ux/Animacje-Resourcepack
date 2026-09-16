package org.bukkit.inventory;
import java.util.List;
public class ItemStack {
    public ItemStack(Material type) {}
    public ItemStack(Material type, int amount) {}
    public Material getType() { return null; }
    public int getAmount() { return 0; }
    public void setAmount(int amount) {}
    public ItemMeta getItemMeta() { return null; }
    public boolean hasItemMeta() { return false; }
    public void setItemMeta(ItemMeta meta) {}
    public void setDisplayName(String name) {}
    public List<String> getLore() { return null; }
    public void setLore(List<String> lore) {}
}
