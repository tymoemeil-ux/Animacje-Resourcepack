package org.bukkit.inventory;
import java.util.List;
public interface ItemMeta {
    void setDisplayName(String name);
    String getDisplayName();
    boolean hasDisplayName();
    void setLore(List<String> lore);
    List<String> getLore();
    boolean hasLore();
}
