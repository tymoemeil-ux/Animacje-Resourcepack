package org.bukkit.inventory.meta;
import java.util.List;

/** Stub zgodny z paper-api 1.21.11: org.bukkit.inventory.meta.ItemMeta. */
public interface ItemMeta {
    boolean hasDisplayName();
    String getDisplayName();
    void setDisplayName(String name);
    void setLore(List<String> lore);
}
