package pl.tymek24.animacje.v3;

import org.bukkit.Bukkit;
import org.bukkit.command.PluginCommand;
import org.bukkit.plugin.java.JavaPlugin;

/** Animacje Hub v2 — glowna klasa. */
public final class AnimacjeHubV3 extends JavaPlugin {

    private static AnimacjeHubV3 instancja;

    private Konfig konfig;
    private Rangi rangi;
    private Nick nick;
    private Trolle trolle;
    private Ogloszenia ogloszenia;
    private Hub hub;

    public static AnimacjeHubV3 instancja() { return instancja; }

    @Override
    public void onEnable() {
        instancja = this;
        konfig = Konfig.wczytaj(this);
        Katalog.wczytaj(this);
        rangi = new Rangi(konfig);
        nick = new Nick(this, konfig);
        trolle = new Trolle();
        ogloszenia = new Ogloszenia(this, konfig);
        hub = new Hub(konfig, rangi, nick, trolle, ogloszenia);

        Bukkit.getPluginManager().registerEvents(new Wydarzenia(this), this);

        Polecenia polecenia = new Polecenia(this);
        PluginCommand anim = getCommand("anim");
        if (anim != null) {
            anim.setExecutor(polecenia);
            anim.setTabCompleter(polecenia);
        }
        PluginCommand animacje = getCommand("animacje");
        if (animacje != null) {
            animacje.setExecutor(polecenia);
            animacje.setTabCompleter(polecenia);
        }

        ogloszenia.start();
        getLogger().info("Animacje Hub v2.0.0 wloczony: "
                + Katalog.iloscAnimowanych() + " FX + " + Katalog.iloscKolorow() + " kolorow"
                + (rangi.luckPerms() ? " | LuckPerms OK" : ""));
    }

    @Override
    public void onDisable() {
        Bukkit.getScheduler().cancelTasks(this);
        instancja = null;
    }

    public void odswiez() {
        konfig.odswiez();
        Katalog.ODSWIEZ();
        Katalog.wczytaj(this);
        ogloszenia.start();
    }

    public Konfig konfig() { return konfig; }
    public Rangi rangi() { return rangi; }
    public Nick nick() { return nick; }
    public Trolle trolle() { return trolle; }
    public Ogloszenia ogloszenia() { return ogloszenia; }
    public Hub hub() { return hub; }
    public JavaPlugin plugin() { return this; }
}
