package org.bukkit.configuration.file;
import java.util.Set;
public interface MemorySection {
    Set<String> getKeys(boolean deep);
    MemorySection getConfigurationSection(String path);
}
