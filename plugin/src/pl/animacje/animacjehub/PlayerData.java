package pl.animacje.animacjehub;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;
import java.util.UUID;

public final class PlayerData {
    public String nick = "";
    public String nickFx = "";
    public String itemFx = "";
    public String trollFx = "";
    public String ogloszenieFx = "";
    public boolean dzwieki = true;

    public boolean maNick() { return nick != null && nick.length() > 0; }

    public static PlayerData wczytaj(File plik) {
        PlayerData d = new PlayerData();
        try {
            if (!plik.isFile()) return d;
            InputStream in = new FileInputStream(plik);
            java.io.ByteArrayOutputStream bo = new java.io.ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int n;
            while ((n = in.read(buf)) > 0) bo.write(buf, 0, n);
            in.close();
            String text = new String(bo.toByteArray(), java.nio.charset.StandardCharsets.UTF_8);
            Map<String, Object> m = Json.obiekt(text);
            d.nick = s(m, "nick");
            d.nickFx = s(m, "nick_fx");
            d.itemFx = s(m, "item_fx");
            d.trollFx = s(m, "troll_fx");
            d.ogloszenieFx = s(m, "ogloszenie_fx");
            Object dz = m.get("dzwieki");
            d.dzwieki = dz == null || Boolean.TRUE.equals(dz);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return d;
    }

    public void zapisz(File plik) {
        try {
            plik.getParentFile().mkdirs();
            String s = "{\n  \"nick\": " + Json.tekst(nick) + ",\n"
                    + "  \"nick_fx\": " + Json.tekst(nickFx) + ",\n"
                    + "  \"item_fx\": " + Json.tekst(itemFx) + ",\n"
                    + "  \"troll_fx\": " + Json.tekst(trollFx) + ",\n"
                    + "  \"ogloszenie_fx\": " + Json.tekst(ogloszenieFx) + ",\n"
                    + "  \"dzwieki\": " + dzwieki + "\n}\n";
            OutputStream out = new FileOutputStream(plik);
            out.write(s.getBytes(java.nio.charset.StandardCharsets.UTF_8));
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static String s(Map<String, Object> m, String k) {
        Object o = m.get(k);
        return o == null ? "" : o.toString();
    }

    public static File plik(UUID uuid) {
        return new File(new File(new File("."), "plugins"), "AnimacjeHub/dane/" + uuid + ".json");
    }
}
