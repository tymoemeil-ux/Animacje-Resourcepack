package org.bukkit.configuration.file;
import java.util.List;

/** Stub zgodny ze skladnia paper-api 1.21.11: to KLASA, nie interfejs. */
public abstract class FileConfiguration {

    public abstract boolean getBoolean(String path, boolean def);

    public abstract int getInt(String path, int def);

    public abstract String getString(String path);

    public abstract String getString(String path, String def);

    public abstract List<String> getStringList(String path);
}
