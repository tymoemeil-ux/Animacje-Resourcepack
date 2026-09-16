package org.bukkit.plugin;
import java.io.File;
public interface Plugin {
    String getName();
    File getDataFolder();
    boolean isEnabled();
}
