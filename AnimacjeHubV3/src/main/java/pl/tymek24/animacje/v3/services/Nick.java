package pl.tymek24.animacje.v3.services;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import pl.tymek24.animacje.v3.*;
import pl.tymek24.animacje.v3.config.*;
import pl.tymek24.animacje.v3.catalog.*;
import pl.tymek24.animacje.v3.services.*;
import pl.tymek24.animacje.v3.gui.*;
import pl.tymek24.animacje.v3.commands.*;
import pl.tymek24.animacje.v3.listeners.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import org.bukkit.entity.Player;
import org.bukkit.plugin.java.JavaPlugin;

/** Animowany nick: przedrostek z kolorem rangi + obrotowy FX na imieniu. */
public final class Nick {

    private final JavaPlugin plugin;
    private final Konfig konfig;
    private final Map<UUID, Boolean> stany = new HashMap<>();

    public Nick(JavaPlugin plugin, Konfig konfig) {
        this.plugin = plugin;
        this.konfig = konfig;
        wczytajPlik();
    }

    public boolean wlaczony(Player p) {
        Boolean b = stany.get(p.getUniqueId());
        return b == null || b; // domyslnie WŁ
    }

    public boolean przelicz(Player p) {
        boolean nowy = !wlaczony(p);
        stany.put(p.getUniqueId(), nowy);
        zapiszPlik();
        return nowy;
    }

    /** FX obrotowy: zmienia sie co nick.odstep_s sekund, inna faza dla kazdego gracza. */
    public Katalog.Fx fxObrotowy(Player p) {
        int n = Katalog.ANIMOWANE.size();
        if (n == 0) return null;
        long sekundy = System.currentTimeMillis() / 1000L;
        int faza = Math.abs(Narzedzia.hash01(p.getUniqueId()).hashCode()) % 97;
        int idx = (int) ((sekundy / konfig.nickOdstepS() + faza) % n);
        return Katalog.ANIMOWANE.get(idx);
    }

    /** Przedrostek czatu dla gracza z wlaczonym nickiem. */
    public String przedrostek(Player p) {
        Katalog.Fx f = fxObrotowy(p);
        return f != null ? f.spust() : "";
    }

    private void wczytajPlik() {
        File f = new File(plugin.getDataFolder(), "gracze.yml");
        if (!f.exists()) return;
        try (InputStream in = new FileInputStream(f)) {
            byte[] buf = new byte[(int) f.length()];
            int c = 0;
            while (c < buf.length) {
                int n = in.read(buf, c, buf.length - c);
                if (n < 0) break;
                c += n;
            }
            for (String linia : new String(buf, "UTF-8").split("\n")) {
                linia = linia.trim();
                if (!linia.contains(":")) continue;
                String[] cz = linia.split(":", 2);
                try {
                    stany.put(UUID.fromString(cz[0].trim()), Boolean.parseBoolean(cz[1].trim()));
                } catch (Exception ignored) {
                }
            }
        } catch (Exception e) {
            plugin.getLogger().warning("Nick: nie da sie wczytac gracze.yml: " + e.getMessage());
        }
    }

    private synchronized void zapiszPlik() {
        File f = new File(plugin.getDataFolder(), "gracze.yml");
        f.getParentFile().mkdirs();
        StringBuilder b = new StringBuilder("# stany animowanego nicku (uuid: true/false)\n");
        for (Map.Entry<UUID, Boolean> e : stany.entrySet()) {
            b.append(e.getKey()).append(": ").append(e.getValue()).append('\n');
        }
        try (OutputStream out = new FileOutputStream(f)) {
            out.write(b.toString().getBytes("UTF-8"));
        } catch (Exception e) {
            plugin.getLogger().warning("Nick: nie da sie zapisac gracze.yml: " + e.getMessage());
        }
    }
}
