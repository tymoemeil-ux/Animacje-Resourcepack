package org.bukkit.event.inventory;
import org.bukkit.entity.HumanEntity;
import org.bukkit.event.Cancellable;
import org.bukkit.event.Event;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
public class InventoryClickEvent extends Event implements Cancellable {
    public int getRawSlot() { return 0; }
    public int getSlot() { return 0; }
    public Inventory getClickedInventory() { return null; }
    public ItemStack getCurrentItem() { return null; }
    public HumanEntity getWhoClicked() { return null; }
    @Override
    public boolean isCancelled() { return false; }
    @Override
    public void setCancelled(boolean cancel) {}
}
