package dev.tymek24.animacje;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.AtomicMoveNotSupportedException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Base64;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Logger;
import org.bukkit.entity.Player;
import org.bukkit.plugin.java.JavaPlugin;

/** Trwały magazyn ustawień graczy. Zapis jest atomowy i nie blokuje czatu na długo. */
public final class ProfileStore {

    private final JavaPlugin plugin;
    private final Logger logger;
    private final Path file;
    private final boolean defaultEnabled;
    private final String defaultFx;
    private final Map<UUID, Profil> profiles = new ConcurrentHashMap<>();

    public ProfileStore(JavaPlugin plugin, Konfig config) {
        this.plugin = plugin;
        this.logger = plugin.getLogger();
        this.file = plugin.getDataFolder().toPath().resolve("profiles.db");
        this.defaultEnabled = config.nickDefaultEnabled();
        this.defaultFx = config.nickDefaultFx();
        load();
    }

    public Profil get(Player player) {
        Profil existing = profiles.computeIfAbsent(player.getUniqueId(), ignored -> fresh());
        Profil copy = existing.kopia();
        if (copy.nick.isEmpty()) copy.nick = player.getName();
        return copy;
    }

    public void setNick(Player player, String nick) {
        update(player, profile -> profile.nick = Narzedzia.ogranicz(nick, 32));
    }

    public void clearNick(Player player) {
        update(player, profile -> profile.nick = "");
    }

    public void setFx(Player player, Katalog.Fx fx) {
        if (fx == null) return;
        update(player, profile -> profile.fx = fx.nazwa);
    }

    public void setColor(Player player, String color) {
        String normalized = Kolory.normalizuj(color);
        update(player, profile -> profile.kolor = normalized == null ? "" : normalized);
    }

    public void clearColor(Player player) {
        update(player, profile -> profile.kolor = "");
    }

    public void setNickEnabled(Player player, boolean enabled) {
        update(player, profile -> profile.nickWlaczony = enabled);
    }

    public void toggleNick(Player player) {
        update(player, profile -> profile.nickWlaczony = !profile.nickWlaczony);
    }

    public void reset(Player player) {
        profiles.remove(player.getUniqueId());
        save();
    }

    public void reload() {
        profiles.clear();
        load();
    }

    private Profil fresh() {
        Profil profile = new Profil();
        profile.nickWlaczony = defaultEnabled;
        profile.fx = defaultFx == null || defaultFx.isBlank() ? "rainbow" : defaultFx;
        return profile;
    }

    private void update(Player player, java.util.function.Consumer<Profil> change) {
        Profil profile = profiles.computeIfAbsent(player.getUniqueId(), ignored -> fresh());
        synchronized (profile) {
            change.accept(profile);
        }
        save();
    }

    private void load() {
        if (!Files.isRegularFile(file)) return;
        try (BufferedReader reader = Files.newBufferedReader(file, StandardCharsets.UTF_8)) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.isBlank() || line.startsWith("#")) continue;
                String[] fields = line.split("\\|", -1);
                if (fields.length < 4) continue;
                try {
                    UUID uuid = UUID.fromString(fields[0]);
                    Profil profile = fresh();
                    profile.nickWlaczony = Boolean.parseBoolean(fields[1]);
                    profile.fx = fields[2].isBlank() ? "rainbow" : fields[2];
                    profile.nick = new String(Base64.getDecoder().decode(fields[3]), StandardCharsets.UTF_8);
                    profile.kolor = fields.length >= 5 && Kolory.normalizuj(fields[4]) != null
                            ? Kolory.normalizuj(fields[4]) : "";
                    profiles.put(uuid, profile);
                } catch (IllegalArgumentException ignored) {
                    logger.warning("Pominięto uszkodzony profil w profiles.db");
                }
            }
        } catch (IOException ex) {
            logger.warning("Nie można wczytać profiles.db: " + ex.getMessage());
        }
    }

    private synchronized void save() {
        try {
            Files.createDirectories(file.getParent());
            Path temp = file.resolveSibling("profiles.db.tmp");
            try (BufferedWriter writer = Files.newBufferedWriter(temp, StandardCharsets.UTF_8)) {
                writer.write("# uuid|nick_wlaczony|fx|nick_base64|kolor");
                writer.newLine();
                for (Map.Entry<UUID, Profil> entry : profiles.entrySet()) {
                    Profil p = entry.getValue().kopia();
                    String nick = Base64.getEncoder().encodeToString(p.nick.getBytes(StandardCharsets.UTF_8));
                    writer.write(entry.getKey() + "|" + p.nickWlaczony + "|" + p.fx + "|" + nick + "|" + p.kolor);
                    writer.newLine();
                }
            }
            try {
                Files.move(temp, file, StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
            } catch (AtomicMoveNotSupportedException ignored) {
                Files.move(temp, file, StandardCopyOption.REPLACE_EXISTING);
            }
        } catch (IOException ex) {
            logger.warning("Nie można zapisać profiles.db: " + ex.getMessage());
        }
    }
}
