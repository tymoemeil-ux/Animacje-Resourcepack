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

    private final java.util.List<String> raport = new java.util.ArrayList<String>();
    private boolean raportWyslany = false;

    @Override
    public void onEnable() {
        instance = this;
        try {
            raport.add("serwer: " + Bukkit.getName() + " | java: " + System.getProperty("java.version") + " | plugin: AnimacjeHub v1.2.5");
        } catch (Throwable t) { raport.add("serwer: blad (" + t + ")"); }
        try {
            raport.add("codeSource: " + getClass().getProtectionDomain().getCodeSource().getLocation());
        } catch (Throwable t) { raport.add("codeSource: blad (" + t + ")"); }
        try {
            raport.add("resource Material.class: " + getClass().getClassLoader().getResource("org/bukkit/inventory/Material.class"));
        } catch (Throwable t) { raport.add("resource Material: blad (" + t + ")"); }
        try {
            raport.add("resource Bukkit.class: " + getClass().getClassLoader().getResource("org/bukkit/Bukkit.class"));
        } catch (Throwable t) { raport.add("resource Bukkit: blad (" + t + ")"); }
        try {
            raport.add("resource ItemStack.class: " + getClass().getClassLoader().getResource("org/bukkit/inventory/ItemStack.class"));
        } catch (Throwable t) { raport.add("resource ItemStack: blad (" + t + ")"); }
        try {
            String cp = System.getProperty("java.class.path");
            raport.add("class.path dlugosc: " + cp.length() + " | start: " + cp.substring(0, Math.min(150, cp.length())));
        } catch (Throwable t) { raport.add("class.path: blad (" + t + ")"); }
        try {
            java.io.File lib = new java.io.File("libraries");
            if (lib.isDirectory()) {
                java.io.File[] sub = lib.listFiles();
                raport.add("libraries/: " + (sub == null ? "BRAK DOSTEPU" : sub.length) + " pozycji");
                if (sub != null) {
                    for (java.io.File f : sub) raport.add("  lib: " + f.getName());
                    java.io.File[] api = new java.io.File(lib, "io").listFiles();
                    if (api != null) for (java.io.File f : api) raport.add("  lib/io: " + f.getName());
                    java.io.File bukkitDir = new java.io.File(lib, "org/bukkit");
                    raport.add("  lib org/bukkit: " + (bukkitDir.isDirectory() ? java.util.Arrays.toString(bukkitDir.list()) : "BRAK"));
                }
            } else {
                raport.add("libraries/: BRAK KATALOGU (serwer trzymaj API w jarach w srodiskorzeniu?)");
            }
        } catch (Throwable t) { raport.add("libraries: blad (" + t + ")"); }
        try {
            java.io.File[] root = new java.io.File(".").listFiles((d, n) -> n.toLowerCase().endsWith(".jar"));
            if (root != null) for (java.io.File f : root) raport.add("root jar: " + f.getName() + " (" + f.length() + " B)");
        } catch (Throwable t) { raport.add("root jars: blad (" + t + ")"); }
        try {
            final java.util.List<java.io.File> jars = new java.util.ArrayList<java.io.File>();
            AnimacjeHub.zbierzJary(new java.io.File("libraries"), jars, 0);
            AnimacjeHub.zbierzJary(new java.io.File("."), jars, 0);
            for (java.io.File j : jars) {
                String n = j.getName().toLowerCase();
                if (n.contains("paper") || n.contains("bukkit") || n.contains("mojang") || n.contains("api")) {
                    try {
                        java.util.zip.ZipFile zf = new java.util.zip.ZipFile(j);
                        java.util.zip.ZipEntry eMat = zf.getEntry("org/bukkit/inventory/Material.class");
                        java.util.zip.ZipEntry eBuk = zf.getEntry("org/bukkit/Bukkit.class");
                        int total = 0;
                        for (java.util.Enumeration<? extends java.util.zip.ZipEntry> en = zf.entries(); en.hasMoreElements(); en.nextElement()) total++;
                        raport.add("JAR " + j.getPath() + " | entry=" + total + " | Bukkit=" + (eBuk == null ? "BRAK" : eBuk.getSize() + "B") + " | Material=" + (eMat == null ? "BRAK" : eMat.getSize() + "B"));
                        if (eMat != null) {
                            java.io.InputStream is = zf.getInputStream(eMat);
                            int odczytane = 0;
                            byte[] bufor = new byte[8192];
                            int r;
                            while ((r = is.read(bufor)) > 0) odczytane += r;
                            is.close();
                            raport.add("  odczyt Material.class z tego zipa: " + (odczytane > 4 ? "OK (" + odczytane + " B)" : "BLAD - pusty/pisarski (" + odczytane + " B)"));
                        }
                        zf.close();
                    } catch (Throwable t2) {
                        raport.add("JAR " + j.getPath() + " | otwarcie: BLAD (" + t2 + ")");
                    }
                }
            }
        } catch (Throwable t) { raport.add("skan jarow: blad (" + t + ")"); }
        try {
            Class.forName("org.bukkit.inventory.Material");
            raport.add("Material: ZNALAZI");
        } catch (Throwable t) {
            raport.add("Material: BRAK (" + t + ")");
        }
        for (String l : raport) logInfo("DIAG " + l);
        try {
            java.io.File f = new java.io.File(getDataFolder().getParentFile(), "animacjehub-diag.txt");
            java.io.PrintWriter pw = new java.io.PrintWriter(f, "UTF-8");
            for (String l : raport) pw.println(l);
            pw.close();
            raport.add("zapisano: plugins/animacjehub-diag.txt");
        } catch (Throwable t) { logError("DIAG nie moge zapisac pliku: " + t); }
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

    public void logError(String s) {
        getLogger().severe("[AnimacjeHub] " + s);
    }

    static void zbierzJary(java.io.File dir, java.util.List<java.io.File> wyj, int gleb) {
        if (dir == null || !dir.isDirectory() || gleb > 6 || wyj.size() > 300) return;
        java.io.File[] pl = dir.listFiles();
        if (pl == null) return;
        for (java.io.File f : pl) {
            if (f.isDirectory()) zbierzJary(f, wyj, gleb + 1);
            else if (f.getName().toLowerCase().endsWith(".jar")) wyj.add(f);
        }
    }

    public void wyslijRaport(Player p) {
        if (raportWyslany || raport.isEmpty()) return;
        raportWyslany = true;
        p.sendMessage("\u00A7c=== AnimacjeHub: RAPORT DIAGNOSTYCZNY (screenshot) ===");
        for (String l : raport) p.sendMessage("\u00A77" + l);
        p.sendMessage("\u00A7c=== koniec - wklej ten tekst do rozmowy z agentem ===");
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
