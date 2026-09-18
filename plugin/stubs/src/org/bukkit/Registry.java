package org.bukkit;
public interface Registry<T> {
    org.bukkit.Registry<org.bukkit.Material> MATERIALS = null;
    T get(NamespacedKey key);
    T match(String name);
}
