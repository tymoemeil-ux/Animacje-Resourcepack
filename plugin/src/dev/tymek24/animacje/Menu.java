package dev.tymek24.animacje;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;

/** Proste GUI bez skomplikowanego stanu: komendy pozostają głównym API pluginu. */
public final class Menu {
    private static final int PAGE_SIZE = 45;
    private final Animacje plugin;
    private final Map<Inventory, View> views = new WeakHashMap<>();

    public Menu(Animacje plugin) {
        this.plugin = plugin;
    }

    public void openMain(Player player) {
        Inventory inventory = Bukkit.createInventory(null, 27, "§dAnimacje 3.1 §8• §fv2");
        views.put(inventory, new View("main", 0));
        for (int i = 0; i < inventory.getSize(); i++) inventory.setItem(i, pane());
        inventory.setItem(4, item(Material.BOOK, "§dAnimacje 3.1", List.of(
                "§f85 efektów tekstu • 25 nowych • 10 hakerskich", "§7Plugin v2 • target renderu: " + plugin.config().targetFps() + " FPS")));
        inventory.setItem(10, item(Material.DIAMOND, "§bKatalog FX", List.of("§7Kliknij, aby obejrzeć dostępne efekty")));
        inventory.setItem(12, item(Material.CLOCK, "§eAnimowany nick", List.of(
                "§7Stan: " + Tekst.status(plugin.profiles().get(player).nickWlaczony),
                "§7Kliknij, aby przełączyć", "§8/anim nick on|off")));
        inventory.setItem(14, item(Material.PAPER, "§aAnimowany item", List.of(
                "§7Wybierz efekt i nazwę itemu", "§8/anim item <fx> <nazwa>")));
        inventory.setItem(16, item(Material.NETHER_STAR, "§cTrolle kosmetyczne", List.of(
                "§7Title, actionbar, czat albo dźwięk", "§8/anim troll <gracz>")));
        inventory.setItem(20, item(Material.EMERALD, "§aKolor custom", List.of(
                "§7&c, &g, #RGB lub #RRGGBB + dowolny FX", "§8/anim custom &c wave Tekst")));
        inventory.setItem(22, item(Material.COMPASS, "§fPomoc", List.of("§7Kliknij lub użyj /anim help")));
        player.openInventory(inventory);
    }

    public void openFx(Player player, int page, String mode) {
        List<Katalog.Fx> effects = Katalog.visible(player.hasPermission("animacje.hacker"));
        int pages = Math.max(1, (effects.size() + PAGE_SIZE - 1) / PAGE_SIZE);
        page = Math.max(0, Math.min(page, pages - 1));
        Inventory inventory = Bukkit.createInventory(null, 54,
                "§bFX §8• §f" + (page + 1) + "/" + pages);
        views.put(inventory, new View(mode, page));
        for (int i = 0; i < PAGE_SIZE; i++) {
            int index = page * PAGE_SIZE + i;
            inventory.setItem(i, index < effects.size() ? effectItem(effects.get(index)) : pane());
        }
        inventory.setItem(45, item(Material.BARRIER, "§c← Menu", Collections.emptyList()));
        inventory.setItem(49, item(Material.PAPER, "§fStrona " + (page + 1) + "/" + pages, Collections.emptyList()));
        inventory.setItem(53, item(Material.REDSTONE, "§aDalej →", Collections.emptyList()));
        player.openInventory(inventory);
    }

    public boolean handle(InventoryClickEvent event, Player player) {
        Inventory inventory = event.getClickedInventory();
        View view = inventory == null ? null : views.get(inventory);
        if (view == null) return false;
        event.setCancelled(true);
        if (event.getView() == null || inventory != event.getView().getTopInventory()) return true;
        int slot = event.getRawSlot();
        if (view.type.equals("main")) {
            if (slot == 10) openFx(player, 0, "preview");
            else if (slot == 12) {
                plugin.profiles().toggleNick(player);
                player.sendMessage("§8» §fAnimowany nick: " + Tekst.status(plugin.profiles().get(player).nickWlaczony));
                openMain(player);
            } else if (slot == 14) openFx(player, 0, "item");
            else if (slot == 16) {
                player.closeInventory();
                player.sendMessage("§8» §fUżyj: §d/anim troll <gracz> [title|actionbar|chat|sound]");
            } else if (slot == 20) {
                player.closeInventory();
                player.sendMessage("§8» §fCustom: §d/anim custom &c wave Tekst§f albo §d/anim custom nick #55FFAA wave Nazwa");
            } else if (slot == 22) {
                player.closeInventory();
                plugin.commands().help(player);
            }
            return true;
        }
        if (slot < PAGE_SIZE) {
            int index = view.page * PAGE_SIZE + slot;
            List<Katalog.Fx> effects = Katalog.visible(player.hasPermission("animacje.hacker"));
            if (index < effects.size()) {
                Katalog.Fx fx = effects.get(index);
                if (fx.hakerski() && !player.hasPermission("animacje.hacker")) {
                    player.sendMessage("§cTen efekt wymaga permissionu: §fanimacje.hacker");
                    return true;
                }
                if (view.type.equals("item")) {
                    player.closeInventory();
                    player.sendMessage("§8» §fWybrano §b" + fx.nazwa + "§f. Użyj: §d/anim item " + fx.nazwa + " <nazwa>");
                } else if (view.type.equals("nick")) {
                    plugin.profiles().setFx(player, fx);
                    player.closeInventory();
                    player.sendMessage("§8» §fFX nicku ustawiony na §b" + fx.nazwa + "§f.");
                } else {
                    plugin.titles().wyslij(player, fx, fx.nazwa.toUpperCase(), fx.opis);
                }
            }
        } else if (slot == 45) {
            if (view.page <= 0) openMain(player); else openFx(player, view.page - 1, view.type);
        } else if (slot == 53) {
            int pages = Math.max(1, (Katalog.visible(player.hasPermission("animacje.hacker")).size() + PAGE_SIZE - 1) / PAGE_SIZE);
            openFx(player, view.page + 1 >= pages ? 0 : view.page + 1, view.type);
        }
        return true;
    }

    private ItemStack effectItem(Katalog.Fx fx) {
        String family = fx.hakerski() ? "§cHACKER" : "§b" + fx.rodzina;
        return item(Material.PAPER, fx.spust() + fx.nazwa, List.of(
                family + " §f• " + fx.hex,
                "§f" + fx.opis,
                "§7Klik = podgląd"));
    }

    private ItemStack pane() {
        return item(Material.BLACK_STAINED_GLASS_PANE, "§r", Collections.emptyList());
    }

    private ItemStack item(Material material, String name, List<String> lore) {
        ItemStack stack = new ItemStack(material);
        ItemMeta meta = stack.getItemMeta();
        if (meta != null) {
            meta.setDisplayName(name);
            meta.setLore(lore);
            stack.setItemMeta(meta);
        }
        return stack;
    }

    private static final class View {
        final String type;
        final int page;

        View(String type, int page) {
            this.type = type;
            this.page = page;
        }
    }
}
