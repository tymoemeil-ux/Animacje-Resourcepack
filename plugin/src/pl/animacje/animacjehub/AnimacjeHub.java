package pl.animacje.animacjehub;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.bukkit.Bukkit;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.entity.Player;
import org.bukkit.plugin.java.JavaPlugin;

public final class AnimacjeHub extends JavaPlugin {
    public static AnimacjeHub instance;
    public FileConfiguration cfg;

    private final Map<UUID, PlayerData> daneMap = new HashMap<UUID, PlayerData>();
    private final Map<UUID, Prompt> prompty = new HashMap<UUID, Prompt>();
    private final Map<UUID, Long> cooldowny = new HashMap<UUID, Long>();
    private Gui gui;
    private GuiViews views;

    @Override
    public void onEnable() {
        instance = this;
        saveDefaultConfig();
        cfg = getConfig();
        FxKatalog.wczytaj();
        RankEngine.init(cfg);
        views = new GuiViews(this);
        gui = new Gui(views);
        Api.init(this);
        Api.registerEvents(gui, this);
        Api.registerEvents(new ChatHook(this), this);
        Object c = Api.getCommand(this, "anim");
        Api.commandSet(c, this, this);
        if (cfg.getBoolean("ogloszenia.wlacz", false)) {
            Akcje.ogloszeniaStart(this, true);
        }
        logInfo("Zaladowano: " + FxKatalog.ANIMOWANE.size() + " FX + " + FxKatalog.KOLORY.size()
                + " kolorow | rangi z: " + RankEngine.zrodlo()
                + " | ogloszenia: " + (Akcje.ogloszeniaAktywne() ? "TAK" : "NIE"));
    }

    @Override
    public void onDisable() {
        Akcje.ogloszeniaStop();
        for (Player p : Bukkit.getOnlinePlayers()) {
            PlayerData d = daneMap.get(p.getUniqueId());
            if (d != null) d.zapisz(PlayerData.plik(p.getUniqueId()));
        }
        Api.cancelTasks(this);
    }

    public void logInfo(String s) {
        getLogger().info("[AnimacjeHub] " + s);
    }

    public PlayerData dane(Player p) {
        PlayerData d = daneMap.get(p.getUniqueId());
        if (d == null) {
            d = PlayerData.wczytaj(PlayerData.plik(p.getUniqueId()));
            daneMap.put(p.getUniqueId(), d);
        }
        return d;
    }

    public void zapisz(Player p) {
        PlayerData d = daneMap.get(p.getUniqueId());
        if (d != null) d.zapisz(PlayerData.plik(p.getUniqueId()));
    }

    public Prompt prompt(Player p) {
        return prompty.get(p.getUniqueId());
    }

    public void wyczyscPrompt(Player p) {
        prompty.remove(p.getUniqueId());
    }

    public void prompt(Player p, String wiadomosc, Prompt pr) {
        prompty.put(p.getUniqueId(), pr);
        p.sendMessage("\u00A78[Animacje] \u00A77" + wiadomosc);
    }

    public boolean cooldownTroll(Player p) {
        int s = cfg.getInt("trolle.cooldown_s", 15);
        Long ostatni = cooldowny.get(p.getUniqueId());
        long teraz = System.currentTimeMillis();
        if (ostatni != null && teraz - ostatni < s * 1000L) {
            long za = (s * 1000L - (teraz - ostatni)) / 1000L + 1;
            p.sendMessage("\u00A7c> Cooldown trolla: " + za + "s");
            return true;
        }
        return false;
    }

    public void trollCooldown(Player p) {
        cooldowny.put(p.getUniqueId(), System.currentTimeMillis());
    }

    public void pelnyReload() {
        reloadConfig();
        cfg = getConfig();
        RankEngine.init(cfg);
        boolean byle = Akcje.ogloszeniaAktywne();
        Akcje.ogloszeniaStop();
        if (cfg.getBoolean("ogloszenia.wlacz", false)) Akcje.ogloszeniaStart(this, true);
        if (!cfg.getBoolean("ogloszenia.wlacz", false) && byle) {
            // zostaje wyłączone
        }
        for (Player p : Bukkit.getOnlinePlayers()) {
            p.sendMessage("\u00A7a> AnimacjeHub: konfiguracja przeładowana.");
        }
        logInfo("Reload zakończony (ogloszenia: " + (Akcje.ogloszeniaAktywne() ? "TAK" : "NIE") + ")");
    }

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        try {
            if (!(sender instanceof Player)) {
            sender.sendMessage("AnimacjeHub dziala tylko z gry (/anim).");
            return true;
        }
        Player p = (Player) sender;
        if (args.length == 0) {
            if (!p.hasPermission("animacjehub.use")) { p.sendMessage("\u00A7c> Brak praw."); return true; }
            views.otworz(p, GuiViews.Tab.GLOWNA);
            return true;
        }
        String a = args[0].toLowerCase();
        if (a.equals("gui")) {
            views.otworz(p, GuiViews.Tab.GLOWNA);
        } else if (a.equals("reload")) {
            if (!p.hasPermission("animacjehub.admin")) { p.sendMessage("\u00A7c> Brak praw."); return true; }
            pelnyReload();
        } else if (a.equals("nick")) {
            if (!p.hasPermission("animacjehub.nick")) { p.sendMessage("\u00A7c> Brak praw."); return true; }
            if (args.length < 2 || args[1].equalsIgnoreCase("off")) {
                Akcje.clearNick(this, p);
            } else {
                StringBuilder sb = new StringBuilder();
                for (int i = 1; i < args.length; i++) sb.append(i > 1 ? " " : "").append(args[i]);
                Akcje.setNick(this, p, sb.toString(), null);
            }
        } else if (a.equals("item")) {
            if (!p.hasPermission("animacjehub.item")) { p.sendMessage("\u00A7c> Brak praw."); return true; }
            if (args.length < 2) { p.sendMessage("\u00A7c> /anim item <nazwa>"); return true; }
            StringBuilder sb = new StringBuilder();
            for (int i = 1; i < args.length; i++) sb.append(i > 1 ? " " : "").append(args[i]);
            Akcje.nazwijItem(this, p, sb.toString(), false);
        } else if (a.equals("troll")) {
            if (!p.hasPermission("animacjehub.troll")) { p.sendMessage("\u00A7c> Brak praw."); return true; }
            if (cooldownTroll(p)) return true;
            String tekst = args.length > 1 ? scal(args, 1) : Akcje.losowyTroll();
            Akcje.trollCzat(this, p, tekst, false);
            trollCooldown(p);
        } else if (a.equals("fx")) {
            if (args.length < 2) { p.sendMessage("\u00A7c> /anim fx <nazwa>  (lista: /anim list)"); return true; }
            FxKatalog.Fx fx = FxKatalog.nazwa(args[1]);
            if (fx == null) { p.sendMessage("\u00A7c> Nieznany fx: " + args[1]); return true; }
            PlayerData d = dane(p);
            d.nickFx = fx.nazwa;
            d.itemFx = fx.nazwa;
            d.trollFx = fx.nazwa;
            Akcje.ogloszenieFx = fx.nazwa;
            zapisz(p);
            p.sendMessage("\u00A7a> FX wszedzie: " + fx.spust() + "\u00A7r" + fx.nazwa);
        } else if (a.equals("list")) {
            int n = FxKatalog.ANIMOWANE.size();
            p.sendMessage("\u00A78[Animacje] \u00A7f" + n + " FX\u00A7r w pakiecie. Przyklady:");
            for (int i = 0; i < 8 && i < n; i++) {
                FxKatalog.Fx f = FxKatalog.ANIMOWANE.get(i * (n / 8));
                p.sendMessage("  " + f.spust() + f.nazwa + "\u00A7r \u00A78(" + f.rodzina + ")");
            }
            p.sendMessage("\u00A77Wybierz: \u00A7f/anim \u00A77(menu FX)");
        } else {
            p.sendMessage("\u00A78[Animacje] \u00A7f/anim \u00A78- menu | \u00A7f/anim nick <tx> \u00A78- nick | \u00A7f/anim item <tx> \u00A78- item | \u00A7f/anim troll <tx>");
            }
            return true;
        } catch (Throwable t) {
            t.printStackTrace();
            if (sender instanceof Player) {
                try {
                    ((Player) sender).sendMessage("\u00A7c> AnimacjeHub: b" + "l" + "ad: " + t.getClass().getSimpleName() + (t.getMessage() == null ? "" : " - " + t.getMessage()));
                    ((Player) sender).sendMessage("\u00A77W plugins/ musi byc DOKLADNIE JEDEN jar AnimacjeHub (usun stare pobrania, np. z (1), (2)).");
                } catch (Throwable ignored) {}
            }
            return true;
        }
    }

    private static String scal(String[] args, int od) {
        StringBuilder sb = new StringBuilder();
        for (int i = od; i < args.length; i++) sb.append(i > od ? " " : "").append(args[i]);
        return sb.toString();
    }

    @Override
    public List<String> onTabComplete(CommandSender sender, Command command, String alias, String[] args) {
        List<String> w = new ArrayList<String>();
        if (args.length == 1) {
            String[] podst = { "gui", "nick", "item", "troll", "fx", "list", "reload" };
            for (String s : podst) if (s.startsWith(args[0].toLowerCase())) w.add(s);
        } else if (args.length == 2 && args[0].equalsIgnoreCase("fx")) {
            for (FxKatalog.Fx f : FxKatalog.ANIMOWANE) {
                if (f.nazwa.startsWith(args[1].toLowerCase()) && w.size() < 40) w.add(f.nazwa);
            }
        }
        return w;
    }
}
