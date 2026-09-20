package dev.tymek24.animacje;

import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;

/** Animowane nazwy itemów trzymanych w głównej ręce. */
public final class Itemy {
    private final Konfig config;

    public Itemy(Konfig config) {
        this.config = config;
    }

    public boolean ustaw(Player player, Katalog.Fx fx, String name) {
        ItemStack item = player.getInventory().getItemInMainHand();
        if (item == null || item.getType() == Material.AIR) return false;
        ItemMeta meta = item.getItemMeta();
        if (meta == null) return false;
        meta.setDisplayName(Tekst.animowany(fx, Narzedzia.ogranicz(name, config.itemMaxLength())));
        item.setItemMeta(meta);
        player.getInventory().setItemInMainHand(item);
        return true;
    }

    public boolean wyczysc(Player player) {
        ItemStack item = player.getInventory().getItemInMainHand();
        if (item == null || item.getType() == Material.AIR) return false;
        ItemMeta meta = item.getItemMeta();
        if (meta == null || !meta.hasDisplayName()) return false;
        meta.setDisplayName(null);
        item.setItemMeta(meta);
        player.getInventory().setItemInMainHand(item);
        return true;
    }
}
