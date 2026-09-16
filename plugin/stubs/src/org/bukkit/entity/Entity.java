package org.bukkit.entity;
import java.util.UUID;
public interface Entity {
    UUID getUniqueId();
    String getName();
    boolean isOnline();
}
