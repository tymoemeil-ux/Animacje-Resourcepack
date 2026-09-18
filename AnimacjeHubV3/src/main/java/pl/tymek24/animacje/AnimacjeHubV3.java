package pl.tymek24.animacje;

import org.bukkit.plugin.java.JavaPlugin;

/** V3 entrypoint. Cała logika V3 startuje tutaj; brak zależności od starego pluginu. */
public final class AnimacjeHubV3 extends JavaPlugin {
    private V3Service service;
    @Override public void onEnable() {
        saveDefaultConfig();
        service = new V3Service(this);
        getCommand("anim").setExecutor(new V3Command(service));
        getCommand("anim").setTabCompleter(new V3Command(service));
        getServer().getPluginManager().registerEvents(new V3Listener(service), this);
        getLogger().info("AnimacjeHub V3 uruchomiony: 50 FX, nick, tytuly, itemy i trolle");
    }
    @Override public void onDisable() { if (service != null) service.close(); }
}
