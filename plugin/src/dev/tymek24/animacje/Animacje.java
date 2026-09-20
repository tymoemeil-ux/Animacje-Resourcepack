package dev.tymek24.animacje;

import org.bukkit.Bukkit;
import org.bukkit.command.PluginCommand;
import org.bukkit.plugin.java.JavaPlugin;

/** Główna klasa AnimacjeHub v2 — mały, przewidywalny plugin dla packa 3.0. */
public final class Animacje extends JavaPlugin {
    private static Animacje instance;
    private Konfig config;
    private ProfileStore profiles;
    private Rangi ranks;
    private Tytuly titles;
    private Trolle trolls;
    private Itemy items;
    private Menu menu;
    private Polecenia commands;
    private Ogloszenia announcements;
    private ResourcePack resourcePack;

    public static Animacje get() {
        return instance;
    }

    @Override
    public void onEnable() {
        instance = this;
        config = new Konfig(this);
        Katalog.load(this);
        profiles = new ProfileStore(this, config);
        ranks = new Rangi(config);
        titles = new Tytuly(config);
        trolls = new Trolle(this);
        items = new Itemy(config);
        menu = new Menu(this);
        announcements = new Ogloszenia(this, config);
        resourcePack = new ResourcePack(config);
        commands = new Polecenia(this);

        Bukkit.getPluginManager().registerEvents(new Wydarzenia(this), this);
        PluginCommand command = getCommand("anim");
        if (command != null) {
            command.setExecutor(commands);
            command.setTabCompleter(commands);
        }
        announcements.start();
        getLogger().info("AnimacjeHub v2.0.0 uruchomiony: Animacje 3.0 / " + Katalog.count() + " efektów"
                + (ranks.luckPerms() ? " / LuckPerms" : " / fallback permissionów"));
    }

    @Override
    public void onDisable() {
        if (Bukkit.getScheduler() != null) Bukkit.getScheduler().cancelTasks(this);
        instance = null;
    }

    public void reloadPlugin() {
        if (Bukkit.getScheduler() != null) Bukkit.getScheduler().cancelTasks(this);
        config.reload();
        Katalog.load(this);
        profiles.reload();
        announcements.start();
    }

    public Konfig config() { return config; }
    public ProfileStore profiles() { return profiles; }
    public Rangi rangi() { return ranks; }
    public Tytuly titles() { return titles; }
    public Trolle trolls() { return trolls; }
    public Itemy items() { return items; }
    public Menu menu() { return menu; }
    public Polecenia commands() { return commands; }
    public Ogloszenia announcements() { return announcements; }
    public ResourcePack resourcePack() { return resourcePack; }
}
