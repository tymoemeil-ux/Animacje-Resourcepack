package org.bukkit.entity;
import org.bukkit.inventory.PlayerInventory;
public interface HumanEntity extends Entity {
    PlayerInventory getInventory();
}
