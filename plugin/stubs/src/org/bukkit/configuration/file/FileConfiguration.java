package org.bukkit.configuration.file;
import java.util.List;
import java.util.Set;
public interface FileConfiguration {
    String getString(String path);
    String getString(String path, String def);
    List<String> getStringList(String path);
    boolean getBoolean(String path, boolean def);
    int getInt(String path, int def);
    boolean contains(String path);
    MemorySection getConfigurationSection(String path);
    Set<String> getKeys(boolean deep);
    FileConfigurationOptions options();
}
