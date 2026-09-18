package org.bukkit;
public class NamespacedKey {
    public NamespacedKey(String namespace, String key) {}
    public static NamespacedKey minecraft(String key) { return new NamespacedKey("minecraft", key); }
    public String getKey() { return ""; }
    public String getNamespace() { return ""; }
}
