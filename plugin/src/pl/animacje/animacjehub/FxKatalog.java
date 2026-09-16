package pl.animacje.animacjehub;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public final class FxKatalog {
    public static final class Fx {
        public final int id;
        public final String nazwa;
        public final String hex;
        public final String rodzina;
        public Fx(int id, String nazwa, String hex, String rodzina) {
            this.id = id; this.nazwa = nazwa; this.hex = hex; this.rodzina = rodzina;
        }
        public boolean animowany() { return id > 0; }
        public int[] rgb() {
            String h = hex.startsWith("#") ? hex.substring(1) : hex;
            return new int[] { Integer.parseInt(h.substring(0, 2), 16),
                                Integer.parseInt(h.substring(2, 4), 16),
                                Integer.parseInt(h.substring(4, 6), 16) };
        }
        public String spust() { return "\u00A7x" + hex.substring(1); }
    }

    public static final List<Fx> WSZYSTKIE = new ArrayList<Fx>();
    public static final List<Fx> ANIMOWANE = new ArrayList<Fx>();
    public static final List<Fx> KOLORY = new ArrayList<Fx>();

    private FxKatalog() {}

    @SuppressWarnings("unchecked")
    public static void wczytaj() {
        WSZYSTKIE.clear(); ANIMOWANE.clear(); KOLORY.clear();
        try {
            InputStream in = FxKatalog.class.getResourceAsStream("/fx_katalog.json");
            if (in == null) throw new IllegalStateException("brak fx_katalog.json w jar");
            java.io.ByteArrayOutputStream bo = new java.io.ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int n;
            while ((n = in.read(buf)) > 0) bo.write(buf, 0, n);
            in.close();
            String text = new String(bo.toByteArray(), java.nio.charset.StandardCharsets.UTF_8);
            List<Object> arr = Json.tablica(text);
            for (Object o : arr) {
                Map<String, Object> m = (Map<String, Object>) o;
                Fx fx = new Fx(((Number) m.get("id")).intValue(),
                        (String) m.get("nazwa"), (String) m.get("hex"),
                        m.get("rodzina") == null ? "?" : (String) m.get("rodzina"));
                WSZYSTKIE.add(fx);
                if (fx.animowany()) ANIMOWANE.add(fx); else KOLORY.add(fx);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Fx nazwa(String n) {
        if (n == null) return null;
        String x = n.toLowerCase();
        for (Fx f : WSZYSTKIE) if (f.nazwa.equals(x)) return f;
        return null;
    }

    public static Fx zId(int id) {
        for (Fx f : WSZYSTKIE) if (f.id == id) return f;
        return null;
    }

    public static Fx najblizszy(String hex) {
        String h = hex.startsWith("#") ? hex.substring(1) : hex;
        if (h.length() != 6) return null;
        int[] t = new int[] { Integer.parseInt(h.substring(0, 2), 16),
                              Integer.parseInt(h.substring(2, 4), 16),
                              Integer.parseInt(h.substring(4, 6), 16) };
        Fx best = null;
        long bestD = -1;
        for (Fx f : ANIMOWANE) {
            int[] c = f.rgb();
            long d = (long) (t[0] - c[0]) * (t[0] - c[0])
                   + (long) (t[1] - c[1]) * (t[1] - c[1])
                   + (long) (t[2] - c[2]) * (t[2] - c[2]);
            if (bestD < 0 || d < bestD) { bestD = d; best = f; }
        }
        return best;
    }

    public static Fx kolorDoFx(String hex, boolean animowane) {
        String h = hex.startsWith("#") ? hex.substring(1).toUpperCase() : hex.toUpperCase();
        for (Fx f : KOLORY) if (f.hex.substring(1).equalsIgnoreCase(h)) return f;
        if (!animowane) return null;
        return najblizszy(hex);
    }
}
