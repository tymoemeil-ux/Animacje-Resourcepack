package dev.tymek24.animacje;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.Inventory;
import org.bukkit.Material;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.inventory.ItemStack;

/** GUI: glowne menu, strony FX (45/strona), kolory. */
public final class Hub {

    private static final int NA_STRONE = 45;

    private final Konfig konfig;
    private final Rangi rangi;
    private final Nick nick;
    private final Trolle trolle;
    private final Ogloszenia ogloszenia;
    private final Map<Inventory, String> widoki = new HashMap<>();

    public Hub(Konfig konfig, Rangi rangi, Nick nick, Trolle trolle, Ogloszenia ogloszenia) {
        this.konfig = konfig;
        this.rangi = rangi;
        this.nick = nick;
        this.trolle = trolle;
        this.ogloszenia = ogloszenia;
    }

    private String widok(Inventory inv) {
        return widoki.get(inv);
    }

    private void wlacz(Inventory inv, String nazwa) {
        widoki.put(inv, nazwa);
    }

    private void wylacz(Inventory inv) {
        widoki.remove(inv);
    }

    // ---------- ikony ----------

    private static ItemStack ikona(Material m, String nazwa, List<String> lore) {
        ItemStack it = new ItemStack(m);
        ItemMeta meta = it.getItemMeta();
        meta.setDisplayName(nazwa);
        meta.setLore(lore);
        it.setItemMeta(meta);
        return it;
    }

    private static ItemStack szara() {
        return ikona(Material.BLACK_STAINED_GLASS_PANE, "§r", java.util.Collections.emptyList());
    }

    private ItemStack ikonaFx(Katalog.Fx f) {
        String[] lore = {
            "§8id: §f" + f.id,
            "§8hx: §f" + f.hex,
            "§8rodzina: §f" + f.rodzina,
            "§7Klik = podglad"
        };
        return ikona(Material.PAPER, f.spust() + f.nazwa, java.util.Arrays.asList(lore));
    }

    private ItemStack ikonaKolor(Katalog.Fx f) {
        return ikona(Material.PAPER, f.spust() + f.nazwa,
                java.util.Arrays.asList("§8hx: §f" + f.hex, "§7Klik = podglad"));
    }

    // ---------- widoki ----------

    public void otworzMenu(Player p) {
        Inventory inv = Bukkit.createInventory(null, 54, "§dAnimacje §5Hub §8v2");
        wlacz(inv, "menu");
        for (int i = 0; i < 54; i++) inv.setItem(i, szara());
        inv.setItem(4, ikona(Material.BOOK, "§dAnimacje 2.0", java.util.Arrays.asList(
                "§f" + Katalog.iloscAnimowanych() + " animacji §8+ §f" + Katalog.iloscKolorow() + " kolorow",
                "§7Pack: §fAnimacje2.0.zip", "§8wersja: §f2.0.0")));
        inv.setItem(10, ikona(Material.DIAMOND, "§bFX — animacje",
                java.util.Arrays.asList("§7Katalog §f" + Katalog.iloscAnimowanych() + " efektow", "§7Klik = katalog")));
        inv.setItem(12, ikona(Material.EMERALD, "§aKolory — stala",
                java.util.Arrays.asList("§7" + Katalog.iloscKolorow() + " kolorow bez ruchu", "§7Klik = lista")));
        inv.setItem(14, ikona(Material.CLOCK, "§6Nick animowany: " + (nick.wlaczony(p) ? "§aWŁ" : "§cWYŁ"),
                java.util.Arrays.asList("§7Przedrostek z §fobrotowym FX §7na imieniu", "§7Klik = przelicz")));
        inv.setItem(16, ikona(Material.PAPER, "§eItem — nazwij",
                java.util.Arrays.asList("§7Trzymaj item w reku,", "§7wybierz FX = nazwa z animacja", "§7Klik = katalog")));
        inv.setItem(22, ikona(Material.NETHER_STAR, "§4TROLL — losowy",
                java.util.Arrays.asList("§7" + trolle.ilosc() + " nieszkodliwych akcji", "§7Klik = losowy troll")));
        inv.setItem(30, ikona(Material.GOLD_INGOT, "§6Glos",
                java.util.Arrays.asList("§7Wyslij ogloszenie do wszystkich", "§7(wymaga uprawnienia animacje.glos)")));
        inv.setItem(34, ikona(Material.COMPASS, "§fPomoc",
                java.util.Arrays.asList("/anim fx <nazwa> — podglad", "/anim nick — animowany nick",
                        "/anim item <nazwa> — nazwa itemu", "/anim troll [gracz]", "/anim glos <msg>",
                        "/anim lista — katalog", "/anim info")));
        p.openInventory(inv);
    }

    public void otworzFx(Player p, int strona, boolean trybItem) {
        int stron = (Katalog.ANIMOWANE.size() + NA_STRONE - 1) / NA_STRONE;
        strona = Math.max(0, Math.min(strona, stron - 1));
        Inventory inv = Bukkit.createInventory(null, 54,
                (trybItem ? "§eItem: §f" : "§bFX: §f") + "strona " + (strona + 1) + "/" + stron);
        wlacz(inv, (trybItem ? "fxi:" : "fx:") + strona);
        List<Katalog.Fx> fx = Katalog.ANIMOWANE;
        for (int i = 0; i < NA_STRONE; i++) {
            int globalny = strona * NA_STRONE + i;
            inv.setItem(i, globalny < fx.size() ? ikonaFx(fx.get(globalny)) : szara());
        }
        inv.setItem(45, ikona(Material.BARRIER, "§c← Menu", java.util.Collections.emptyList()));
        inv.setItem(49, ikona(Material.PAPER, "§8strona " + (strona + 1) + "/" + stron, java.util.Collections.emptyList()));
        inv.setItem(53, ikona(Material.REDSTONE, "§a→ Dalej", java.util.Collections.emptyList()));
        p.openInventory(inv);
    }

    public void otworzKolory(Player p) {
        Inventory inv = Bukkit.createInventory(null, 27, "§aKolory — stala");
        wlacz(inv, "kolory");
        for (int i = 0; i < 27; i++) inv.setItem(i, szara());
        List<Katalog.Fx> k = Katalog.KOLORY;
        for (int i = 0; i < k.size() && i < 27; i++) inv.setItem(i, ikonaKolor(k.get(i)));
        p.openInventory(inv);
    }

    // ---------- klik ----------

    public boolean obsluga(InventoryClickEvent e, Player p) {
        Inventory inv = e.getClickedInventory();
        if (inv == null) return false;
        String widok = widok(inv);
        if (widok == null) return false;
        e.setCancelled(true);
        if (inv != e.getView().getTopInventory()) return true;
        int slot = e.getRawSlot();
        obslugajSlot(p, inv, widok, slot);
        return true;
    }

    private void podglad(Player p, Katalog.Fx f) {
        Silnik.tytul(p, f.spust() + f.nazwa.toUpperCase(), "§8id " + f.id + " §7• §8hx " + f.hex);
        p.playSound(p.getLocation(), org.bukkit.Sound.ENTITY_EXPERIENCE_ORB_PICKUP, 0.8f, 1.4f);
    }

    private void obslugajSlot(Player p, Inventory inv, String widok, int slot) {
        if (widok.equals("menu")) {
            if (slot == 10) otworzFx(p, 0, false);
            else if (slot == 12) otworzKolory(p);
            else if (slot == 14) {
                boolean st = nick.przelicz(p);
                p.sendMessage("§8» §fNick animowany: §7" + (st ? "§aWŁ" : "§cWYŁ"));
                otworzMenu(p);
            }
            else if (slot == 16) otworzFx(p, 0, true);
            else if (slot == 22) {
                trolle.losowo(p);
                p.sendMessage("§8» §4TROLL! §7Wykonano losowa akcje.");
            }
            else if (slot == 30) {
                if (p.hasPermission("animacje.glos")) {
                    ogloszenia.glos("§x{fx} §8» §fAnimacje Hub §7dziala! §8(/anim glos <msg>)", p);
                } else {
                    p.sendMessage("§cBrak uprawnienia: animacje.glos");
                }
            }
            else if (slot == 4 || slot == 34) p.closeInventory();
            return;
        }

        if (widok.startsWith("fx") && slot < NA_STRONE) {
            int strona = Integer.parseInt(widok.substring(widok.lastIndexOf(':') + 1));
            int globalny = strona * NA_STRONE + slot;
            Katalog.Fx f = Katalog.ANIMOWANE.get(globalny);
            if (widok.startsWith("fxi")) {
                nazwijItem(p, f);
            } else {
                podglad(p, f);
            }
            return;
        }

        if (widok.equals("kolory") && slot < 27) {
            if (slot < Katalog.KOLORY.size()) podglad(p, Katalog.KOLORY.get(slot));
            return;
        }

        // nawigacja w stronach fx
        if (widok.startsWith("fx") || widok.startsWith("fxi")) {
            boolean item = widok.startsWith("fxi");
            int strona = Integer.parseInt(widok.substring(widok.lastIndexOf(':') + 1));
            if (slot == 45) { wylacz(inv); otworzMenu(p); }
            else if (slot == 53) otworzFx(p, strona + 1, item);
            else if (slot == 49) {
                wylacz(inv);
                p.closeInventory();
            }
        }
    }

    /** Nazwanie itemu z reki spustem FX. */
    public void nazwijItem(Player p, Katalog.Fx f) { nazwijItem(p, f, null); }

    /** Ustawia własną nazwę itemu zamiast wymuszać nazwę „item”. */
    public void nazwijItem(Player p, Katalog.Fx f, String wlasnaNazwa) {
        org.bukkit.inventory.PlayerInventory pi = p.getInventory();
        ItemStack it = pi.getItemInMainHand();
        if (it == null || it.getType() == Material.AIR) {
            p.sendMessage("§cTrzymaj item w reku.");
            return;
        }
        String stara = wlasnaNazwa != null && !wlasnaNazwa.trim().isEmpty() ? wlasnaNazwa.trim()
                : (it.getItemMeta() != null && it.getItemMeta().hasDisplayName()
                ? it.getItemMeta().getDisplayName() : "item");
        ItemMeta meta = it.getItemMeta();
        meta.setDisplayName(f.spust() + stara + "§r");
        meta.setLore(java.util.Arrays.asList(
                "§8§m----------------------------------",
                "§8Animacje 2.0 §7FX: §f" + f.id + " " + f.nazwa,
                "§8hx: §f" + f.hex,
                "§8§m----------------------------------"));
        it.setItemMeta(meta);
        p.sendMessage("§8» §fItem nazwany: §7" + f.spust() + stara + "§r");
    }

    /** Czyszczenie slotow widokow (np. po zamknieciu). */
    public void posprataj(Inventory inv) {
        wylacz(inv);
    }
}
