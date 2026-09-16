package pl.animacje.animacjehub;

import java.util.Arrays;
import java.util.List;

import org.bukkit.Bukkit;
import org.bukkit.Sound;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.InventoryHolder;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.Material;

public final class Gui implements Listener {
    public enum Tab { GLOWNA, OGLOSZENIA, NICK, ITEMKI, TROLLE, RANGI, FX, OPCJE }

    public static final class Holder implements InventoryHolder {
        public final Player gracze;
        public final Tab tab;
        public final int strona;
        public Inventory inv;
        public Holder(Player gracze, Tab tab, int strona) {
            this.gracze = gracze;
            this.tab = tab;
            this.strona = strona;
        }
        public Inventory getInventory() {
            return inv;
        }
    }

    private final AnimacjeHub hub;
    private static final int NA_STRONE = 46;

    public Gui(AnimacjeHub hub) {
        this.hub = hub;
    }

    public void otworz(Player p, Tab tab) {
        otworz(p, tab, 0);
    }

    public void otworz(Player p, final Tab tab, int strona) {
        Inventory inv = Bukkit.createInventory(new Holder(p, tab, strona), 54, tytul(tab));
        Holder h = (Holder) inv.getHolder();
        inv.clear();
        switch (tab) {
            case GLOWNA: glowna(inv); break;
            case OGLOSZENIA: ogloszenia(inv, p); break;
            case NICK: nick(inv, p); break;
            case ITEMKI: itemki(inv, p); break;
            case TROLLE: trolle(inv, p); break;
            case RANGI: rangi(inv, p); break;
            case FX: fx(inv, p, strona); break;
            case OPCJE: opcje(inv, p); break;
        }
        h.inv = inv;
        p.openInventory(inv);
        dzwiek(p, Sound.UI_BUTTON_CLICK, 1.0f);
    }

    private static String tytul(Tab t) {
        if (t == Tab.GLOWNA) return "\u00A78Animacje \u00A7bHub";
        if (t == Tab.OGLOSZENIA) return "\u00A78Og\u0142oszenia";
        if (t == Tab.NICK) return "\u00A78Animowany nick";
        if (t == Tab.ITEMKI) return "\u00A78Itemki";
        if (t == Tab.TROLLE) return "\u00A78Trolle";
        if (t == Tab.RANGI) return "\u00A78Rangi i kolory";
        if (t == Tab.FX) return "\u00A78Wybierz FX (1/" + FxKatalog.ANIMOWANE.size() + ")";
        return "\u00A78Opcje";
    }

    private void glowna(Inventory inv) {
        set(inv, 10, ikona(Material.BOOK, "\u00A7bOg\u0142oszenia",
            "\u00A77Broadcasty co N sekund,",
            "\u00A77wybierz FX, teksty.", "\u00A7eKliknij!"));
        set(inv, 12, ikona(Material.NETHER_STAR, "\u00A7dAnimowany nick",
            "\u00A77Zmie\u0144 sw\u00F3j nick na animowany", "\u00A7eKliknij!"));
        set(inv, 14, ikona(Material.BONE, "\u00A7aItemki",
            "\u00A77Nazywaj itemy w rece", "\u00A77ze animowanym kolorem.", "\u00A7eKliknij!"));
        set(inv, 16, ikona(Material.PAPER, "\u00A7cTrolle",
            "\u00A77Trolluj czat, gracza,", "\u00A77serwer - gotowe frazy.", "\u00A7eKliknij!"));
        set(inv, 18, ikona(Material.GOLD_INGOT, "\u00A76Rangi",
            "\u00A77Podglad koloru pisma", "\u00A77per ranga (LuckPerms).", "\u00A7eKliknij!"));
        set(inv, 31, ikona(Material.DIAMOND, "\u00A7fWYBIERZ FX",
            "\u00A77" + FxKatalog.ANIMOWANE.size() + " efektow w pakiecie.",
            "\u00A77Tu ustawisz FX do wszystkiego.", "\u00A7eKliknij!"));
        set(inv, 39, ikona(Material.GLOWSTONE_DUST, "\u00A7eOpcje",
            "\u00A77Dzwieki, debug, reload.", "\u00A7eKliknij!"));
        set(inv, 49, ikona(Material.BARRIER, "\u00A7cZamknij", ""));
    }

    private void ogloszenia(Inventory inv, Player p) {
        boolean admin = p.hasPermission("animacjehub.admin");
        if (Akcje.ogloszeniaAktywne()) {
            set(inv, 10, ikona(Material.REDSTONE, "\u00A7cSTOPUJ ogloszenia",
                "\u00A77Aktualnie: co " + Akcje.ogloszenieOdstep + "s, fx: " + Akcje.ogloszenieFx,
                "\u00A77tekst: " + skr(Akcje.ogloszenieTekst), "\u00A7eKliknij aby stop!"));
        } else {
            set(inv, 10, ikona(Material.REDSTONE, "\u00A7aURUCHOM ogloszenia",
                "\u00A77Wymaga: animacjehub.admin",
                "\u00A77Obecnie: co " + Akcje.ogloszenieOdstep + "s, fx: " + Akcje.ogloszenieFx,
                "\u00A77tekst: " + skr(Akcje.ogloszenieTekst), "\u00A7eKliknij!"));
        }
        set(inv, 12, ikona(Material.PAPER, "\u00A7bZmie\u0144 tekst",
            "\u00A77Wpiszesz w czacie.",
            admin ? "\u00A7eKliknij!" : "\u00A7cBrak praw!"));
        set(inv, 14, ikona(Material.ARROW, "\u00A7bOdstep -10s",
            "\u00A77Obecnie: " + Akcje.ogloszenieOdstep + "s"));
        set(inv, 16, ikona(Material.ARROW, "\u00A7bOdstep +10s",
            "\u00A77Obecnie: " + Akcje.ogloszenieOdstep + "s"));
        set(inv, 19, ikona(Material.DIAMOND, "\u00A7fFX: " + Akcje.ogloszenieFx,
            "\u00A77Wybierz efekt dla ogloszen.", "\u00A7eKliknij!"));
        set(inv, 49, powrot());
    }

    private void nick(Inventory inv, Player p) {
        PlayerData d = hub.dane(p);
        set(inv, 10, ikona(Material.PAPER, "\u00A7bUstaw nick",
            "\u00A77Wpiszesz nowa nazwe w czacie.", "\u00A7eKliknij!"));
        set(inv, 12, ikona(Material.BARRIER, "\u00A7cUsu\u0144 nick",
            "\u00A77Wraca zwykly nick.", "\u00A7eKliknij!"));
        FxKatalog.Fx fx = FxKatalog.nazwa(d.nickFx);
        String podglad = d.maNick() ? (fx != null ? fx.spust() : "") + d.nick + "\u00A7r" : "\u00A78(brak nicku)";
        set(inv, 14, ikona(Material.NETHER_STAR, "\u00A7bPodglad",
            "\u00A77Tak wyglada w czacie:", podglad));
        set(inv, 19, ikona(Material.DIAMOND, "\u00A7fFX: " + (fx != null ? fx.nazwa : "?"),
            "\u00A77Wybierz efekt nicku.", "\u00A7eKliknij!"));
        set(inv, 49, powrot());
    }

    private void itemki(Inventory inv, Player p) {
        set(inv, 10, ikona(Material.PAPER, "\u00A7bNazwij item",
            "\u00A77Wez item w reke, potem", "\u00A77wpisz nazwe w czacie.", "\u00A7eKliknij!"));
        set(inv, 12, ikona(Material.DIAMOND, "\u00A7bNazwij + LOSOWY FX",
            "\u00A77Item dostanie losowy efekt.", "\u00A7eKliknij!"));
        set(inv, 14, ikona(Material.BARRIER, "\u00A7cUsu\u0144 nazwe",
            "\u00A77Czysci nazwe i lore itemu", "\u00A77w rece.", "\u00A7eKliknij!"));
        PlayerData d = hub.dane(p);
        FxKatalog.Fx fx = FxKatalog.nazwa(d.itemFx);
        set(inv, 19, ikona(Material.DIAMOND, "\u00A7fFX: " + (fx != null ? fx.nazwa : "losowy"),
            "\u00A77Domyslny efekt itemkow.", "\u00A7eKliknij!"));
        set(inv, 49, powrot());
    }

    private void trolle(Inventory inv, Player p) {
        set(inv, 10, ikona(Material.PAPER, "\u00A7cTroll czatu",
            "\u00A77Wpisz swoja fraze w czacie.", "\u00A7eKliknij!"));
        set(inv, 12, ikona(Material.PAPER, "\u00A7cTroll czatu (LOSOWY)",
            "\u00A77Gotowa fraza z listy.", "\u00A7eKliknij!"));
        set(inv, 14, ikona(Material.PAPER, "\u00A7cTrolluj gracza przed soba",
            "\u00A77Osoba w promieniu 5 blokow", "\u00A77dostanie fraze w czacie.",
            "\u00A77Wpiszesz swoja fraze.", "\u00A7eKliknij!"));
        set(inv, 16, ikona(Material.PAPER, "\u00A7cTrolluj gracza (LOSOWY)",
            "\u00A77Losowa fraza -> najblizszy gracz.", "\u00A7eKliknij!"));
        set(inv, 19, ikona(Material.PAPER, "\u00A74Troll SERWERA",
            "\u00A77Broadcast jako SERWER.",
            p.hasPermission("animacjehub.admin") ? "\u00A7eKliknij!" : "\u00A7cBrak praw!"));
        PlayerData d = hub.dane(p);
        FxKatalog.Fx fx = FxKatalog.nazwa(d.trollFx);
        set(inv, 29, ikona(Material.DIAMOND, "\u00A7fFX: " + (fx != null ? fx.nazwa : "losowy"),
            "\u00A77Efekt trollowania.", "\u00A7eKliknij!"));
        set(inv, 49, powrot());
    }

    private void rangi(Inventory inv, Player p) {
        int slot = 10;
        boolean jest = false;
        for (String ranga : hub.cfg.getStringList("rangi.kolejnosc")) {
            String hex = RankEngine.hexDlaRangi(ranga);
            if (hex == null) continue;
            FxKatalog.Fx fx = RankEngine.kolorDlaRangi(ranga);
            String kolor = fx != null ? fx.spust() : "";
            set(inv, slot, ikona(Material.GOLD_INGOT, kolor + "\u00A7rRANGA: " + ranga,
                "\u00A77Kolor z konfiga: \u00A7f" + hex,
                fx != null ? ("\u00A77Stosowany FX: \u00A7f" + fx.nazwa + " (" + fx.hex + ")") : "\u00A77Czysty kolor",
                "\u00A78Zrodlo rang: \u00A7f" + RankEngine.zrodlo()));
            slot += 2;
            jest = true;
            if (slot > 47) break;
        }
        if (!jest) {
            set(inv, 10, ikona(Material.GOLD_INGOT, "\u00A7cBrak rang w config",
                "\u00A77Dodaj w config.yml:",
                "\u00A77rangi.kolory: {admin: \"#FF5555\"}", "\u00A77rangi.kolejnosc: [admin, ...]"));
        }
        PlayerData d = hub.dane(p);
        String moja = RankEngine.ranga(p);
        FxKatalog.Fx mk = RankEngine.kolorDlaRangi(moja);
        set(inv, 49, ikona(Material.GOLD_INGOT, "\u00A76Twoja ranga: " + (moja.length() > 0 ? moja : "?"),
            mk != null ? (mk.spust() + "\u00A7rTak piszesz w czacie!") : "\u00A77Bez koloru rangi"));
    }

    private void fx(Inventory inv, final Player p, final int strona) {
        int start = strona * NA_STRONE;
        for (int i = 0; i < NA_STRONE; i++) {
            int idx = start + i;
            if (idx >= FxKatalog.ANIMOWANE.size()) break;
            final FxKatalog.Fx f = FxKatalog.ANIMOWANE.get(idx);
            set(inv, i, ikona(Material.PINK_STAINED_GLASS_PANE, f.spust() + f.nazwa,
                "\u00A77Rodzina: \u00A7f" + f.rodzina,
                "\u00A77Hex: \u00A7f" + f.hex + "  ID: \u00A7f" + f.id,
                "\u00A7eKliknij = wybierz!"));
        }
        int maxStron = (FxKatalog.ANIMOWANE.size() - 1) / NA_STRONE;
        set(inv, 48, ikona(Material.BONE, "\u00A7fLOSOWY FX",
            "\u00A77Wylosuj efekt i ustaw go.", "\u00A7eKliknij!"));
        set(inv, 49, ikona(Material.ARROW, "\u00A7bPowrot", ""));
        if (strona > 0) set(inv, 50, ikona(Material.ARROW, "\u00A7bPoprzednia strona", "\u00A77Strona " + strona + "/" + maxStron));
        if (strona < maxStron) set(inv, 52, ikona(Material.ARROW, "\u00A7bNastepna strona", "\u00A77Strona " + strona + "/" + maxStron));
    }

    private void opcje(Inventory inv, Player p) {
        PlayerData d = hub.dane(p);
        set(inv, 10, ikona(d.dzwieki ? Material.HOPPER : Material.BARRIER,
            d.dzwieki ? "\u00A7aDzwieki: TAK" : "\u00A7cDzwieki: NIE",
            "\u00A77Dzwieki GUI i akcji.", "\u00A7eKliknij = zmien!"));
        set(inv, 14, ikona(Material.GOLD_INGOT, "\u00A76Twoja ranga: " + RankEngine.ranga(p),
            "\u00A77Zrodlo: \u00A7f" + RankEngine.zrodlo(),
            "\u00A77Kolory: \u00A7f" + hub.cfg.getStringList("rangi.kolejnosc").size() + " rang"));
        if (p.hasPermission("animacjehub.admin")) {
            set(inv, 22, ikona(Material.NETHER_STAR, "\u00A7dRELOAD konfiga",
                "\u00A77Przeładuje config.yml.", "\u00A7eKliknij!"));
        }
        set(inv, 40, ikona(Material.PAPER, "\u00A77Animacje 2.0 + Hub",
            "\u00A77FX w packu: \u00A7f" + FxKatalog.ANIMOWANE.size(),
            "\u00A77Pack: \u00A7fAnimacje2.0.zip",
            "\u00A77Komenda: \u00A7f/anim"));
        set(inv, 49, powrot());
    }

    private ItemStack powrot() {
        return ikona(Material.ARROW, "\u00A7bG\u0142owne menu", "");
    }

    private void set(Inventory inv, int slot, ItemStack item) {
        if (item != null) inv.setItem(slot, item);
    }

    private static String skr(String s) {
        if (s == null) return "";
        if (s.length() > 30) return s.substring(0, 30) + "...";
        return s.length() == 0 ? "(brak)" : s;
    }

    private static ItemStack ikona(Material m, String tytul, String... lore) {
        ItemStack it = new ItemStack(m);
        it.setDisplayName(tytul);
        it.setLore(Arrays.asList(lore));
        return it;
    }

    private void dzwiek(Player p, Sound s, float pitch) {
        PlayerData d = hub.dane(p);
        if (d.dzwieki) p.playSound(p.getLocation(), s, 0.7f, pitch);
    }

    @EventHandler
    public void onClick(InventoryClickEvent e) {
        if (!(e.getWhoClicked() instanceof Player)) return;
        Inventory clicked = e.getClickedInventory();
        if (clicked == null) return;
        Holder h = (clicked.getHolder() instanceof Holder) ? (Holder) clicked.getHolder() : null;
        if (h == null) return;
        e.setCancelled(true);
        final Player p = (Player) e.getWhoClicked();
        final int slot = e.getRawSlot();
        final FxKatalog.Fx wybrany = fxNaSlotu(h, slot);
        dzwiek(p, Sound.UI_BUTTON_CLICK, 1.1f);

        if (slot == 49) {
            p.closeInventory();
            if (h.tab != Tab.GLOWNA) {
                otworz(p, Tab.GLOWNA);
            }
            return;
        }
        if (h.tab == Tab.FX) {
            if (wybrany != null) {
                ustawFx(p, wybrany, h);
                return;
            }
            if (slot == 48) {
                java.util.Random r = new java.util.Random();
                FxKatalog.Fx f = FxKatalog.ANIMOWANE.get(r.nextInt(FxKatalog.ANIMOWANE.size()));
                ustawFx(p, f, h);
                return;
            }
            int maxStron = (FxKatalog.ANIMOWANE.size() - 1) / NA_STRONE;
            if (slot == 50 && h.strona > 0) { otworz(p, Tab.FX, h.strona - 1); return; }
            if (slot == 52 && h.strona < maxStron) { otworz(p, Tab.FX, h.strona + 1); return; }
            return;
        }
        switch (h.tab) {
            case GLOWNA:
                if (slot == 10) otworz(p, Tab.OGLOSZENIA);
                else if (slot == 12) otworz(p, Tab.NICK);
                else if (slot == 14) otworz(p, Tab.ITEMKI);
                else if (slot == 16) otworz(p, Tab.TROLLE);
                else if (slot == 18) otworz(p, Tab.RANGI);
                else if (slot == 31) otworz(p, Tab.FX, 0);
                else if (slot == 39) otworz(p, Tab.OPCJE);
                else if (slot == 49) p.closeInventory();
                break;
            case OGLOSZENIA:
                if (slot == 10) {
                    if (!p.hasPermission("animacjehub.admin")) { p.sendMessage("\u00A7c> Brak praw: animacjehub.admin"); break; }
                    if (Akcje.ogloszeniaAktywne()) {
                        Akcje.ogloszeniaStop();
                        p.sendMessage("\u00A7a> Ogloszenia wyłaczone.");
                    } else {
                        Akcje.ogloszeniaStart(hub, false);
                        p.sendMessage("\u00A7a> Ogloszenia wlaczone (co " + Akcje.ogloszenieOdstep + "s).");
                    }
                } else if (slot == 12) {
                    if (!p.hasPermission("animacjehub.admin")) { p.sendMessage("\u00A7c> Brak praw: animacjehub.admin"); break; }
                    hub.prompt(p, "Wpisz TEKST ogloszenia w czacie (OFF = anuluj):", new Prompt(new Prompt.Akcja() {
                        public void wykonaj(String w) {
                            Akcje.ogloszenieTekst = w;
                            p.sendMessage("\u00A7a> Tekst ogloszenia: " + w);
                            if (!Akcje.ogloszeniaAktywne()) p.sendMessage("\u00A77Uruchom ogloszenia w menu.");
                        }
                    }));
                } else if (slot == 14) {
                    Akcje.ogloszenieOdstep = Math.max(10, Akcje.ogloszenieOdstep - 10);
                    p.sendMessage("\u00A7a> Odstep ogloszen: " + Akcje.ogloszenieOdstep + "s");
                } else if (slot == 16) {
                    Akcje.ogloszenieOdstep = Akcje.ogloszenieOdstep + 10;
                    p.sendMessage("\u00A7a> Odstep ogloszen: " + Akcje.ogloszenieOdstep + "s");
                } else if (slot == 19) {
                    otworz(p, Tab.FX, 0);
                }
                break;
            case NICK:
                if (slot == 10) {
                    if (!p.hasPermission("animacjehub.nick")) { p.sendMessage("\u00A7c> Brak praw: animacjehub.nick"); break; }
                    hub.prompt(p, "Wpisz NOWY NICK w czacie (OFF = anuluj):", new Prompt(new Prompt.Akcja() {
                        public void wykonaj(String w) {
                            Akcje.setNick(hub, p, w, null);
                        }
                    }));
                } else if (slot == 12) {
                    Akcje.clearNick(hub, p);
                } else if (slot == 14) {
                    PlayerData d = hub.dane(p);
                    FxKatalog.Fx fx = FxKatalog.nazwa(d.nickFx);
                    p.sendMessage("\u00A77Twoj nick wyglada tak: " + (fx != null ? fx.spust() : "") + d.nick + "\u00A7r");
                } else if (slot == 19) {
                    otworz(p, Tab.FX, 0);
                }
                break;
            case ITEMKI:
                if (slot == 10) {
                    if (!p.hasPermission("animacjehub.item")) { p.sendMessage("\u00A7c> Brak praw: animacjehub.item"); break; }
                    hub.prompt(p, "Wpisz NAZWE itema w czacie (OFF = anuluj):", new Prompt(new Prompt.Akcja() {
                        public void wykonaj(String w) {
                            Akcje.nazwijItem(hub, p, w, false);
                        }
                    }));
                } else if (slot == 12) {
                    if (!p.hasPermission("animacjehub.item")) { p.sendMessage("\u00A7c> Brak praw: animacjehub.item"); break; }
                    hub.prompt(p, "Wpisz NAZWE itema (losowy FX!) w czacie (OFF = anuluj):", new Prompt(new Prompt.Akcja() {
                        public void wykonaj(String w) {
                            Akcje.nazwijItem(hub, p, w, true);
                        }
                    }));
                } else if (slot == 14) {
                    Akcje.usunNazweItema(hub, p);
                } else if (slot == 19) {
                    otworz(p, Tab.FX, 0);
                }
                break;
            case TROLLE:
                if (slot == 10) {
                    if (!p.hasPermission("animacjehub.troll")) { p.sendMessage("\u00A7c> Brak praw: animacjehub.troll"); break; }
                    if (hub.cooldownTroll(p)) break;
                    hub.prompt(p, "Wpisz TROLLA do czatu (OFF = anuluj):", new Prompt(new Prompt.Akcja() {
                        public void wykonaj(String w) {
                            Akcje.trollCzat(hub, p, w, false);
                            hub.trollCooldown(p);
                        }
                    }));
                } else if (slot == 12) {
                    if (!p.hasPermission("animacjehub.troll")) { p.sendMessage("\u00A7c> Brak praw: animacjehub.troll"); break; }
                    if (hub.cooldownTroll(p)) break;
                    Akcje.trollCzat(hub, p, Akcje.losowyTroll(), false);
                    hub.trollCooldown(p);
                } else if (slot == 14) {
                    if (!p.hasPermission("animacjehub.troll")) { p.sendMessage("\u00A7c> Brak praw: animacjehub.troll"); break; }
                    if (hub.cooldownTroll(p)) break;
                    final Player cel = Akcje.celBlizszy(p);
                    if (cel == null) { p.sendMessage("\u00A7c> Nikt w promieniu 5 blokow."); break; }
                    hub.prompt(p, "Wpisz TROLLA dla " + cel.getName() + " (OFF = anuluj):", new Prompt(new Prompt.Akcja() {
                        public void wykonaj(String w) {
                            if (cel.isOnline()) {
                                Akcje.trollGracza(hub, p, cel, w);
                                hub.trollCooldown(p);
                            }
                        }
                    }));
                } else if (slot == 16) {
                    if (!p.hasPermission("animacjehub.troll")) { p.sendMessage("\u00A7c> Brak praw: animacjehub.troll"); break; }
                    if (hub.cooldownTroll(p)) break;
                    Player cel = Akcje.celBlizszy(p);
                    if (cel == null) { p.sendMessage("\u00A7c> Nikt w promieniu 5 blokow."); break; }
                    Akcje.trollGracza(hub, p, cel, Akcje.losowyTroll());
                    hub.trollCooldown(p);
                } else if (slot == 19) {
                    if (!p.hasPermission("animacjehub.admin")) { p.sendMessage("\u00A7c> Brak praw: animacjehub.admin"); break; }
                    if (hub.cooldownTroll(p)) break;
                    hub.prompt(p, "Wpisz TROLLA SERWERA (OFF = anuluj):", new Prompt(new Prompt.Akcja() {
                        public void wykonaj(String w) {
                            Akcje.trollCzat(hub, p, w, true);
                            hub.trollCooldown(p);
                        }
                    }));
                } else if (slot == 29) {
                    otworz(p, Tab.FX, 0);
                }
                break;
            case RANGI:
                break;
            case OPCJE:
                if (slot == 10) {
                    PlayerData d = hub.dane(p);
                    d.dzwieki = !d.dzwieki;
                    hub.zapisz(p);
                    p.sendMessage("\u00A7a> Dzwieki: " + (d.dzwieki ? "TAK" : "NIE"));
                } else if (slot == 22 && p.hasPermission("animacjehub.admin")) {
                    hub.pelnyReload();
                }
                break;
        }
        if (slot < 45 && h.tab != Tab.FX && wybrany == null) {
            // puste sloty nic nie robia
        }
    }

    private FxKatalog.Fx fxNaSlotu(Holder h, int slot) {
        if (h.tab != Tab.FX || slot >= NA_STRONE) return null;
        int idx = h.strona * NA_STRONE + slot;
        if (idx >= FxKatalog.ANIMOWANE.size()) return null;
        return FxKatalog.ANIMOWANE.get(idx);
    }

    private void ustawFx(Player p, FxKatalog.Fx f, Holder h) {
        PlayerData d = hub.dane(p);
        // kontekst: ostatnia otwarta karta przed FX; dla prosci ustawiamy wszedzie
        d.nickFx = f.nazwa;
        d.itemFx = f.nazwa;
        d.trollFx = f.nazwa;
        Akcje.ogloszenieFx = f.nazwa;
        hub.zapisz(p);
        p.sendMessage("\u00A7a> FX ustawiony wszedzie: " + f.spust() + "\u00A7r" + f.nazwa + " \u00A78(" + f.hex + ", ID " + f.id + ")");
        otworz(p, Tab.GLOWNA);
    }
}
