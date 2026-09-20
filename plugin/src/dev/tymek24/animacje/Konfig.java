package dev.tymek24.animacje;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.plugin.java.JavaPlugin;

/** Typowany dostęp do config.yml; wartości mają bezpieczne domyślne ustawienia. */
public final class Konfig {
    private final JavaPlugin plugin;

    public Konfig(JavaPlugin plugin) {
        this.plugin = plugin;
        plugin.saveDefaultConfig();
    }

    private FileConfiguration c() {
        return plugin.getConfig();
    }

    public void reload() {
        plugin.reloadConfig();
    }

    public boolean chatEnabled() {
        return c().getBoolean("chat.wlaczone", true);
    }

    /** Kolor zwykłego tekstu po animowanym fragmencie; domyślnie czysta biel. */
    public String baseChatColor() {
        String raw = c().getString("chat.kolor_bazowy", "&f");
        String value = Narzedzia.kody(raw);
        return value.matches("§[0-9a-fk-or]") ? value : "\u00A7f";
    }

    public boolean nickDefaultEnabled() {
        return c().getBoolean("nick.domyslnie_wlaczony", true);
    }

    public String nickDefaultFx() {
        return c().getString("nick.domyslny_fx", "rainbow");
    }

    public int nickMaxLength() {
        return Math.max(3, Math.min(32, c().getInt("nick.maksymalna_dlugosc", 24)));
    }

    public int titleFadeIn() {
        return Math.max(0, c().getInt("title.fade_in", 8));
    }

    public int titleStay() {
        return Math.max(1, c().getInt("title.stay", 50));
    }

    public int titleFadeOut() {
        return Math.max(0, c().getInt("title.fade_out", 12));
    }

    public boolean customEnabled() {
        return c().getBoolean("custom.wlaczone", true);
    }

    public int targetFps() {
        return Math.max(30, Math.min(240, c().getInt("render.target_fps", 60)));
    }

    public boolean rankEnabled() {
        return c().getBoolean("rangi.wlaczone", true);
    }

    public List<String> rankOrder() {
        List<String> raw = c().getStringList("rangi.kolejnosc");
        if (raw.isEmpty()) return List.of("owner", "admin", "moderator", "vip", "op", "default");
        List<String> result = new ArrayList<>();
        for (String value : raw) {
            if (value != null && !value.isBlank()) result.add(value.toLowerCase(Locale.ROOT));
        }
        return result;
    }

    public String rankPrefix(String group) {
        String value = c().getString("rangi.grupy." + group + ".prefix");
        if (value == null) value = c().getString("rangi." + group + ".prefix");
        return value == null ? c().getString("rangi.grupy.default.prefix", "&7[Gracz]") : value;
    }

    public String rankFx(String group) {
        String value = c().getString("rangi.grupy." + group + ".fx");
        if (value == null) value = c().getString("rangi." + group + ".fx");
        return value == null ? c().getString("rangi.grupy.default.fx", "wave") : value;
    }

    public String rankPermissionPrefix() {
        return c().getString("rangi.permission_prefix", "animacje.ranga.");
    }

    public boolean joinMessages() {
        return c().getBoolean("chat.ogloszenia_wejscia", true);
    }

    public boolean announcementsEnabled() {
        return c().getBoolean("ogloszenia.wlaczone", false);
    }

    public int announcementsInterval() {
        return Math.max(30, c().getInt("ogloszenia.odstep_s", 180));
    }

    public List<String> announcements() {
        List<String> result = new ArrayList<>();
        for (String line : c().getStringList("ogloszenia.lista")) result.add(Narzedzia.kody(line));
        return result;
    }

    public int trollCooldown() {
        return Math.max(0, c().getInt("troll.cooldown_s", 5));
    }

    public boolean trollSelf() {
        return c().getBoolean("troll.na_siebie", true);
    }

    public int itemMaxLength() {
        return Math.max(3, Math.min(64, c().getInt("item.maksymalna_dlugosc", 48)));
    }

    public String resourcePackUrl() {
        return c().getString("resourcepack.url", "");
    }

    public String resourcePackSha1() {
        return c().getString("resourcepack.sha1", "");
    }

    public boolean resourcePackRequired() {
        return c().getBoolean("resourcepack.wymagany", false);
    }

    public String resourcePackPrompt() {
        return Narzedzia.kody(c().getString("resourcepack.prompt", "&dWłącz Animacje 3.0, aby widzieć efekty!"));
    }

    public String packName() {
        return c().getString("resourcepack.nazwa", "Animacje3.0.zip");
    }
}
