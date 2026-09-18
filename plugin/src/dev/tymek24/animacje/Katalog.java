package dev.tymek24.animacje;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.bukkit.plugin.java.JavaPlugin;

/** Katalog FX z fx_katalog.json (w jarze): nazwa -> id, hex, rodzina. */
public final class Katalog {

    public static final class Fx {
        public final int id;
        public final String nazwa;
        public final String hex;
        public final String rodzina;

        Fx(int id, String nazwa, String hex, String rodzina) {
            this.id = id;
            this.nazwa = nazwa;
            this.hex = hex;
            this.rodzina = rodzina;
        }

        public boolean animowany() { return id > 0; }
        public String spust() { return Narzedzia.spust(hex); }
    }

    public static final List<Fx> WSZYSTKIE = new ArrayList<>();
    public static final List<Fx> ANIMOWANE = new ArrayList<>();
    public static final List<Fx> KOLORY = new ArrayList<>();

    private Katalog() {}

    public static void ODSWIEZ() {
        WSZYSTKIE.clear();
        ANIMOWANE.clear();
        KOLORY.clear();
    }

    public static Katalog wczytaj(JavaPlugin plugin) {
        try {
            InputStream in = plugin.getResource("fx_katalog.json");
            if (in == null) throw new IllegalStateException("brak fx_katalog.json w jar");
            ByteArrayOutputStream bo = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int n;
            while ((n = in.read(buf)) > 0) bo.write(buf, 0, n);
            in.close();
            String tekst = new String(bo.toByteArray(), StandardCharsets.UTF_8);
            for (Object o : Json.tablica(tekst)) {
                if (!(o instanceof Map)) continue;
                @SuppressWarnings("unchecked")
                Map<String, Object> m = (Map<String, Object>) o;
                int id = ((Number) m.getOrDefault("id", 0L)).intValue();
                String nazwa = String.valueOf(m.get("nazwa"));
                String hex = String.valueOf(m.get("hex")).replace("#", "");
                String rodzina = m.get("rodzina") == null ? "?" : String.valueOf(m.get("rodzina"));
                Fx fx = new Fx(id, nazwa, hex, rodzina);
                WSZYSTKIE.add(fx);
                if (fx.animowany()) ANIMOWANE.add(fx); else KOLORY.add(fx);
            }
        } catch (Exception e) {
            plugin.getLogger().severe("Nie da sie wczytac katalogu FX: " + e);
        }
        return new Katalog();
    }

    public static Fx poNazwie(String nazwa) {
        if (nazwa == null) return null;
        String n = nazwa.toLowerCase(Locale.ROOT).trim();
        for (Fx f : WSZYSTKIE) if (f.nazwa.equals(n)) return f;
        for (Fx f : WSZYSTKIE) if (f.nazwa.contains(n)) return f;
        return null;
    }

    public static Fx poHex(String hex) {
        if (hex == null) return null;
        String h = hex.startsWith("#") ? hex.substring(1) : hex;
        for (Fx f : WSZYSTKIE) if (f.hex.equalsIgnoreCase(h)) return f;
        return null;
    }

    public static Fx losowyAnimowany() {
        return Narzedzia.los(ANIMOWANE);
    }

    public static int iloscAnimowanych() { return ANIMOWANE.size(); }
    public static int iloscKolorow() { return KOLORY.size(); }
}
