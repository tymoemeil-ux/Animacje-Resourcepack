package dev.tymek24.animacje;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Logger;
import org.bukkit.plugin.java.JavaPlugin;

/** Jeden katalog packa v pluginie — v2 nie zna usuniętych efektów z 2.0. */
public final class Katalog {

    public static final class Fx {
        public final int id;
        public final String nazwa;
        public final String hex;
        public final String rodzina;
        public final String opis;
        public final boolean nowosc;

        Fx(int id, String nazwa, String hex, String rodzina, String opis, boolean nowosc) {
            this.id = id;
            this.nazwa = nazwa;
            this.hex = Narzedzia.hex(hex);
            this.rodzina = rodzina;
            this.opis = opis;
            this.nowosc = nowosc;
        }

        public String spust() {
            return Narzedzia.spust(hex);
        }

        public boolean animowany() {
            return id > 0;
        }
    }

    private static final List<Fx> ALL = new ArrayList<>();
    private static final List<Fx> ANIMATED = new ArrayList<>();
    private static final Logger LOG = java.util.logging.Logger.getLogger("AnimacjeHub");

    private Katalog() {
    }

    public static synchronized void load(JavaPlugin plugin) {
        List<Fx> loaded = new ArrayList<>();
        try (InputStream in = plugin.getResource("fx_katalog.json")) {
            if (in == null) throw new IllegalStateException("brak fx_katalog.json w jarze");
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int count;
            while ((count = in.read(buffer)) > 0) bytes.write(buffer, 0, count);
            for (Object object : Json.tablica(bytes.toString(StandardCharsets.UTF_8))) {
                if (!(object instanceof Map)) continue;
                @SuppressWarnings("unchecked") Map<String, Object> row = (Map<String, Object>) object;
                int id = number(row.get("id"));
                if (id <= 0) continue;
                String name = string(row.get("nazwa"));
                if (name.isBlank()) continue;
                loaded.add(new Fx(id, name, string(row.get("hex")), string(row.get("rodzina")),
                        string(row.get("opis")), Boolean.parseBoolean(string(row.get("nowosc")))));
            }
        } catch (Exception ex) {
            plugin.getLogger().severe("Nie można wczytać katalogu Animacje 3.0: " + ex.getMessage());
            return;
        }
        Set<String> names = new HashSet<>();
        Set<String> colors = new HashSet<>();
        for (Fx fx : loaded) {
            if (!names.add(fx.nazwa.toLowerCase(Locale.ROOT)) || !colors.add(fx.hex)) {
                plugin.getLogger().severe("Katalog zawiera duplikat: " + fx.nazwa + "/" + fx.hex);
                return;
            }
        }
        if (loaded.size() != 50) {
            plugin.getLogger().severe("Animacje 3.0 musi mieć 50 efektów, znaleziono " + loaded.size());
            return;
        }
        loaded.sort(java.util.Comparator.comparingInt(fx -> fx.id));
        ALL.clear();
        ALL.addAll(loaded);
        ANIMATED.clear();
        ANIMATED.addAll(loaded);
        LOG.info("Katalog Animacje 3.0: 50 efektów");
    }

    public static synchronized List<Fx> all() {
        return Collections.unmodifiableList(new ArrayList<>(ALL));
    }

    public static synchronized List<Fx> animated() {
        return Collections.unmodifiableList(new ArrayList<>(ANIMATED));
    }

    public static synchronized Fx byName(String name) {
        if (name == null) return null;
        String wanted = name.toLowerCase(Locale.ROOT).trim();
        for (Fx fx : ALL) if (fx.nazwa.equalsIgnoreCase(wanted)) return fx;
        return null;
    }

    public static synchronized Fx random() {
        return ANIMATED.isEmpty() ? null : ANIMATED.get(ThreadLocalRandom.current().nextInt(ANIMATED.size()));
    }

    public static int count() {
        return ANIMATED.size();
    }

    private static int number(Object value) {
        return value instanceof Number ? ((Number) value).intValue() : 0;
    }

    private static String string(Object value) {
        return value == null ? "" : String.valueOf(value);
    }
}
